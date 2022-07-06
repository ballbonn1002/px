package com.cubesofttech.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserSalaryDAO;
//import com.cubesofttech.model.User;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.User;
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
	private Payment_groupDAO payment_groupDAO;
	//@Autowired
	//private TaxMS taxMS;
	
	@Autowired
	private CalcService calCService;

	@Autowired
	public FunctionDAO funtionDAO;
	
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
		try {
			
			List<Map<String, Object>> userSocialSecurity = userSalaryDAO.findSsi();
			request.setAttribute("UserSocialSecurity", userSocialSecurity);

			
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
			log.debug(cubesoftUserSalariesById);
						
            Gson gson = new Gson(); 
            String json = gson.toJson(cubesoftUserSalariesById.get(0)); 
            request.setAttribute("json", json);	
            
            return SUCCESS;
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String calculateOTData() {
		try {
			
			double countOt15 = Double.parseDouble(request.getParameter("ot15"));
			double countOt2 = Double.parseDouble(request.getParameter("ot2"));
			double countOt3 = Double.parseDouble(request.getParameter("ot3"));
			int salary_payment_type = Integer.parseInt(request.getParameter("Salary_payment_type"));
			double salary_term = Double.parseDouble(request.getParameter("Salary_term"));
			double salary_term_day = Double.parseDouble(request.getParameter("Salary_term_day"));
			double salary_amount = Double.parseDouble(request.getParameter("Salary_amount"));
			
			Double salaryPerDay = null;
			Double salaryPerHour = null;
			Double salaryOT15 = null;
			Double salaryOT2 = null;
			Double salaryOT3 = null;
			
			Map<String, Double> DataList = new HashMap<String, Double>();
			
			CalcService calculateCalcService = new CalcService();
			
			//get Calculate Data
			if (salary_payment_type == 1) {
				salaryPerDay = salary_amount;
			}else if (salary_payment_type == 0) {
				salaryPerDay = calculateCalcService.calculateSalaryPerDay(salary_amount,salary_term,salary_term_day);
			}
			salaryPerHour = calculateCalcService.calculateSalaryPerHour(salaryPerDay);
			salaryOT15 = calculateCalcService.calculateOT(salaryPerHour,countOt15,1.5);
			salaryOT2 = calculateCalcService.calculateOT(salaryPerHour,countOt2,2.0);
			salaryOT3 = calculateCalcService.calculateOT(salaryPerHour,countOt3,3.0);

			
			//put JSON
            Gson gson = new Gson();
            
			DataList.put("salaryDay",salaryPerDay);
			DataList.put("salaryHr", salaryPerHour);
			DataList.put("salaryOT15", salaryOT15);
			DataList.put("salaryOT2", salaryOT2);
			DataList.put("salaryOT3", salaryOT3);
            
            String json = gson.toJson(DataList); 
            request.setAttribute("json", json);	
            
            
            //log.debug("ภาษาไทย");
            return SUCCESS;

		}catch (Exception e) {
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
			
			List<Map<String, Object>> userSocialSecurityById = userSalaryDAO.findSsiById(uId);
			//log.debug(userSocialSecurityById);
			Gson gson = new Gson(); 
			String json = gson.toJson(userSocialSecurityById.get(0));
			request.setAttribute("json", json);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String calSsiAction() {
		try {
			double percent = Double.parseDouble(request.getParameter("input_percent"));
			double salary = Double.parseDouble(request.getParameter("ssi_value2"));
			//log.debug(percent);
			//log.debug(salary);
			
			double calSocialSecurity = calCService.calSsi(percent, salary);
			request.setAttribute("CalSocialSecurity", calSocialSecurity);
			
			log.debug(calSocialSecurity);
			Gson gson = new Gson(); 
			String json = gson.toJson(calSocialSecurity);
			request.setAttribute("json", json);
			
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
		    	List<List<Double>> y = calCService.calculateTax(money, paid, self, aia);
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
			
			List<Map<String, Object>> cubesoftUserSalaries = userSalaryDAO.findAllUserSalary();
			request.setAttribute("cubesoftUserSalaries", cubesoftUserSalaries);
			//log.debug(cubesoftUserSalaries);
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			log.debug(e);
			return ERROR;
		}
	}

	public String testPayroll() {
		try {
				List<Payment_group> payment_group = payment_groupDAO.findAll();
				request.setAttribute("paymentgroupList", payment_group);
				log.debug(payment_group);
				
				List<User> user = userDAO.findAll();
				request.setAttribute("userList", user);
				
				return SUCCESS;
		} catch (Exception e) {
				log.error(e);
					
				return ERROR;
		}
	}
	
	public String getWorkingList() {
		try {
			String userId = request.getParameter("userId") == null ? "test.data1" : request.getParameter("userId") ;
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
						
//			List<Map<String, Object>> workingList = funtionDAO.findWorkingList(userId, startDate, endDate);	//List for display on table detail
			List<Map<String, Object>> workingSummary = funtionDAO.findWorkingSummary(userId, startDate, endDate); //Summary (record 0) : count_working,actual_working,absent,sum_hours
					
//			request.setAttribute("WorkingList", workingList);
			request.setAttribute("WorkingSummary", workingSummary);
			
			Gson gson = new Gson(); 
			String json = gson.toJson(workingSummary);
			request.setAttribute("json", json);
			
			return SUCCESS;

		} catch (Exception e) {

			return ERROR;
		}
	}
	
	
}