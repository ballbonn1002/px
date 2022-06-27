package com.cubesofttech.action;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserSalaryDAO;
//import com.cubesofttech.model.User;

//import com.google.gson.GsonBuilder;
import com.cubesofttech.model.UserSalary;
import com.cubesofttech.service.CalcService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class FunctionAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(FunctionAction.class);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private static final long serialVersionUID = 1L;

	
	
	//@Autowired
	//private UserDAO userDAO;
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserSalaryDAO userSalaryDAO;
	@Autowired
	private CalcService calcService;

	
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
		
	public String listSalary() {
		try {
			List<UserSalary> salaryList = userSalaryDAO.findAllList();
			//log.debug(salaryList);
			request.setAttribute("salaryList", salaryList);
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String autoFill() {
		try {
			String userSalary = request.getParameter("userid");
			List<UserSalary> user = userSalaryDAO.findSalary(userSalary);
			log.debug(user);
			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
             String json = gson.toJson(user);
             request.setAttribute("json", json);	
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String calTax() {
		try {
			String val = request.getParameter("salary");
			String pay = request.getParameter("pay");
			String mny = request.getParameter("money");
			String ssi = request.getParameter("social");
			String flag = request.getParameter("flag");
			Double money = Double.parseDouble(val);
			Double paid = Double.parseDouble(pay);
			Double self = Double.parseDouble(mny);
			Double aia = Double.parseDouble(ssi);
			
		    if(flag.equals("1")) {
		    	List<List<Double>> y = calcService.calculateTax(money, paid, self, aia);
		    	List<Double> tan = y.get(0);
		    	List<Double> best = y.get(1);
		    	
		    	for (int i=0; i<tan.size(); i++) {
		    		  tan.get(i);
		    		request.setAttribute("w"+i,tan.get(i));
		    	}
		    	request.setAttribute("total",best.get(0));
		    	request.setAttribute("perMonth",best.get(1));
		    	
		    }else {
		    	char p = '0';
		    	request.setAttribute("flag",p);
		    }
			
			
			
			List<UserSalary> salaryList = userSalaryDAO.findAllList();
			request.setAttribute("salaryList", salaryList);
			
			String userSalary = request.getParameter("user_name");
			List<UserSalary> user = userSalaryDAO.findSalary(userSalary);
			
			request.setAttribute("test", user);
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			log.debug(e);
			return ERROR;
		}
	}

	
	
	
}