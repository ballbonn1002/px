package com.cubesofttech.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PageDAO;
import com.cubesofttech.dao.PageGroupDAO;
import com.cubesofttech.dao.PermissionDAO;
import com.cubesofttech.dao.Sys_roleDAO;

import com.cubesofttech.model.Page;
import com.cubesofttech.model.PageGroup;
import com.cubesofttech.model.Sys_role;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.cubesofttech.model.Permission;

import com.opensymphony.xwork2.ActionSupport;

public class Sys_roleAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(Sys_roleAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public Sys_roleDAO sys_roleDAO;
	@Autowired
	public PageDAO pageDAO;
	@Autowired
	public PageGroupDAO page_groupDAO;
	@Autowired
	public PermissionDAO permissionDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Sys_role = "sys_roleList";
	
	public String list() {
		try {
					List<Sys_role> sys_roleList = sys_roleDAO.findAll();
					request.setAttribute(Sys_role, sys_roleList);
					log.debug(sys_roleList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	public String saveSys_role() {
		try {
			
			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login
			
			
			Sys_role sys_roleList = new Sys_role();
			Permission permission = new Permission();
			
			
			String administrator = "0";
			String page_group_active = "1";
			String page_active = "0";
			String view = "0";
			String create_update = "0";
			String del_role = "0";
			String approve = "0";
			
			String name = request.getParameter("Name");
			String description = request.getParameter("Description");
			log.debug(name);
			log.debug(description);
			sys_roleList.setName(name);
			//System.out.println("name " + name);
			sys_roleList.setDescription(description);
			//System.out.println("Description " + description);
			sys_roleList.setAdministrator(administrator);
			sys_roleList.setUser_create(logonUser);
			sys_roleList.setUser_update(logonUser);
			sys_roleList.setTime_create(DateUtil.getCurrentTime());
			sys_roleList.setTime_update(DateUtil.getCurrentTime());
			sys_roleDAO.save(sys_roleList);
			
			
		/*	List<Sys_role> sys_roleList = sys_roleDAO.findAll();
			request.setAttribute(Sys_role, sys_roleList); */
			
			
			
			request.setAttribute(Sys_role, sys_roleList);
			
			int ID = sys_roleList.getSys_role_id();
			String ID1 = String.valueOf(ID);
			log.debug(ID);
			
			 
			
		
			//permissionDAO.insert(ID);
			 permissionDAO.insert(ID1);
			 permissionDAO.updateBySysRoleId(ID1, page_group_active, page_active, view, create_update, del_role, approve);
			 
			 List<Permission> permissionList = permissionDAO.listPerxPage(ID1);
				//	log.debug(permissionList);
					request.setAttribute("permissionList", permissionList);
					
					List<Permission> perList = permissionDAO.testList(ID1);
					request.setAttribute("perList", perList);
					
					List<PageGroup> page_groupList = page_groupDAO.findAll();
					//List<Page> pageList = pageDAO.findAll();
					request.setAttribute("page_groupList", page_groupList);
			return SUCCESS;
		}catch(Exception e) {
			log.error(e);
			
				
		return ERROR;
		}
	
		
	}
	public String deleteSys_role(){
		try{
			String sys_roleId = request.getParameter("sys_role_id");
			Integer idValue = Integer.valueOf(sys_roleId);
			
			
			Sys_role sys_role = sys_roleDAO.findById(idValue);
		//	log.debug(sys_role);
			sys_roleDAO.delete(sys_role);
			List<Sys_role> sys_roleList = sys_roleDAO.findAll();
			request.setAttribute(Sys_role, sys_roleList);
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		
		}
		
	}
	public String editSys_role(){
		try{
			String sys_roleId = request.getParameter("sys_role_id");
			log.debug(sys_roleId);
			Integer idValue = Integer.valueOf(sys_roleId);
			Sys_role sys_roleList= new Sys_role();
			sys_roleList =sys_roleDAO.findById(idValue);
			request.setAttribute(Sys_role, sys_roleList);  
			
		//	List<Map<String, Object>> sys_rolelist = sys_roleDAO.sequense();
		
	//		request.setAttribute("sys_roleList", sys_rolelist);
			List<Permission> permissionList = permissionDAO.listPerxPage(sys_roleId);
			request.setAttribute("permissionList", permissionList);
			
			List<Permission> perList = permissionDAO.testList(sys_roleId);
			request.setAttribute("perList", perList);
			
			List<PageGroup> page_groupList = page_groupDAO.findAll();
			request.setAttribute("page_groupList", page_groupList);
			
			
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String checkName() {
		try {
			String sys_name = request.getParameter("name");
			log.debug(sys_name);
			Map<String, String> obj = new HashMap<>();
			List<Sys_role> find = sys_roleDAO.findByName(sys_name);
			String s = find.toString();
			if (s.equals("[]")) {
				String x = "0";
				obj.put("flag", x);
			} else {
				String a = "1";
				obj.put("flag", a);
			}
			Gson gson = new GsonBuilder().create();
			String jsonObjStr = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(jsonObjStr);
			out.flush();
			out.close();
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String updateSys_role() {
		try {

			User ur = (User) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getId(); // Username login
			
			String newName = request.getParameter("Name");
			log.debug(newName);
			String newDescription = request.getParameter("Description");
			log.debug(newDescription);
			String sysId = request.getParameter("id");
			log.debug(sysId);
			Integer idValue = Integer.valueOf(sysId);
			Sys_role sys_roleList= new Sys_role();
			sys_roleList =sys_roleDAO.findById(idValue);
			sys_roleList.setName(newName);
			sys_roleList.setDescription(newDescription);
			sys_roleList.setUser_update(logonUser);
			sys_roleList.setTime_update(DateUtil.getCurrentTime());
			sys_roleDAO.update(sys_roleList);
			request.setAttribute(Sys_role, sys_roleList);
			
			List<Permission> permissionList = permissionDAO.listPerxPage(sysId);
			request.setAttribute("permissionList", permissionList);
			
			List<Permission> perList = permissionDAO.testList(sysId);
			request.setAttribute("perList", perList);
			
			List<PageGroup> page_groupList = page_groupDAO.findAll();
			request.setAttribute("page_groupList", page_groupList);
			
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String findName() {
		try {
			String sys_name = request.getParameter("value");
			log.debug(sys_name);
			Map<String, String> obj = new HashMap<>();
			List<Sys_role> find = sys_roleDAO.findByName(sys_name);
			String s = find.toString();
			if (s.equals("[]")) {
				String x = "0";
				obj.put("flag", x);
			} else {
				String a = "1";
				obj.put("flag", a);
			}
			Gson gson = new GsonBuilder().create();
			String jsonObjStr = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(jsonObjStr);
			out.flush();
			out.close();
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}



}
