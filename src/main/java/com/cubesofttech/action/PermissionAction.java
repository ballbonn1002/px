package com.cubesofttech.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PermissionDAO;
import com.cubesofttech.model.Page;
import com.cubesofttech.model.Permission;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PermissionAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(PageGroupAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public PermissionDAO permissionDAO;
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Permission = "permissionList";
	
	public String list() {
		try {
					List<Permission> permissionList = permissionDAO.findAll();
					request.setAttribute(Permission, permissionList);
					log.debug(permissionList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	
	public String changePerActive() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			 permission = permissionDAO.findById(idValue);
			String pmt_active = request.getParameter("Active");
			log.debug(pmt_active);
		
			
			
			// log.debug(page);
			 
			 permission.setPage_active(pmt_active);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeView() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			 permission = permissionDAO.findById(idValue);
			String pmt_view = request.getParameter("View");
			log.debug(pmt_view);
		
			
			
			// log.debug(page);
			 
			 permission.setView(pmt_view);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			 
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeCreateUpdate() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			 permission = permissionDAO.findById(idValue);
			String pmt_create_update = request.getParameter("CreateUpdate");
			log.debug(pmt_create_update);
		
			
			
			// log.debug(page);
			 
			 permission.setCreate_update(pmt_create_update);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeDelete() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			 permission = permissionDAO.findById(idValue);
			String pmt_delete = request.getParameter("Delete");
			log.debug(pmt_delete);
		
			
			
			// log.debug(page);
			 
			 permission.setDelete_role(pmt_delete);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeApprove() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			 permission = permissionDAO.findById(idValue);
			String pmt_approve = request.getParameter("Approve");
			log.debug(pmt_approve);
		
			
			
			// log.debug(page);
			 
			 permission.setApprove(pmt_approve);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeStatus() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getUser_id(); // Username login
			
			Permission permission =new Permission();
			String id_page_group = request.getParameter("page_group_id");
			log.debug(id_page_group);
			String id_sys_role = request.getParameter("sys_role_id");
			log.debug(id_sys_role);
			String page_status = request.getParameter("status");
			log.debug(page_status);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String datenow = sdf.format(timestamp).toString();
			Timestamp nowdate = Timestamp.valueOf(datenow);
			log.debug(nowdate);
			List<Permission> permissionList=permissionDAO.updateStatus(id_sys_role, id_page_group, page_status, logonUser);
			// permission.setUser_update(logonUser);
			// permission.setTime_update(DateUtil.getCurrentTime());
			
			
			 

			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permissionList);
			 request.setAttribute("json", json);
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
