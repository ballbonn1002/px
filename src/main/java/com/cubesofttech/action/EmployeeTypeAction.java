package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeTypeAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(EmployeeTypeAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public Employee_typeDAO employee_typeDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	
	public String listEmployeeType() {
		try {
					List<Employee_type> emptypeList = employee_typeDAO.findAll();
					request.setAttribute("employee_type", emptypeList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
	}
}