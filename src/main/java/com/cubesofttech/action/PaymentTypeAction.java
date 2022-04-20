package com.cubesofttech.action;
//import java.sql.Timestamp;
import java.util.List;

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
	public static final String Payment_typecount = "paymentTypeListcount";
	
	
	
	

	public String listPaymentType() {
		try {
					List<Payment_type> paymentTypeList = payment_typeDAO.findAll();
					List<Payment_type> paymentTypeList1 = payment_typeDAO.findtype1();
					List<Payment_type> paymentTypeList0 = payment_typeDAO.findtype0();
					List<Payment_type> paymentTypeListcount = payment_typeDAO.findcount();
					request.setAttribute(Payment_type, paymentTypeList);
					request.setAttribute(Payment_type1, paymentTypeList1);
					request.setAttribute(Payment_type0, paymentTypeList0);
					request.setAttribute(Payment_typecount, paymentTypeListcount);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	/*public String listPaymentType01() {
		try {
					List<Payment_type> paymentTypeList01 = payment_typeDAO.findtype1();
					request.setAttribute(Payment_type01, paymentTypeList01);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	public String listPaymentType00() {
		try {
					List<Payment_type> paymentTypeList00 = payment_typeDAO.findtype0();
					request.setAttribute(Payment_type00, paymentTypeList00);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }*/
	
	
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
        	
        	Payment_type Payment_typeCheck =  payment_typeDAO.findById(Payment_type_id); // ทำการหา ID
        	if(Payment_typeCheck == null){ // Check ว่า Id มีการซ้ำไหม ถ้าไม่ซ้ำ Save
        		
        		Paytype.setPayment_type_id(Payment_type_id);
        		Paytype.setPayment_type_name(Payment_type_name);
        		Paytype.setType(type);
        		Paytype.setSystem(system);
        		Paytype.setUsercreate(logonUser);
        		Paytype.setUserupdate(logonUser);
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
	
	public String updatePaymentType(){
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
	public String editPaymentType(){
		try{
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login 
			
			Payment_type Paytype = new Payment_type();
			String idPaytype = request.getParameter("Payment_type_id");
			Paytype = payment_typeDAO.findById(idPaytype);
			
//			à¸ªà¹ˆà¸§à¸™à¸‚à¸­à¸‡ GET PARAMETER
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
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
}