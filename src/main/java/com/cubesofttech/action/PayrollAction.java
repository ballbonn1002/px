package com.cubesofttech.action;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jfree.util.Log;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Payment;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserPaymentConfig;
import com.cubesofttech.service.CalcService;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PayrollAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(PaymentTypeAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserPaymentConfigDAO userpaymentconfigDAO;

	@Autowired
	private Payment_groupDAO payment_groupDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private PaymentDAO paymentDAO;

	@Autowired
	private Employee_typeDAO employee_typeDAO;

	@Autowired
	private Payment_typeDAO payment_typeDAO;

	@Autowired
	private FunctionDAO functionDAO;

	@Autowired
	private CalcService calCService;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String listPayroll() {
		try {
			List<Map<String, Object>> payment = paymentDAO.findAllByGroupId();
			List<Map<String, Object>> status = paymentDAO.countStatus();
			// log.debug(payment);
			// log.debug(status);
			request.setAttribute("payment", payment);
			request.setAttribute("status", status);

			List<User> user = userDAO.findAllPayroll();
			request.setAttribute("userList", user);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}
	}

	public String formPayroll() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login
			String paymentGroupId = request.getParameter("paymentGroupId");
			Payment_group paymentGroup = payment_groupDAO.findById(Integer.parseInt(paymentGroupId));
			request.setAttribute("paymentGroup", paymentGroup);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;

	}

	public String getTable() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login
			String paymentGroupId = request.getParameter("paymentGroupId");

			
			List<Map<String, Object>> baseData = paymentDAO.getPaymentTable(Integer.parseInt(paymentGroupId));
			JSONArray ja = new JSONArray();
			
			Payment_group paymentGroup = payment_groupDAO.findById(Integer.parseInt(paymentGroupId));
			// iterate BaseData
			for (int i = 0; i < baseData.size(); i++) {
				JSONObject jo = new JSONObject();
				//ลำดับ
				jo.put("index", i + 1);
				//ชื่อ
				jo.put("name", baseData.get(i).get("name"));
				//Employee Type
				jo.put("employeeType", baseData.get(i).get("employee_type_name"));
				//วันทำงาน
				Map<String, Object> userWorkingSummary = functionDAO.findWorkingSummary((String)(baseData.get(i).get("user_id")), paymentGroup.getStart_date().toString(), paymentGroup.getEnd_date().toString()).get(0);
				if (userWorkingSummary.get("payment").equals("0")) {
					jo.put("term",userWorkingSummary.get("actual_working_day") + "/" + userWorkingSummary.get("term_day"));
				}
				else {
					jo.put("term",userWorkingSummary.get("actual_working_day") + "/" + userWorkingSummary.get("working_day"));
				}
				
				// status
				jo.put("status", baseData.get(i).get("status"));
				//วันทำงาน
				jo.put("workingDays",userWorkingSummary.get("actual_working_day"));
				//ชี่วโมงทำงานจริง
				jo.put("workingHours", userWorkingSummary.get("sum_emp_working_hr"));
				//ขาดงาน
				jo.put("absent", baseData.get(i).get("absent"));
				//ลางานไม่รับค่าจ้าง
				jo.put("absence", baseData.get(i).get("absence"));
				
				
				
				List<UserPaymentConfig> userPayment = userpaymentconfigDAO
						.findAllByUser((String) baseData.get(i).get("user_id"));

				// Payment_type
				List<Payment_type> paymentType = payment_typeDAO.findAll();
				JSONArray incomeArray = new JSONArray();
				JSONArray expenseArray = new JSONArray();
				
				double salary = 0;
				double income = 0;
				double totaloutcome = 0;

				for (int j = 0; j < paymentType.size(); j++) {
					JSONObject paymentObject = new JSONObject();
					paymentObject.put("payment_type_id", paymentType.get(j).getPayment_type_id());
					paymentObject.put("payment_type_name", paymentType.get(j).getPayment_type_name());
					double amount = 0.0;
					switch (paymentType.get(j).getPayment_type_id()) {
					case "SL":
						salary = 5000;
						paymentObject.put("amount", 5000);
						incomeArray.add(paymentObject);
						break;
					case "SSI":
						amount = calCService.calSsi(Double.parseDouble(paymentGroup.getSocial_security()),(String)(baseData.get(i).get("user_id")));
						totaloutcome = totaloutcome + amount;
						paymentObject.put("amount",amount);
						expenseArray.add(paymentObject);
						break;
					case "TAX":
						amount = calCService.calTaxPerMonth((String)(baseData.get(i).get("user_id")));
						totaloutcome = totaloutcome + amount;
						paymentObject.put("amount",amount);
						expenseArray.add(paymentObject);
						break;
					default:
						boolean noValue = true;
						for (int k = 0; k < userPayment.size(); k++) {
							if (userPayment.get(k).getPaymentypeId().equals(paymentType.get(j).getPayment_type_id())) {
								noValue = false;
								paymentObject.put("amount", userPayment.get(k).getAmount());
								break;
							}
						}

						if (noValue) {
							paymentObject.put("amount", 0);
						}

						if (paymentType.get(j).getType().equals("0")) {
							totaloutcome = totaloutcome + Double.parseDouble(paymentObject.get("amount").toString());
							expenseArray.add(paymentObject);
						} else if (paymentType.get(j).getType().equals("1")) {
							income = income + Double.parseDouble(paymentObject.get("amount").toString());
							incomeArray.add(paymentObject);
						}
						
					}
				}

				jo.put("income", incomeArray);
				jo.put("expense", expenseArray);
				
				//เงินเดือน
				jo.put("salary", salary);
				jo.put("totalincome", income);
				jo.put("totaloutcome", totaloutcome);
				jo.put("totalamount", salary + income - totaloutcome);
				
				

				ja.add(jo);

			}
			JSONObject result = new JSONObject();
			result.put("data", ja);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(result);
			// log.debug("result =" + json);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}

	public String addPayroll() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login

			java.sql.Date currentDate = new java.sql.Date(Calendar.getInstance().getTime().getTime()); // current Date
			// log.debug(currentDate);
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.set(Calendar.DATE, 1);
			c2.set(Calendar.DATE, c2.getActualMaximum(Calendar.DATE));
			java.sql.Date sDate = new java.sql.Date(c1.getTime().getTime()); // fistDayOfMonth Date
			java.sql.Date eDate = new java.sql.Date(c2.getTime().getTime()); // lastDayOfMonth Date

			YearMonth yearMonthObject = YearMonth.now();
			// log.debug(sDate);
			// log.debug(eDate);

			// ------ Add Payment_group ------//
			Integer pgMaxId = payment_groupDAO.getMaxId() + 1;
			Payment_group payment_group = new Payment_group();

			payment_group.setPayment_group_id(pgMaxId);
			payment_group.setName("Payroll " + yearMonthObject.format(DateTimeFormatter.ofPattern("MMMM yyyy")));
			payment_group.setTransaction_date(currentDate);
			payment_group.setPayment_date(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
			payment_group.setStart_date(sDate);
			payment_group.setEnd_date(eDate);
			payment_group.setSocial_security("5");
			payment_group.setDescription(null);
			payment_group.setStatus("1");
			payment_group.setSystem("1");
			payment_group.setUser_create(logonUser);
			payment_group.setUser_update(logonUser);
			payment_group.setTimeCreate(DateUtil.getCurrentTime());
			payment_group.setTimeUpdate(DateUtil.getCurrentTime());
			payment_groupDAO.save(payment_group);

			// ------ Add Payment ------//
			String userList = request.getParameter("userList");
			JSONParser parser = new JSONParser();
			JSONArray a = (JSONArray) parser.parse(userList);
			ArrayList<String> userListarr = new ArrayList<String>();

			for (Object o : a) {
				JSONObject user = (JSONObject) o;
				userListarr.add((String) user.get("name"));
			}

			String paymentGroupId = Integer.toString(pgMaxId);

			for (String userId : userListarr) {
				log.debug(userId);
				Payment payment = new Payment();
				// log.debug("userId = " + userId);
				User findUser = userDAO.findById(userId);
				Integer pMaxId = paymentDAO.getMaxId() + 1;
				// log.debug("pMaxId = " + pMaxId);
				payment.setPayment_id(pMaxId);
				payment.setPayment_group_id(paymentGroupId);
				payment.setUser_id(userId);
				payment.setEmployee_type_id(findUser.getEmployee_type_id());
				if (findUser.getEmployee_type_id() != null) {
					Employee_type empType = employee_typeDAO.findById(Integer.parseInt(findUser.getEmployee_type_id()));
					payment.setEmployee_type_name(empType.getName());
				} else {
					payment.setEmployee_type_name(null);
				}

				String pattern = "yyyy-MM-dd";
				SimpleDateFormat df = new SimpleDateFormat(pattern);
				String sDateAsString = df.format(sDate);
				String eDateAsString = df.format(eDate);
				List<Map<String, Object>> workingSummary = functionDAO.findWorkingSummary(userId, sDateAsString,
						eDateAsString);
				// log.debug("Working Summarry = " +
				// workingSummary.get(0).get("actual_working_day"));

				payment.setActual_day(workingSummary.get(0).get("actual_working_day").toString());

				// ----- calculate salary -----//
				BigDecimal salary = null;
				BigDecimal salary_day = new BigDecimal(calCService.calculateSalaryPerDay(userId));
				// log.debug("salary_day = " + salary_day);
				if (salary_day.equals(null)) {
					salary_day = BigDecimal.ZERO;
				}
				// log.debug("salary_day = " + salary_day);
				BigDecimal actual_day = new BigDecimal((String) workingSummary.get(0).get("actual_working_day"));
				if (actual_day.equals(null)) {
					actual_day = BigDecimal.ZERO;
				}
				// log.debug("actual_day = " + actual_day);
				salary = actual_day.multiply(salary_day);
				if (salary.equals(null)) {
					salary = BigDecimal.ZERO;
				}
				BigDecimal roundingSalary = salary.setScale(0, RoundingMode.HALF_UP);
				// log.debug("roundingSalary = " + roundingSalary);

				payment.setSalary(roundingSalary);

				// ----- income&expend net -----//
				List<Map<String, Object>> incomeNetList = userpaymentconfigDAO.sumIncomeById(userId);
				List<Map<String, Object>> expendNetList = userpaymentconfigDAO.sumExpendById(userId);

				BigDecimal incomeNet = (BigDecimal) incomeNetList.get(0).get("total");
				BigDecimal expendNet = (BigDecimal) expendNetList.get(0).get("total");
				if (incomeNet == null) {
					incomeNet = BigDecimal.ZERO;
				}
				if (expendNet == null) {
					expendNet = BigDecimal.ZERO;
				}
				// log.debug("expendNet = " + expendNet);
				// log.debug("incomeNet = " + incomeNet);
				payment.setIncome_net(incomeNet);
				payment.setExpend_net(expendNet);

				// ----- calculate total -----//
				BigDecimal totalPay = roundingSalary.add(incomeNet).subtract(expendNet);
				// log.debug("totalPay = " + totalPay);
				payment.setTotal_pay(totalPay);

				payment.setStatus("0");
				payment.setRemark(null);
				payment.setUser_create(logonUser);
				payment.setUser_update(logonUser);
				payment.setTime_create(DateUtil.getCurrentTime());
				payment.setTime_update(DateUtil.getCurrentTime());
				payment.setActual_hours("0:00");
				payment.setLate("0:00");
				payment.setAbsent("0:00");
				payment.setAbsence("0:00");
				payment.setOT1("0:00");
				payment.setOT2("0:00");
				payment.setOT3("0:00");
				paymentDAO.save(payment);
				// log.debug("payment = " + payment);
				// log.debug("save success!!!");

			}
			Map<String, String> obj = new HashMap<>();
			obj.put("id", pgMaxId.toString());
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();

			return ERROR;
		}
	}

}
