package com.cubesofttech.action;
import java.io.PrintWriter;
import java.util.HashMap;
//import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;


import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class PaymentTypeAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(PaymentTypeAction.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public Payment_typeDAO payment_typeDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Payment_type = "paymentTypeList";
	public static final String Payment_type1 = "paymentTypeList1";
	public static final String Payment_type0 = "paymentTypeList0";

	
	

	public String listPaymentType() {
		try {
					List<Payment_type> paymentTypeList = payment_typeDAO.findAll();
					List<Payment_type> paymentTypeList1 = payment_typeDAO.findtype1();
					List<Payment_type> paymentTypeList0 = payment_typeDAO.findtype0();
				
					request.setAttribute(Payment_type, paymentTypeList);
					request.setAttribute(Payment_type1, paymentTypeList1);
					request.setAttribute(Payment_type0, paymentTypeList0);
	
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	
	public String deletePaymentType(){
		try{

			String idPaytype = request.getParameter("Payment_type_id");
						
			Payment_type Paytype = new Payment_type();
			Paytype = payment_typeDAO.findById(idPaytype);
			log.debug(Paytype);
			payment_typeDAO.delete(Paytype);
			List<Payment_type> paymentTypeList = payment_typeDAO.findAll();
			request.setAttribute(Payment_type, paymentTypeList);
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
		
	}
	
	
	public String deleteIncome(){
		try{
			

			String idPaytype = request.getParameter("Payment_type_id");
						
			Payment_type Paytype = new Payment_type();
			Paytype = payment_typeDAO.findById(idPaytype);
			log.debug(Paytype);
			payment_typeDAO.delete(Paytype);
			List<Payment_type> paymentTypeList = payment_typeDAO.findAll();
			request.setAttribute(Payment_type, paymentTypeList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
		
	}
	public String deleteExpenses(){
		try{
			
			String idPaytype = request.getParameter("Payment_type_id");		
			Payment_type Paytype = new Payment_type();
			Paytype = payment_typeDAO.findById(idPaytype);
			payment_typeDAO.delete(Paytype);
			List<Payment_type> paymentTypeList = payment_typeDAO.findAll();
			request.setAttribute(Payment_type, paymentTypeList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
		
	}
	
	public String addPaymentType(){
		try{
			return SUCCESS;
			
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String savePaymentType() {
		try{
	User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
	String logonUser = ur.getId(); // Username login 

	Payment_type Paytype  = new Payment_type();
	String idPaytype = request.getParameter("Payment_type_id");
	String Payment_type_name = request.getParameter("Payment_type_name");
	String	type = request.getParameter("type");
	String	system = request.getParameter("system");
	String	sequence = request.getParameter("sequence");
	String	config_flag = request.getParameter("config_flag");
	String deptdes = request.getParameter("deptdes");

	String date = request.getParameter("date");
	//String time = request.getParameter("");
	
	//Timestamp ts = DateUtil.dateToTimestamp(date, time);
	
	Payment_type Payment_typeCheck =  payment_typeDAO.findById(idPaytype); // ทำการหา ID
	if(Payment_typeCheck == null){ // Check ว่า Id มีการซ้ำไหม ถ้าไม่ซ้ำ Save
		
		Paytype.setPayment_type_id(idPaytype);
		Paytype.setPayment_type_name(Payment_type_name);
		Paytype.setType(type);
		Paytype.setSystem(system);
		Paytype.setSequence(sequence);
		Paytype.setConfig_flag(config_flag);
		Paytype.setUsercreate(logonUser);
		Paytype.setUserupdate(logonUser);
		Paytype.setTimeCreate(DateUtil.getCurrentTime());
		Paytype.setTimeUpdate(DateUtil.getCurrentTime());
		Paytype.setDescription(deptdes);
		
		payment_typeDAO.save(Paytype);
	}else{ // ถ้าซ้ำ ทำการ Alert โดยสร้าง Flag ไว้ในหน้า department_add
		request.setAttribute("flag", "1");
		return INPUT;
	}
	List<Payment_type> paymentTypeList = payment_typeDAO.findAll();
	request.setAttribute(Payment_type, paymentTypeList);
	return SUCCESS;
}catch (Exception e){
	
	return ERROR;
		}
	}
	
	public String checkDuplicate() {
		try {
			String payment_type_id = request.getParameter("payment_type_id");
			Map<String, String> obj = new HashMap<>();
			List<Payment_type> payment = payment_typeDAO.search(payment_type_id);
			System.out.println(payment);
			if (payment.size() > 0) {
				obj.put("flag", "0");
			}
			else {
				obj.put("flag", "1");
			}
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		}
		catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}
	
	
	public String savePaymentTypetest() {
        try {

            // String enable = request.getParameter("enable");
        	User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
        	String logonUser = ur.getId(); // Username login 
        	
        	Payment_type Paytype  = new Payment_type();
        	String Payment_type_id = request.getParameter("Payment_type_id");
        	String Payment_type_name = request.getParameter("Payment_type_name");
        	String	type = request.getParameter("type");
        	String	system = request.getParameter("system");
        	String	sequence = request.getParameter("sequence");
        	
        	Payment_type Payment_typeCheck =  payment_typeDAO.findById(Payment_type_id); // ทำการหา ID
        	if(Payment_typeCheck == null){ // Check ว่า Id มีการซ้ำไหม ถ้าไม่ซ้ำ Save
        		
        		Paytype.setPayment_type_id(Payment_type_id);
        		Paytype.setPayment_type_name(Payment_type_name);
        		Paytype.setType(type);
        		Paytype.setSystem(system);
        		Paytype.setSequence(sequence);
        		Paytype.setUsercreate(logonUser);
        		Paytype.setUserupdate(logonUser);
        		Paytype.setConfig_flag("0");
        		Paytype.setTimeCreate(DateUtil.getCurrentTime());
        		Paytype.setTimeUpdate(DateUtil.getCurrentTime());
        		
        		payment_typeDAO.save(Paytype);
        	}

           

            Gson gson = new GsonBuilder().create();
            String responseJSON = gson.toJson(Paytype);
            log.debug(responseJSON);

            request.setAttribute("json", responseJSON);

            String JSON = "json";

            return JSON;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
	
	public String updateIncome(){
		try{
			
			String idPaytype = request.getParameter("Payment_type_id");
			Payment_type paymentTypeList = new Payment_type();
			paymentTypeList = payment_typeDAO.findById(idPaytype);
			request.setAttribute(Payment_type, paymentTypeList);  //à¸ªà¹ˆà¸‡à¸„à¹ˆà¸²à¸ˆà¸²à¸�à¸«à¸¥à¸±à¸‡à¹„à¸›à¸«à¸™à¹‰à¸²
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String updateExpenses(){
		try{
			
			String idPaytype = request.getParameter("Payment_type_id");
			Payment_type paymentTypeList = new Payment_type();
			paymentTypeList = payment_typeDAO.findById(idPaytype);
			request.setAttribute(Payment_type, paymentTypeList);  //à¸ªà¹ˆà¸‡à¸„à¹ˆà¸²à¸ˆà¸²à¸�à¸«à¸¥à¸±à¸‡à¹„à¸›à¸«à¸™à¹‰à¸²
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	public String editIncome(){
		try{
			String[] Position= request.getParameterValues("Position[]");
			String[] PaymentTypeID = request.getParameterValues("PaymentTypeID[]");
			String LastSeq = request.getParameter("LastSeq");

			Payment_type paymentTypeList = new Payment_type();
	
			int test = Integer.parseInt(LastSeq);
			
			for(int i = 0; i < test; i++) {
				paymentTypeList = payment_typeDAO.findById(PaymentTypeID[i]);
				paymentTypeList.setSequence(Position[i]);
				payment_typeDAO.update(paymentTypeList);
				}
			//Gson gson = new GsonBuilder().create();
            //String responseJSON = gson.toJson();
            //log.debug(responseJSON);

            //request.setAttribute("json", responseJSON);
            String JSON = "json";
            return JSON;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

	public String editExpenses(){
		try{
			String[] Position1= request.getParameterValues("Position1[]");
			String[] PaymentTypeID1 = request.getParameterValues("PaymentTypeID1[]");
			String LastSeq1 = request.getParameter("LastSeq1");

			Payment_type paymentTypeList = new Payment_type();

			int test1 = Integer.parseInt(LastSeq1);
			
			for(int i = 0; i < test1; i++) {
				paymentTypeList = payment_typeDAO.findById(PaymentTypeID1[i]);	
				paymentTypeList.setSequence(Position1[i]);
				payment_typeDAO.update(paymentTypeList);
				}
			//Gson gson = new GsonBuilder().create();
            //String responseJSON = gson.toJson();
            //log.debug(responseJSON);
            //request.setAttribute("json", responseJSON);
            String JSON = "json";

            return JSON;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
			
			
			public String editPaymentType(){
			try{
				User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
				String logonUser = ur.getId(); // Username login 
				
				Payment_type Paytype = new Payment_type();
				String idPaytype = request.getParameter("Payment_type_id");
				log.debug(idPaytype);			
				Paytype = payment_typeDAO.findById(idPaytype);
				
//				à¸ªà¹ˆà¸§à¸™à¸‚à¸­à¸‡ GET PARAMETER
				String Payment_type_name = request.getParameter("Payment_type_name");
				String	type = request.getParameter("type");
				String	system = request.getParameter("system");
				String	sequence = request.getParameter("sequence");
				String	config_flag = request.getParameter("config_flag");
				String deptdes = request.getParameter("deptdes");
				
				
				String date = request.getParameter("date");
				//String time = request.getParameter("time");

				//Timestamp ts = DateUtil.dateToTimestamp(date, time);
				
				
				Paytype.setPayment_type_id(idPaytype);
				Paytype.setPayment_type_name(Payment_type_name);
				Paytype.setType(type);
				Paytype.setSystem(system);
				Paytype.setSequence(sequence);
				Paytype.setConfig_flag(config_flag);
				Paytype.setDescription(deptdes);
				Paytype.setUserupdate(logonUser);
				Paytype.setUserupdate(logonUser);
				Paytype.setTimeCreate(DateUtil.getCurrentTime());
				Paytype.setTimeUpdate(DateUtil.getCurrentTime());
				//depart.setTimeUpdate(ts);
				
				payment_typeDAO.update(Paytype);
				
				List<Payment_type> paymentTypeList= payment_typeDAO.findAll();
				request.setAttribute(Payment_type, paymentTypeList);
				
				Gson gson = new GsonBuilder().create();
	            String responseJSON = gson.toJson(Paytype);
	            log.debug(responseJSON);

	            request.setAttribute("json", responseJSON);

	            String JSON = "json";

	            return JSON;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ERROR;
	        }
	    }
}