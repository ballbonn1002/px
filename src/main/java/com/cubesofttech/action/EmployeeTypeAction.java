package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.Employee_typeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Sys_role;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeTypeAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(EmployeeTypeAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public Employee_typeDAO employee_typeDAO;
	@Autowired
	public UserDAO userDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	
public String listEmployeeType() {
		try {
					List<Employee_type> emptypeList = employee_typeDAO.findAll();
					request.setAttribute("emptypeList", emptypeList);
					
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
	}
public String SaveEmployeeType() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String loginUser = ur.getId();
			Employee_type emp_type = new Employee_type();
			String name = request.getParameter("name");
			String payment = request.getParameter("payment");
			String term = request.getParameter("term");
			String term_day = request.getParameter("term_day");
			String description = request.getParameter("description");

				emp_type.setName(name);
				emp_type.setPayment(payment);
				emp_type.setTerm(term);
				emp_type.setTerm_day(term_day);
				emp_type.setDescription(description);
				emp_type.setTimeCreate(DateUtil.getCurrentTime());
				emp_type.setTimeUpdate(DateUtil.getCurrentTime());
				emp_type.setUsercreate(loginUser);
				emp_type.setUserupdate(loginUser);
				employee_typeDAO.save(emp_type);
				
			List<Employee_type> emptypeList = employee_typeDAO.findAll();
			request.setAttribute("emptypeList", emptypeList);
			
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
public String EditEmployeeType() {
	try {	
		Employee_type emptype = new Employee_type();
		String emp =request.getParameter("emp");
		Integer s = Integer.valueOf(emp);
		emptype = employee_typeDAO.findById(s);
		request.setAttribute("emptype", emptype);
		return SUCCESS;
	}catch(Exception e) {
		e.printStackTrace();
		return ERROR;
	}
	}
public String UpdateEmployeeType() {
	try {
			User ur = (User) request.getSession().getAttribute("onlineUser");
			String loginUser = ur.getId();
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String payment = request.getParameter("payment");
			String term = request.getParameter("term");
			String term_day = request.getParameter("term_day");
			String description = request.getParameter("description");
			//log.debug(name);
			//log.debug(payment);
			//log.debug(term);
			//log.debug(term_day);
			//log.debug(description);
			Employee_type emptype = new Employee_type();
			Integer a = Integer.valueOf(id);
			emptype = employee_typeDAO.findById(a);
			emptype.setName(name);
			emptype.setPayment(payment);
			emptype.setTerm(term);
			emptype.setTerm_day(term_day);
			emptype.setDescription(description);
			emptype.setUserupdate(loginUser);
			emptype.setTimeUpdate(DateUtil.getCurrentTime());
			employee_typeDAO.update(emptype);
			
			List<Employee_type> emptypeList = employee_typeDAO.findAll();
			request.setAttribute("emptypeList", emptypeList);
			
			return SUCCESS;
	}catch(Exception e) {
		e.printStackTrace();
		return ERROR;
	}
}
public String DeleteEmployeeType() {
	try {
		String emptype = request.getParameter("employee_type_id");
		Integer id = Integer.valueOf(emptype);
	
		Employee_type emp = employee_typeDAO.findById(id);
		employee_typeDAO.delete(emp);
		List<Employee_type> emptypeList = employee_typeDAO.findAll();
		request.setAttribute("emptypeList", emptypeList);
		return SUCCESS;
	}catch(Exception e) {
		log.debug(e);
		return ERROR;
	}
}
}