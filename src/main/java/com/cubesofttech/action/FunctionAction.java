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

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class FunctionAction extends ActionSupport {

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private static final Logger log = Logger.getLogger(DepartmentAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserDAO userDAO;
	@Autowired
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
	
	public String ssiAction() {
		
		/*try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}*/
		
		String uId = request.getParameter("user_ssi_id");
		//log.debug(uId);
		request.setAttribute("uId", uId);
		
		try {
			
			List<Map<String, Object>> userSocialSecurity = userSalaryDAO.findSsi(uId);
			request.setAttribute("UserSocialSecurity", userSocialSecurity);
			
			//List<Map<String, Object>> userSocialSecurityById = userSalaryDAO.findSsiById(uId);
			//request.setAttribute("socialSecurity", userSocialSecurityById);
			//System.out.println(socialSecurity);
			
			
			// request.setAttribute("userList", userDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String findSsiAction() {
		/*try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}*/
		
		try {
			String uId = request.getParameter("user_id_ssi");
			//log.debug(uId);
			//request.setAttribute("uId", uId);
			
			//List<Map<String, Object>> userSocialSecurity = userSalaryDAO.findSsi(uId);
			//request.setAttribute("UserSocialSecurity", userSocialSecurity);
			
			List<Map<String, Object>> userSocialSecurityById = userSalaryDAO.findSsiById(uId);
			//log.debug(userSocialSecurityById);
			Gson gson = new Gson(); 
			String json = gson.toJson(userSocialSecurityById.get(0));
			request.setAttribute("json", json);
			//request.setAttribute("socialSecurity", userSocialSecurityById);
			//System.out.println(socialSecurity);
			
			
			// request.setAttribute("userList", userDAO.findAll());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}