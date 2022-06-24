package com.cubesofttech.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

//import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserSalaryDAO;
//import com.cubesofttech.model.User;

import org.apache.log4j.Logger;
import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;

public class FunctionAction extends ActionSupport {

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	private static final Logger log = Logger.getLogger(DepartmentAction.class);
	private static final long serialVersionUID = 1L;
	
	
	//@Autowired
	//private UserDAO userDAO;
	
	@Autowired
	private UserSalaryDAO userSalaryDAO;

	
	public String salaryAction() {
		try {
		
			List<Map<String, Object>> cubesoftUserSalaries = userSalaryDAO.findAllUserSalary();
			request.setAttribute("cubesoftUserSalaries", cubesoftUserSalaries);
			
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}
	
	public String findSalaryDataById() {
		try {
			String userId = request.getParameter("user_id");
			List<Map<String, Object>> cubesoftUserSalariesById = userSalaryDAO.findUserSalaryByID(userId);
						
            Gson gson = new Gson(); 
            String json = gson.toJson(cubesoftUserSalariesById.get(0)); 
            request.setAttribute("json", json);	
            
            return SUCCESS;
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

	}
	
	
}