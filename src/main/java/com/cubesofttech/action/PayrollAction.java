package com.cubesofttech.action;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Payment;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserPaymentConfig;
import com.cubesofttech.service.CalcService;
import com.cubesofttech.util.DateUtil;
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
	private FunctionDAO functionDAO;
	
	@Autowired
	private CalcService calCService;
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String listPayroll() {
		try {
				List<Map<String, Object>> payment = paymentDAO.findAllByGroupId();
				List<Map<String, Object>> status = paymentDAO.countStatus();
				log.debug(payment);
				log.debug(status);
				request.setAttribute("payment",payment);
				request.setAttribute("status",status);
				
				List<User> user = userDAO.findAllPayroll();
				request.setAttribute("userList", user);
				
				return SUCCESS;
		} catch (Exception e) {
				log.error(e);
					
				return ERROR;
		}
	}
	
	public String addPayroll() {
		try {
				User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login
				String logonUser = ur.getId(); // Username login
				 
				java.sql.Date currentDate = new java.sql.Date(Calendar.getInstance().getTime().getTime()); //current Date
				log.debug(currentDate);
				Calendar c1 = Calendar.getInstance();
				Calendar c2 = Calendar.getInstance();
				c1.set(Calendar.DATE, 1);
				c2.set(Calendar.DATE, c2.getActualMaximum(Calendar.DATE));
				java.sql.Date sDate = new java.sql.Date(c1.getTime().getTime()); //fistDayOfMonth Date
				java.sql.Date eDate = new java.sql.Date(c2.getTime().getTime()); //lastDayOfMonth Date
				log.debug(sDate);
				log.debug(eDate);
				
				//------ Add Payment_group ------//
				Integer pgMaxId = payment_groupDAO.getMaxId() + 1;
				Payment_group payment_group = new Payment_group();
				
				payment_group.setPayment_group_id(pgMaxId);
				payment_group.setName(null);
				payment_group.setTransaction_date(currentDate);
				payment_group.setPayment_date(null);
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
				
				//------ Add Payment ------//
				String userList = request.getParameter("userList");
				log.debug(userList);
				String[] userListarr = userList.split(",");
				
				String paymentGroupId = Integer.toString(pgMaxId);
				
				for(String userId : userListarr) {
					Payment payment = new Payment();
					log.debug(userId);
					User findUser = userDAO.findById(userId);
					Integer pMaxId = paymentDAO.getMaxId() + 1;
					log.debug(pMaxId);
					payment.setPayment_id(pMaxId);
					payment.setPayment_group_id(paymentGroupId);
					payment.setUser_id(userId);
					payment.setEmployee_type_id(findUser.getEmployee_type_id());
					if(findUser.getEmployee_type_id() != null) {
						Employee_type empType = employee_typeDAO.findById(Integer.parseInt(findUser.getEmployee_type_id()));
						payment.setEmployee_type_name(empType.getName());
					}
					else {
						payment.setEmployee_type_name(null);
					}
					
					String pattern = "yyyy-MM-dd";
					SimpleDateFormat df = new SimpleDateFormat(pattern);
					String sDateAsString = df.format(sDate);
					String eDateAsString = df.format(eDate);
					List<Map<String, Object>> workingSummary = functionDAO.findWorkingSummary(userId, sDateAsString, eDateAsString);
					log.debug(workingSummary.get(0).get("actual_working_day"));
					
					payment.setActual_day(workingSummary.get(0).get("actual_working_day").toString());
					
					//----- calculate salary -----//
					BigDecimal salary = null;
					BigDecimal salary_day = new BigDecimal(calCService.calculateSalaryPerDay(userId));
					log.debug(salary_day);
					if(salary_day.equals(null)) {
						salary_day = BigDecimal.ZERO;
					}
					log.debug(salary_day);
					BigDecimal actual_day = new BigDecimal((String)workingSummary.get(0).get("actual_working_day"));
					if(actual_day.equals(null)) {
						actual_day = BigDecimal.ZERO;
					}
					log.debug(actual_day);
					salary = actual_day.multiply(salary_day);
					if(salary.equals(null)) {
						salary = BigDecimal.ZERO;
					}
					BigDecimal roundingSalary = salary.setScale(0, RoundingMode.HALF_UP);
					log.debug(roundingSalary);
					
					payment.setSalary(roundingSalary);
					
					//----- income&expend net -----//
					List<Map<String, Object>> incomeNetList = userpaymentconfigDAO.sumIncomeById(userId);
					List<Map<String, Object>> expendNetList = userpaymentconfigDAO.sumExpendById(userId);
					
					BigDecimal incomeNet = (BigDecimal)incomeNetList.get(0).get("total");
					BigDecimal expendNet = (BigDecimal)expendNetList.get(0).get("total");
					if(incomeNet == null) {
						incomeNet = BigDecimal.ZERO;
					}
					if(expendNet == null) {
						expendNet = BigDecimal.ZERO;
					}
					log.debug(expendNet);
					log.debug(incomeNet);
					payment.setIncome_net(incomeNet);
					payment.setExpend_net(expendNet);
					
					//----- calculate total -----//
					BigDecimal totalPay = roundingSalary.add(incomeNet).subtract(expendNet);
					log.debug(totalPay);
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
					log.debug(payment);
					log.debug("save success!!!");
				}
				
				return SUCCESS;
		} catch (Exception e) {
				log.error(e);
					
				return ERROR;
		}
	}

}
