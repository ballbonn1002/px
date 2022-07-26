package com.cubesofttech.action;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Debug;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_detailDAO;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Payment;
import com.cubesofttech.model.Payment_detail;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserPaymentConfig;
import com.cubesofttech.service.CalcService;
import com.cubesofttech.util.Convert;
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

	@Autowired
	private Payment_detailDAO payment_detailDAO;

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

			List<Map<String, Object>> user = userDAO.findAllDuplicatePayroll(paymentGroupId);
			request.setAttribute("userList", user);

			List<Map<String, Object>> status = paymentDAO.getStatusByGroupId(paymentGroupId);
			List<Map<String, Object>> payment = paymentDAO.getTotalPayByGroupId(paymentGroupId);

			request.setAttribute("status", status);
			request.setAttribute("payment", payment);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

	public String cancelPayrollGroup() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login
			String paymentGroupId = request.getParameter("paymentGroupId");
			Map<String, String> obj = new HashMap<>();
			Payment_group payment_group = payment_groupDAO.findById(Integer.parseInt(paymentGroupId));
			log.debug(paymentDAO);
			if (payment_group.getStatus().equals("2") || payment_group.getStatus().equals("3")
					|| payment_group.getStatus().equals("4")) {
				obj.put("status", "0");
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String json = gson.toJson(obj);
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				out.close();
				return null;
			}
			payment_group.setStatus("0");
			payment_group.setSystem("0");
			payment_group.setUser_update(logonUser);
			payment_group.setTimeUpdate(DateUtil.getCurrentTime());
			payment_groupDAO.update(payment_group);
			obj.put("status", "1");
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
				Map<String, Object> monthYearObject = payment_groupDAO.getMonthYearByIdnUserId(
						Integer.parseInt(paymentGroupId), (String) baseData.get(i).get("user_id"));
				int month = (int) monthYearObject.get("month");
				int year = (int) monthYearObject.get("year");
				if (month == 1) {
					month = 12;
					year = year - 1;
				} else {
					month = month - 1;
				}
				Map<String, Object> remark = paymentDAO.getRemarkByDatenUserId(month, year,
						(String) baseData.get(i).get("user_id"));
				// log.debug("remark = " + remark);
				if (Objects.isNull(remark)) {
					jo.put("historyRemark", "-");
				} else if (Objects.isNull(remark.get("remark"))) {
					jo.put("historyRemark", "-");
				} else {
					jo.put("historyRemark", remark.get("remark"));
				}

				// id
				jo.put("id", baseData.get(i).get("user_id"));
				// payment_id
				jo.put("payment_id", baseData.get(i).get("payment_id"));
				// ชื่อ
				jo.put("name", baseData.get(i).get("name"));
				// Employee Type
				jo.put("employeeType", baseData.get(i).get("employee_type_name"));
				// วันทำงาน
				Map<String, Object> userWorkingSummary = functionDAO
						.findWorkingSummary((String) (baseData.get(i).get("user_id")),
								paymentGroup.getStart_date().toString(), paymentGroup.getEnd_date().toString())
						.get(0);
				if (userWorkingSummary.get("payment").equals("0")) {
					jo.put("term", baseData.get(i).get("actual_day") + "/" + userWorkingSummary.get("term_day"));
				} else {
					jo.put("term", baseData.get(i).get("actual_day") + "/" + userWorkingSummary.get("working_day"));
				}

				// status
				String status = "";
				switch ((String) baseData.get(i).get("status")) {
				case "0":
					status = "inprogress";
					break;
				case "1":
					status = "waiting to pay";
					break;
				case "2":
					status = "confirm";
					break;
				}
				jo.put("status", status);
				
				jo.put("groupStatus", paymentGroup.getStatus());
				// วันทำงาน
				jo.put("workingDays", baseData.get(i).get("actual_day"));
				// ชี่วโมงทำงานจริง
				jo.put("workingHours", baseData.get(i).get("actual_hours"));
				// ขาดงาน
				jo.put("absent", baseData.get(i).get("absent"));
				// ลางานไม่รับค่าจ้าง
				jo.put("absence", baseData.get(i).get("absence"));
				// remark
				if (Objects.isNull(baseData.get(i).get("remark"))) {
					jo.put("remark", "");
				} else {
					jo.put("remark", baseData.get(i).get("remark"));
				}

				jo.put("ot1", baseData.get(i).get("OT1"));
				jo.put("ot2", baseData.get(i).get("OT2"));
				jo.put("ot3", baseData.get(i).get("OT3"));

				List<Payment_detail> paymentDetail = payment_detailDAO.searchPaymentDetailByPidnUid(
						((BigInteger) baseData.get(i).get("payment_id")).toString(),
						(String) baseData.get(i).get("user_id"));
				// log.debug("paymentDetailLEL = " + paymentDetail);

				List<UserPaymentConfig> userPayment = userpaymentconfigDAO
						.findAllByUser((String) baseData.get(i).get("user_id"));

				// Payment_type
				List<Payment_type> paymentType = payment_typeDAO.findAll();
				JSONArray incomeArray = new JSONArray();
				JSONArray expenseArray = new JSONArray();

				double salary = 0;
				double income = 0;
				double totalexpense = 0;

				for (int j = 0; j < paymentType.size(); j++) {
					JSONObject paymentObject = new JSONObject();
					paymentObject.put("payment_type_id", paymentType.get(j).getPayment_type_id());
					paymentObject.put("payment_type_name", paymentType.get(j).getPayment_type_name());
					double amount = 0.0;
					boolean hasPayment = false;
					switch (paymentType.get(j).getPayment_type_id()) {
					case "SL":
						for (Payment_detail payment : paymentDetail) {
							if (payment.getPayment_type_id().equals("SL")) {
								hasPayment = true;
								salary = payment.getAmount().doubleValue();
								break;
							}
						}
						if (!hasPayment) {
							salary = calCService.calculateSalaryPerDay((String) (baseData.get(i).get("user_id")))
									* Double.parseDouble((String) (userWorkingSummary.get("actual_working_day")));
						}
						log.debug("salary = " + salary);
						paymentObject.put("amount", salary);
						incomeArray.add(paymentObject);
						break;
					case "SSI":
						for (Payment_detail payment : paymentDetail) {
							if (payment.getPayment_type_id().equals("SSI")) {
								hasPayment = true;
								amount = payment.getAmount().doubleValue();
								break;
							}
						}
						if (!hasPayment) {
							amount = calCService.calSsi(Double.parseDouble(paymentGroup.getSocial_security()),
									(String) (baseData.get(i).get("user_id")));
						}
						totalexpense = totalexpense + amount;
						paymentObject.put("amount", amount);
						expenseArray.add(paymentObject);
						break;
					case "TAX":
						for (Payment_detail payment : paymentDetail) {
							if (payment.getPayment_type_id().equals("TAX")) {
								hasPayment = true;
								amount = payment.getAmount().doubleValue();
								break;
							}
						}
						if (!hasPayment) {
							amount = calCService.calTaxPerMonth((String) (baseData.get(i).get("user_id")));
						}
						totalexpense = totalexpense + amount;
						paymentObject.put("amount", amount);
						expenseArray.add(paymentObject);
						break;
					default:
						boolean noValue = true;
						for (int k = 0; k < paymentDetail.size(); k++) {
							if (paymentDetail.get(k).getPayment_type_id()
									.equals(paymentType.get(j).getPayment_type_id())) {
								noValue = false;
								paymentObject.put("amount", paymentDetail.get(k).getAmount().doubleValue());
								break;
							}
						}
						for (int k = 0; k < userPayment.size(); k++) {
							if (userPayment.get(k).getPaymentypeId().equals(paymentType.get(j).getPayment_type_id())
									&& noValue) {
								noValue = false;
								paymentObject.put("amount", userPayment.get(k).getAmount());
								break;
							}
						}

						if (noValue) {
							paymentObject.put("amount", 0);
						}

						if (paymentType.get(j).getType().equals("0")) {
							totalexpense = totalexpense + Double.parseDouble(paymentObject.get("amount").toString());
							expenseArray.add(paymentObject);
						} else if (paymentType.get(j).getType().equals("1")) {
							income = income + Double.parseDouble(paymentObject.get("amount").toString());
							incomeArray.add(paymentObject);
						}

					}
				}

				jo.put("income", incomeArray);
				jo.put("expense", expenseArray);

				// เงินเดือน
				jo.put("salary", salary);
				// log.debug("OT " +
				// calCService.calculateOT((String)(baseData.get(i).get("user_id")), "1:30",
				// 1.2));
				jo.put("totalincome", income);
				jo.put("totalexpense", totalexpense);
				jo.put("totalamount", salary + income - totalexpense);

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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String editPayroll() {
		Map<String, String> obj = new HashMap<>();
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login

			// update Payment Group
			String paymentGroupId = request.getParameter("paymentGroupId");
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.set(Calendar.DATE, 1);
			c2.set(Calendar.DATE, c2.getActualMaximum(Calendar.DATE));
			java.sql.Date sDate = new java.sql.Date(c1.getTime().getTime()); // fistDayOfMonth Date
			java.sql.Date eDate = new java.sql.Date(c2.getTime().getTime()); // lastDayOfMonth Date

			// ------ Add Payment_group ------//
			Payment_group payment_group = payment_groupDAO.findById(Integer.parseInt(paymentGroupId));
			payment_group.setUser_update(logonUser);
			payment_group.setTimeUpdate(DateUtil.getCurrentTime());
			payment_groupDAO.update(payment_group);

			// CheckUser
			String userList = request.getParameter("userList");
			JSONParser parser = new JSONParser();
			JSONArray a = (JSONArray) parser.parse(userList);
			ArrayList<String> userListarr = new ArrayList<String>();
			ArrayList<String> addUserArr = new ArrayList<String>();
			ArrayList<Payment> deleteUserArr = new ArrayList<Payment>();
			for (Object o : a) {
				JSONObject user = (JSONObject) o;
				userListarr.add((String) user.get("name"));
			}
			// log.debug("userListarr = " + userListarr);

			List<Payment> allPayment = paymentDAO.findAllByGroupId(paymentGroupId);
			log.debug("payment = " + allPayment);

			for (Payment pay : allPayment) {
				boolean hasPayment = false;
				for (String userId : userListarr) {
					if (pay.getUser_id().equals(userId)) {
						hasPayment = true;
						break;
					}
				}
				if (!hasPayment) {
					deleteUserArr.add(pay);
				}
			}

			for (String userId : userListarr) {
				boolean hasUser = false;
				for (Payment pay : allPayment) {
					if (userId.equals(pay.getUser_id())) {
						hasUser = true;
						break;
					}
				}
				if (!hasUser) {
					addUserArr.add(userId);
				}
			}

			// log.debug("deleteUserArr = " + deleteUserArr);
			// log.debug("addUserArr = " + addUserArr);

			// Delete Payment
			for (Payment pay : deleteUserArr) {
				List<Payment_detail> payment_detail = payment_detailDAO
						.searchPaymentDetailByPidnUid(pay.getPayment_id().toString(), pay.getUser_id());
				for (Payment_detail detail : payment_detail) {
					payment_detailDAO.delete(detail);
				}
				paymentDAO.delete(pay);
			}

			for (String userId : addUserArr) {
				// log.debug(userId);
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

				List<Payment_type> paymentType = payment_typeDAO.findAll();
				double saveOutcome_net = 0;
				for (int i = 0; i < paymentType.size(); i++) {
					switch (paymentType.get(i).getPayment_type_id()) {
					case "SSI":
						saveOutcome_net = calCService.calSsi(Double.parseDouble(payment_group.getSocial_security()),
								userId) + saveOutcome_net;
						break;
					case "TAX":
						saveOutcome_net = calCService.calTaxPerMonth(userId) + saveOutcome_net;
						break;
					}
				}

				BigDecimal incomeNet = (BigDecimal) incomeNetList.get(0).get("total");
				BigDecimal expendNet = (BigDecimal) expendNetList.get(0).get("total");
				BigDecimal extraExpendNet = new BigDecimal(saveOutcome_net);
				if (incomeNet == null) {
					incomeNet = BigDecimal.ZERO;
				}
				if (expendNet == null) {
					expendNet = BigDecimal.ZERO;
				}
				expendNet = expendNet.add(extraExpendNet);
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
			obj.put("status", "1");
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
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
				// log.debug(userId);
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

				List<Payment_type> paymentType = payment_typeDAO.findAll();
				double saveOutcome_net = 0;
				for (int i = 0; i < paymentType.size(); i++) {
					switch (paymentType.get(i).getPayment_type_id()) {
					case "SSI":
						saveOutcome_net = calCService.calSsi(Double.parseDouble(payment_group.getSocial_security()),
								userId) + saveOutcome_net;
						break;
					case "TAX":
						saveOutcome_net = calCService.calTaxPerMonth(userId) + saveOutcome_net;
						break;
					}
				}

				BigDecimal incomeNet = (BigDecimal) incomeNetList.get(0).get("total");
				BigDecimal expendNet = (BigDecimal) expendNetList.get(0).get("total");
				BigDecimal extraExpendNet = new BigDecimal(saveOutcome_net);

				if (incomeNet == null) {
					incomeNet = BigDecimal.ZERO;
				}
				if (expendNet == null) {
					expendNet = BigDecimal.ZERO;
				}

				expendNet = expendNet.add(extraExpendNet);
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

		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public String payrollCalculator() {
		try {

			String function = request.getParameter("function");
			String userId = request.getParameter("id");
			String value = request.getParameter("value");
			System.out.println(function + userId + value);
			JSONObject jo = new JSONObject();
			double result = 0.00;
			switch (function) {
			case "SL":
				result = Double.parseDouble(value) * calCService.calculateSalaryPerDay(userId);
				break;
			case "ABSENT":
				result = Double.parseDouble(value) * calCService.calculateSalaryPerDay(userId);
				break;
			case "ABSENCE":
				result = Double.parseDouble(value) * calCService.calculateSalaryPerDay(userId);
				break;
			case "OT1":
				result = calCService.calculateOT(userId, value, 1.5);
				break;
			case "OT2":
				result = calCService.calculateOT(userId, value, 2.0);
				break;
			case "OT3":
				result = calCService.calculateOT(userId, value, 3.0);
				break;
			}
			jo.put("amount", result);
			PrintWriter out = response.getWriter();
			out.print(jo);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public String userPayment() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username logi
			String data = request.getParameter("data");
			String function = request.getParameter("function");
			JSONParser parser = new JSONParser();
			JSONObject jsonData = (JSONObject) parser.parse(data);
			// log.debug(jsonData+" "+function);
			JSONObject jo = new JSONObject();
			// log.debug(jsonData.get("name"));
			List<Payment_detail> payment_detail = payment_detailDAO.searchPaymentDetailByPidnUid(
					String.valueOf((long) (jsonData.get("payment_id"))), (String) (jsonData.get("id")));
			Payment payment = paymentDAO.findById((int) ((long) (jsonData.get("payment_id"))));
			// log.debug(payment_detail);
			JSONArray jaIncome = (JSONArray) jsonData.get("income");
			JSONArray jaExpense = (JSONArray) jsonData.get("expense");

			JSONArray jatotal = new JSONArray();
			jatotal.addAll(jaIncome);
			jatotal.addAll(jaExpense);

			String status = "0";
			switch (function) {
			case "save-payment":
				status = "0";
				break;
			case "confirm-payment":
				status = "2";
				break;
			case "waiting-payment":
				status = "1";
				break;
			default:
				status = "-1";
			}
			if (!status.equals("-1")) {

				payment.setSalary(new BigDecimal(((Number) (jsonData.get("salary"))).doubleValue()));
				payment.setIncome_net(new BigDecimal(((Number) (jsonData.get("totalincome"))).doubleValue()));
				payment.setExpend_net(new BigDecimal(((Number) (jsonData.get("totalexpense"))).doubleValue()));
				payment.setTotal_pay(new BigDecimal(((Number) (jsonData.get("totalamount"))).doubleValue()));

				payment.setActual_day((String) jsonData.get("workingDays"));
				// payment.setActual_hours();
				payment.setAbsent((String) jsonData.get("absent"));
				payment.setAbsence((String) jsonData.get("absence"));
				payment.setOT1((String) jsonData.get("ot1"));
				payment.setOT2((String) jsonData.get("ot2"));
				payment.setOT3((String) jsonData.get("ot3"));
				payment.setRemark((String) jsonData.get("remark"));

				payment.setUser_update(logonUser);
				payment.setTime_update(DateUtil.getCurrentTime());
				payment.setStatus(status);

				paymentDAO.update(payment);

				for (Object o : jatotal) {
					boolean hasPayment = false;
					JSONObject object = (JSONObject) o;

					for (Payment_detail p : payment_detail) {
						if (p.getPayment_type_id().equals(object.get("payment_type_id"))) {
							BigDecimal _a = new BigDecimal(object.get("amount").toString());
							p.setAmount(_a);
							p.setTime_update(DateUtil.getCurrentTime());
							p.setUser_update(logonUser);
							payment_detailDAO.update(p);
							hasPayment = true;
							break;
						}
					}
					if (!hasPayment) {
						Payment_detail p = new Payment_detail();
						p.setPayment_id(String.valueOf((long) (jsonData.get("payment_id"))));
						p.setUser_id((String) (jsonData.get("id")));
						p.setPayment_type_id(object.get("payment_type_id").toString());
						p.setAmount(new BigDecimal(object.get("amount").toString()));
						p.setUser_update(logonUser);
						p.setUser_create(logonUser);
						p.setTime_create(DateUtil.getCurrentTime());
						p.setTime_update(DateUtil.getCurrentTime());
						payment_detailDAO.save(p);
					}
				}
			}
			List<Map<String, Object>> gStatus = paymentDAO.getStatusByGroupId(payment.getPayment_group_id());
			List<Map<String, Object>> gPayment = paymentDAO.getTotalPayByGroupId(payment.getPayment_group_id());
			// log.debug(gStatus);
			// log.debug(gPayment);
			JSONArray ja = new JSONArray();
			int inprogress = 0;
			int waiting = 0;
			int confirm = 0;
			for (int i = 0; i < gStatus.size(); i++) {
				if (gStatus.get(i).get("status").equals("0")) {
					inprogress = inprogress + 1;
				} else if (gStatus.get(i).get("status").equals("1")) {
					waiting = waiting + 1;
				} else if (gStatus.get(i).get("status").equals("2")) {
					confirm = confirm + 1;
				}
			}
			JSONObject jk = new JSONObject();
			jk.put("inprogress", inprogress);
			JSONObject jk2 = new JSONObject();
			jk.put("waiting", waiting);
			JSONObject jk3 = new JSONObject();
			jk.put("confirm", confirm);
			ja.add(jk);

			jo.put("status", status);
			jo.put("gStatus", ja);
			jo.put("gPayment", gPayment);
			log.debug(jo);

			PrintWriter out = response.getWriter();
			out.print(jo);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public String savePayroll() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login
			String paymentGroupId = request.getParameter("paymentGroupId");
			String payroll_name = request.getParameter("payroll_name");
			String payroll_start_date = request.getParameter("payroll_start_date");
			String payroll_end_date = request.getParameter("payroll_end_date");
			String payroll_pay_date = request.getParameter("payroll_pay_date");
			String payroll_ss = request.getParameter("payroll_ss");
			String information = request.getParameter("information");
			String function = request.getParameter("function");
			Payment_group payment_group = payment_groupDAO.findById(Integer.parseInt(paymentGroupId));
			payment_group.setName(payroll_name);
			payment_group.setStart_date(Convert.parseDate(payroll_start_date));
			payment_group.setEnd_date(Convert.parseDate(payroll_end_date));
			payment_group.setPayment_date(Convert.parseDate(payroll_pay_date));
			payment_group.setSocial_security(payroll_ss);
			payment_group.setDescription(information);
			payment_group.setUser_update(logonUser);
			payment_group.setTimeUpdate(DateUtil.getCurrentTime());
			if (function.equals("confirm")) {
				payment_group.setStatus("2");
			}
			log.debug(payment_group);
			payment_groupDAO.save(payment_group);
			Map<String, String> obj = new HashMap<>();
			obj.put("status", "1");
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public String savePayrollGroup() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login
			String paymentGroupId = request.getParameter("paymentGroupId");
			String function = request.getParameter("function");
			Payment_group payment_group = payment_groupDAO.findById(Integer.parseInt(paymentGroupId));
			switch (function) {
			case "confirm":
				payment_group.setStatus("2");
				break;
			case "partial":
				payment_group.setStatus("3");
				break;
			case "full":
				payment_group.setStatus("4");
				break;
			}
			payment_groupDAO.save(payment_group);
			Map<String, String> obj = new HashMap<>();
			obj.put("status", "1");
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

}
