package com.cubesofttech.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.beust.jcommander.internal.Console;
import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(DepartmentAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public DepartmentDAO departmentDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Department = "departmentList";
	
	public String list() {
		try {
			List<Department> departmentList = departmentDAO.findAll();
			log.debug(departmentList);
			request.setAttribute(Department, departmentList);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	
	public String deleteDepartment(){
		try{
			String idDepart = request.getParameter("id");
			Department depart = new Department();
			depart = departmentDAO.findById(idDepart);
			log.debug(depart);
			departmentDAO.delete(depart);
			List<Department> departmentList = departmentDAO.findAll();
			request.setAttribute(Department, departmentList);
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
		
	}
	public String updateDepart(){
		try{
			String idDepart = request.getParameter("id");
			log.debug(idDepart);
			Department departmentList = new Department();
			departmentList = departmentDAO.findById(idDepart);
			request.setAttribute(Department, departmentList);  //??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	public String editDepart(){
		try{
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login 
			
			Department depart = new Department();
			String idDepart = request.getParameter("ID");
			depart = departmentDAO.findById(idDepart);
			
//			????????????????????????????????????????????? GET PARAMETER
			String name = request.getParameter("name");
			String deptdes = request.getParameter("deptdes");
			String prefixId = request.getParameter("testnaja");
			
			String date = request.getParameter("date");
			//String time = request.getParameter("time");

			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			
			depart.setUserupdate(logonUser);
			depart.setName(name);
			depart.setDescription(deptdes);
			depart.setPrefixId(prefixId);
			depart.setTimeCreate(DateUtil.getCurrentTime());
			depart.setTimeUpdate(DateUtil.getCurrentTime());
			//depart.setTimeUpdate(ts);
			
			departmentDAO.update(depart);
			
			List<Department> departmentList = departmentDAO.findAll();
			request.setAttribute(Department, departmentList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String addDepart(){
		try{
			return SUCCESS;
			
		}catch (Exception e){
			
			return ERROR;
		}
	}
	
	
	public String checkDupDepart() {
		try {
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login 
			String idDepart = request.getParameter("ID");
			
			Department departmentCheck =  departmentDAO.findById(idDepart); // ????????????????????? ID
			Map<String,String> flag = new HashMap<String, String>();
			
			
			
			if(departmentCheck != null){ // Check ????????? Id ????????????????????????????????? ?????????????????? return input
				flag.put("flag", "1");
			}else {
				flag.put("flag", "0");
			}
			log.debug(flag);
			Gson gson = new Gson();
			String json = gson.toJson(flag); 
			request.setAttribute("json",json);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String saveDepart() {
		try{
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login 

			Department depart = new Department();
			String idDepart = request.getParameter("ID");
			String name = request.getParameter("name");
			String deptdes = request.getParameter("deptdes");
			String deptpre = request.getParameter("deptpre");
			
			String date = request.getParameter("date");
			//String time = request.getParameter("time");
			
			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			
			Department departmentCheck =  departmentDAO.findById(idDepart); // ????????????????????? ID
			if(departmentCheck == null){ // Check ????????? Id ????????????????????????????????? ??????????????????????????? Save
				
			depart.setTimeCreate(DateUtil.getCurrentTime());
			depart.setTimeUpdate(DateUtil.getCurrentTime());
			depart.setDepartment_id(idDepart);
			depart.setName(name);
			depart.setUsercreate(logonUser);
			depart.setDescription(deptdes);
			depart.setPrefixId(deptpre);
			
			departmentDAO.save(depart);
			}else{ // ?????????????????? ??????????????? Alert ???????????????????????? Flag ??????????????????????????? department_add
				request.setAttribute("flag", "1");
				return INPUT;
			}
			List<Department> departmentList = departmentDAO.findAll();
			request.setAttribute(Department, departmentList);
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	
}