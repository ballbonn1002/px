package com.cubesofttech.action;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.model.Payment;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
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
	private Payment_typeDAO payment_typeDAO;
	
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
				String test = "test";
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
	}
	

	public String listUser() {
		try {
				List<Payment_type> payment_type = payment_typeDAO.findType();
				request.setAttribute("paymentTypeList", payment_type);
				
				List<User> user = userDAO.userList();
				request.setAttribute("userList", user);
				
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String checkIdDate() {
		try {
				String user = request.getParameter("userId");
				String fdate = request.getParameter("f_date");
				String edate = request.getParameter("e_date");
				//log.debug(user);
				//log.debug(fdate);
				//log.debug(edate);
				
				//if(user != null && fdate != null && edate != null) {
					List<Payment_type>payment_type = payment_typeDAO.findAmount(user, fdate, edate);
					
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
			        String json = gson.toJson(payment_type);
			        request.setAttribute("json", json);
				//}
				return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
