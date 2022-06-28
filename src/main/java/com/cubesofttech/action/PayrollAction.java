package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.User;
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
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String listPayroll() {
		try {
				List<Payment_group> payment_group = payment_groupDAO.findAll();
				request.setAttribute("paymentgroupList", payment_group);
				log.debug(payment_group);
				
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

}
