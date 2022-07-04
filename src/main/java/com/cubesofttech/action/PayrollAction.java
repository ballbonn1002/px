package com.cubesofttech.action;

import java.util.List;
import java.util.Map;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.model.Payment;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.User;
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
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String listPayroll() {
		try {
				List<Payment_group> payment_group = payment_groupDAO.findAll();
				List<Map<String, Object>> payment = paymentDAO.findAllByGroupId();
				List<Map<String, Object>> status = paymentDAO.countStatus();
				
				request.setAttribute("paymentgroupList", payment_group);
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
				
				String userList = request.getParameter("getUserList");
				log.debug(userList);
				
				java.sql.Date currentDate = new java.sql.Date(Calendar.getInstance().getTime().getTime()); //current Date
				log.debug(currentDate);
				Calendar c = Calendar.getInstance(); 
				c.set(Calendar.DATE, 1);
				java.sql.Date sDate = new java.sql.Date(c.getTime().getTime()); //fistDayOfMonth Date
				log.debug(sDate);
				
				Payment_group payment_group = new Payment_group();
				
				payment_group.setName(null);
				payment_group.setTransaction_date(currentDate);
				payment_group.setPayment_date(null);
				payment_group.setStart_date(sDate);
				payment_group.setEnd_date(currentDate);
				payment_group.setSocial_security("5");
				payment_group.setDescription(null);
				payment_group.setStatus("1");
				payment_group.setSystem("1");
				payment_group.setUser_create(logonUser);
				payment_group.setUser_update(logonUser);
				payment_group.setTimeCreate(DateUtil.getCurrentTime());
				payment_group.setTimeUpdate(DateUtil.getCurrentTime());
				payment_groupDAO.save(payment_group);
				
				return SUCCESS;
		} catch (Exception e) {
				log.error(e);
					
				return ERROR;
		}
	}

}
