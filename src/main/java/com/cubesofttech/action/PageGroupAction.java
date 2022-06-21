package com.cubesofttech.action;

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
import com.cubesofttech.model.Page;
import com.cubesofttech.model.PageGroup;
import com.cubesofttech.model.Permission;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PageGroupAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(PageGroupAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public PageGroupDAO page_groupDAO;
	@Autowired
	public PageDAO pageDAO;
	@Autowired
	public PermissionDAO permissionDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String PageGroup = "page_groupList";
	public static final String Page = "pageList";
	public String list() {
		try {
					List<PageGroup> page_groupList = page_groupDAO.findAll();
					//List<Page> pageList = pageDAO.findAll();
					request.setAttribute("page_groupList", page_groupList);
					//log.debug(page_groupList);
					//request.setAttribute(Page, pageList);
					
					List<Page> pageList=pageDAO.findAll();
					request.setAttribute("pageList", pageList);
					
				/*	List<Permission> permissionList = permissionDAO.findAll();
					request.setAttribute("permissionList", permissionList);
					log.debug(permissionList); */
					//log.debug(pageList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	public String changeIsActive() {
		try { 
			Page page = new Page();
			String Id_page = request.getParameter("page_Id");
			log.debug(Id_page);
			 page = pageDAO.findById(Id_page);
			String isActive = request.getParameter("Active");
			log.debug(isActive);
		
			
			
			// log.debug(page);
			 
			 page.setIs_active(isActive);
			
			 pageDAO.update(page);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(page);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	
	}
	public String changeCheck_view() {
		try { 
			Page page = new Page();
			String Id_page = request.getParameter("page_Id");
			log.debug(Id_page);
			 page = pageDAO.findById(Id_page);
			
		     String View = request.getParameter("View");
			
			
			
			// log.debug(page);
			 
			 page.setCheck_view(View);
			
			
			 pageDAO.update(page);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(page);
			 request.setAttribute("json", json);			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	
	}
	public String changeCheck_CreateUpdate() {
		try { 
			Page page = new Page();
			String Id_page = request.getParameter("page_Id");
			log.debug(Id_page);
			 page = pageDAO.findById(Id_page);
			
		     String CreateUpdate = request.getParameter("CreateUpdate");
			
			
			
			// log.debug(page);
			 
			 page.setCheck_create_update(CreateUpdate);
		
			
			 pageDAO.update(page);
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(page);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	
	}
	public String changeCheck_Delete() {
		try { 
			Page page = new Page();
			String Id_page = request.getParameter("page_Id");
			log.debug(Id_page);
			 page = pageDAO.findById(Id_page);
			
		     String Delete = request.getParameter("Delete");
			
			
			
			// log.debug(page);
			 
			 page.setCheck_delete(Delete);
			
			 pageDAO.update(page);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(page);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	
	}
	public String changeCheck_Approve() {
		try { 
			Page page = new Page();
			String Id_page = request.getParameter("page_Id");
			log.debug(Id_page);
			 page = pageDAO.findById(Id_page);
			
		     String Approve = request.getParameter("Approve");
			
			
			
			// log.debug(page);
			 
			 page.setCheck_approve(Approve);
			
			 pageDAO.update(page);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(page);
			 request.setAttribute("json", json);
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	
	}
	public String delete(){
		try{
			

			String idPage = request.getParameter("pageId");
						
			Page page = new Page();
			page = pageDAO.findById(idPage);
			log.debug(page);
			pageDAO.delete(page);
			List<Page> pageList = pageDAO.findAll();
			request.setAttribute(Page, pageList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
		
	}
}
