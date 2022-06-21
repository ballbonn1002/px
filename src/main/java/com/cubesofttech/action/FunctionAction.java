package com.cubesofttech.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import com.cubesofttech.dao.UserDAO;

import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.UserSalaryDAO;
import com.cubesofttech.model.UserSalary;

public class FunctionAction extends ActionSupport {

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	private UserDAO userDAO;
	private UserSalaryDAO userSalaryDAO;

	public String salaryAction() {
		try {
			List<Map<String, Object>> cubesoftUsers = userDAO.Query_Userlist();
			request.setAttribute("cubesoftUsers", cubesoftUsers);
			
			//List<UserSalary> cubesoftUserSalaries = userSalaryDAO.findAllUserSalary();
			//request.setAttribute("cubesoftUserSalaries", cubesoftUserSalaries);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}

}