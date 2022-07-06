package com.cubesofttech.action;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.dao.UserSalaryDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.Position;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserPayment;
import com.cubesofttech.model.UserPaymentConfig;
import com.cubesofttech.model.UserSalary;
import com.cubesofttech.util.Convert;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class InfoEmpAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(InfoEmpAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	public UserPaymentConfigDAO userpaymentconfigDAO;

	@Autowired
	public UserDAO userDAO;

	@Autowired
	private DepartmentDAO departmentDAO;

	@Autowired
	private PositionDAO positionDAO;

	@Autowired
	private Employee_typeDAO employeetypeDAO;

	@Autowired
	private UserSalaryDAO userSalaryDAO;

	@Autowired
	private Payment_typeDAO payment_typeDAO;

	@Autowired
	private UserPaymentConfigDAO userPaymentConfigDAO;

	private String userId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String PaymentConfig = "paymentconfigList";
	public static final String IncomeList = "incomeList";
	public static final String ExpendList = "expendList";
	public static final String UserList = "userList";
	public static final String DepartmentList = "departmentList";
	public static final String PositionList = "positionList";
	public static final String EmptypeList = "emptypeList";
	public static final String UserSalary = "userSalary";

	public String openInfoEmp() {
		try {
			User selectUser = userDAO.findById(userId);
			request.setAttribute("selectUser", selectUser);
			request.setAttribute("userList", userDAO.sequense());

			List<Map<String, Object>> departmentList = departmentDAO.sequense2();
			List<Position> positionList = positionDAO.searchByDepartment(selectUser.getDepartmentId());
			request.setAttribute("departmentList", departmentList);
			request.setAttribute("positionList", positionList);

			List<Employee_type> emptypeList = employeetypeDAO.findAll();
			request.setAttribute(EmptypeList, emptypeList);

			// เขียนต่อ เพิ่มในส่วน Paymentconfig
			List<UserPaymentConfig> paymentconfigList = userpaymentconfigDAO.findAllByUser(userId);
			List<Payment_type> income = payment_typeDAO.findByTypenFlag("1", "1");
			List<Payment_type> outcome = payment_typeDAO.findByTypenFlag("0", "1");

			// request.setAttribute(PaymentConfig, paymentconfigList);

			List<UserPayment> paymentIncome = new ArrayList<UserPayment>();
			List<UserPayment> paymentOutcome = new ArrayList<UserPayment>();

			for (Payment_type pay : income) {
				Boolean emptyPayment = true;
				for (UserPaymentConfig userpay : paymentconfigList) {
					/*
					 * System.out.println("in"); System.out.println(pay.getPayment_type_id());
					 * System.out.println(userpay.getPaymentypeId());
					 */
					if (pay.getPayment_type_id().equals(userpay.getPaymentypeId())) {
						paymentIncome.add(new UserPayment(pay.getPayment_type_id(), "1", pay.getPayment_type_name(),
								userpay.getAmount()));
						// System.out.println("in+1");
						emptyPayment = false;
						break;
					}
				}
				if (emptyPayment)
					paymentIncome.add(new UserPayment(pay.getPayment_type_id(), "0", pay.getPayment_type_name(), null));
			}

			for (Payment_type pay : outcome) {
				Boolean emptyPayment = true;
				for (UserPaymentConfig userpay : paymentconfigList) {
					/*
					 * System.out.println("out"); System.out.println(pay.getPayment_type_id());
					 * System.out.println(userpay.getPaymentypeId());
					 */
					if (pay.getPayment_type_id().equals(userpay.getPaymentypeId())) {
						paymentOutcome.add(new UserPayment(pay.getPayment_type_id(), "1", pay.getPayment_type_name(),
								userpay.getAmount()));
						// System.out.println(userpay.getAmount());
						emptyPayment = false;
						break;
					}
				}
				if (emptyPayment)
					paymentOutcome
							.add(new UserPayment(pay.getPayment_type_id(), "0", pay.getPayment_type_name(), null));
			}

			request.setAttribute(IncomeList, paymentIncome);
			request.setAttribute(ExpendList, paymentOutcome);

			// เขียนต่อ เพื่อเพิ่มส่วน Modal

			List<UserSalary> userSalary = userSalaryDAO.findByUserId(userId);
			request.setAttribute(UserSalary, userSalary);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String editInfoEmp() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login

			User user = new User();
			String userId = request.getParameter("username");
			user = userDAO.findById(userId);

			// tab1
			String employeeId = request.getParameter("empId");
			String prefixTH = request.getParameter("prefixTH");
			String name = request.getParameter("name");
			String prefixEN = request.getParameter("prefixEN");
			String nameEN = request.getParameter("nameEN");
			String gender = request.getParameter("gender");
			String IDcard = request.getParameter("IDcard");
			String email = request.getParameter("email");
			String nameEmer = request.getParameter("nameEmer");
			String nickname = request.getParameter("nickname");
			String nicknameEN = request.getParameter("nicknameEN");
			String bd = request.getParameter("bday");
			Date birthDate = Convert.parseDate(bd);
			String passportID = request.getParameter("passportID");
			String phoneNum = request.getParameter("phoneNum");
			String phoneEmer = request.getParameter("phoneEmer");

			// Tab2
			String department = request.getParameter("depart");
			String positsion = request.getParameter("positsion");
			String std = request.getParameter("startday");
			Date startDay = Convert.parseDate(std);
			String ed = request.getParameter("endday");
			Date endDay = Convert.parseDate(ed);
			String startWorkDay = request.getParameter("startworkday");
			String endWorkDay = request.getParameter("endworkday");
			String startTime = request.getParameter("starttimework");
			String endTime = request.getParameter("endtimework");

			// Tab3
			String empType = request.getParameter("emp_type");
			String Salary = request.getParameter("salary");
			String SocialSecurity = request.getParameter("chkright");
			String tax = request.getParameter("tax");
			String tax_deduction = request.getParameter("tax_deduction");
			// BigDecimal withholding = new BigDecimal(request.getParameter("withholding"));

			// log.debug(tax);
			// log.debug(withholding);

			// Tab5
			String transfer = request.getParameter("transfer");
			String bank = request.getParameter("bank");
			String banktype = request.getParameter("banktype");
			String banknum = request.getParameter("banknum");
			String branch = request.getParameter("branch");

			// update tab1
			user.setId(userId);
			user.setEmployeeId(employeeId);
			user.setTitle_name_th(prefixTH);
			user.setName(name);
			user.setTitle_name_en(prefixEN);
			user.setNameEN(nameEN);
			user.setGender(gender);
			user.setCitizen_id(IDcard);
			user.setEmail(email);
			user.setNameEmer(nameEmer);
			user.setNickName(nickname);
			user.setNicknameEN(nicknameEN);
			user.setBirthDate(birthDate);
			user.setPassport_id(passportID);
			user.setPhoneNum(phoneNum);
			user.setPhoneEmer(phoneEmer);

			// update tab2
			user.setDepartmentId(department);
			user.setPositionId(positsion);
			user.setStartDate(startDay);
			user.setEndDate(endDay);
			user.setWorkDayStart(startWorkDay);
			user.setWorkDayEnd(endWorkDay);
			user.setWorkTimeStart(startTime);
			user.setWorkTimeEnd(endTime);

			// update tab3
			user.setEmployee_type_id(empType);
			// ยังไม่ได้อัพเดตเงินเดือน
			user.setSocial_security(SocialSecurity);
			if (tax != null) {
				user.setWithholding_auto("1");
				user.setWithholding(null);
			} else {
				BigDecimal withholding = new BigDecimal(request.getParameter("withholding"));
				user.setWithholding_auto("0");
				user.setWithholding(withholding);
			}
			user.setTax_deduction(tax_deduction);

			// update tab5
			user.setTransfer_type(transfer);
			user.setBank(bank);
			user.setBank_type(banktype);
			user.setBank_number(banknum);
			user.setBank_branch(branch);

		

			user.setTimeUpdate(DateUtil.getCurrentTime());

			userDAO.update(user);
			
			List<Map<String, Object>> cubesoftUsers = userDAO.Query_Userlist();
			request.setAttribute("cubesoftUsers", cubesoftUsers);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();

			return ERROR;
		}
	}

	public String editSalaryEmp() {

		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId(); // Username login

			// Modal
			String userId = request.getParameter("username");
			String sd = request.getParameter("salaryDate");
			Date salaryDate = Convert.parseDate(sd);
			String amountsalary = request.getParameter("amountsalary");
			String note = request.getParameter("note");

			UserSalary userSalary = new UserSalary();
			userSalary.setUser_id(userId);
			userSalary.setAmount(new BigDecimal(amountsalary));
			userSalary.setDate(salaryDate);
			userSalary.setDescription(note);
			userSalary.setPayment_type_id("SL");
			userSalary.setUser_create(logonUser);
			userSalary.setUser_update(logonUser);
			userSalary.setTime_create(Timestamp.from(Instant.now()));
			userSalary.setTime_update(Timestamp.from(Instant.now()));
			
			userSalaryDAO.save(userSalary);
			List<Map<String, Object>> cubesoftUsers = userDAO.Query_Userlist();
			request.setAttribute("cubesoftUsers", cubesoftUsers);
			Map<String, String> obj = new HashMap<>();
			obj.put("flag", "1");
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

	public String saveorupdateUser() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getId();
			String userId = request.getParameter("username");
			String paymentId = request.getParameter("payment");
			String amount = request.getParameter("amount");
			Map<String, String> obj = new HashMap<>();
			UserPaymentConfig user = userPaymentConfigDAO.findByUsernPid(userId, paymentId);
			if (user == null) {
				obj.put("flag", "0");
				userPaymentConfigDAO.save(new UserPaymentConfig(paymentId, userId, new BigDecimal(amount), "1",
						logonUser, logonUser, Timestamp.from(Instant.now()), Timestamp.from(Instant.now())));
			} else {
				obj.put("flag", "1");
				user.setAmount(new BigDecimal(amount));
				user.setUserUpdate(logonUser);
				user.setTimeUpdate(Timestamp.from(Instant.now()));
				userPaymentConfigDAO.update(user);
			}
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

	public String deleteUser() {
		try {
			String userId = request.getParameter("username");
			String paymentId = request.getParameter("payment");
			UserPaymentConfig user = userPaymentConfigDAO.findByUsernPid(userId, paymentId);
			Map<String, String> obj = new HashMap<>();
			if (user == null) {
				obj.put("flag", "0");
			} else {
				obj.put("flag", "1");
				// System.out.println(user);
				userPaymentConfigDAO.delete(user);
			}
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();

			// return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}