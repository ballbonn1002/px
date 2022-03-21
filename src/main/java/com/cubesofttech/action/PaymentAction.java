package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class PaymentAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(PaymentAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public Employee_typeDAO employee_typeDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Employee_type = "emptypeList";
	
	
	public String listPaymentEmp() {
		try {
					List<Employee_type> emptypeList = employee_typeDAO.findAll();
					request.setAttribute(Employee_type, emptypeList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	public String listPayment() {
		try {
					List<Employee_type> emptypeList = employee_typeDAO.findAll();
					request.setAttribute(Employee_type, emptypeList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	public String deletePaymentEmp(){
		try{
			String idEmptype = request.getParameter("employee_type_id");
			Employee_type emptype = new Employee_type();
			emptype = employee_typeDAO.findById(idEmptype);
			log.debug(emptype);
			employee_typeDAO.delete(emptype);
			List<Employee_type> emptypeList = employee_typeDAO.findAll();
			request.setAttribute(Employee_type, emptypeList);
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
		
	}
	public String updatePaymentEmp(){
		try{
			String idEmptype = request.getParameter("employee_type_id");
			Employee_type emptypeList = new Employee_type();
			emptypeList = employee_typeDAO.findById(idEmptype);
			request.setAttribute(Employee_type, emptypeList);  //à¸ªà¹ˆà¸‡à¸„à¹ˆà¸²à¸ˆà¸²à¸�à¸«à¸¥à¸±à¸‡à¹„à¸›à¸«à¸™à¹‰à¸²
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	public String editPaymentEmp(){
		try{
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login 
			
			Employee_type emptype = new Employee_type();
			String idEmptype = request.getParameter("employee_type_id");
			emptype = employee_typeDAO.findById(idEmptype);
			
//			à¸ªà¹ˆà¸§à¸™à¸‚à¸­à¸‡ GET PARAMETER
	
			String name = request.getParameter("name");
			String deptdes = request.getParameter("deptdes");
			
			
			String date = request.getParameter("date");
			//String time = request.getParameter("time");

			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			
			
			emptype.setemployee_type_id(idEmptype);
			emptype.setName(name);
			emptype.setDescription(deptdes);
			emptype.setUserupdate(logonUser);
			emptype.setUserupdate(logonUser);
			emptype.setTimeCreate(DateUtil.getCurrentTime());
			emptype.setTimeUpdate(DateUtil.getCurrentTime());
			//depart.setTimeUpdate(ts);
			
			employee_typeDAO.update(emptype);
			
			List<Employee_type> emptypeList = employee_typeDAO.findAll();
			request.setAttribute(Employee_type, emptypeList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String addPaymentEmp(){
		try{
			return SUCCESS;
			
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String savePaymentEmp() {
		try{
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login 

			Employee_type emptype  = new Employee_type();
			String idEmptype = request.getParameter("employee_type_id");
			String name = request.getParameter("name");
			String deptdes = request.getParameter("deptdes");
		
			String date = request.getParameter("date");
			//String time = request.getParameter("");
			
			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			
			Employee_type employee_typeCheck =  employee_typeDAO.findById(idEmptype); // ทำการหา ID
			if(employee_typeCheck == null){ // Check ว่า Id มีการซ้ำไหม ถ้าไม่ซ้ำ Save
				emptype.setUsercreate(logonUser);
				emptype.setUserupdate(logonUser);
				emptype.setTimeCreate(DateUtil.getCurrentTime());
				emptype.setTimeUpdate(DateUtil.getCurrentTime());
				emptype.setemployee_type_id(idEmptype);
				emptype.setName(name);
				emptype.setDescription(deptdes);
		
			employee_typeDAO.save(emptype);
			}else{ // ถ้าซ้ำ ทำการ Alert โดยสร้าง Flag ไว้ในหน้า department_add
				request.setAttribute("flag", "1");
				return INPUT;
			}
			List<Employee_type> emptypeList = employee_typeDAO.findAll();
			request.setAttribute(Employee_type, emptypeList);
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
}