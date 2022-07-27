package com.cubesofttech.action;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.MigrateDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.Migrate;
import com.cubesofttech.model.User;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class MigrateAction extends ActionSupport {
	
	private static final Logger log = Logger.getLogger(FunctionAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public MigrateDAO migrateDAO;
	
	public String migrateData() {
		try {
			String action = request.getParameter("action") == null ? "" : request.getParameter("action") ;
			User user = (User) request.getSession().getAttribute("onlineUser");
			String userId = user.getId(); 
			String migrateResult = migrateDAO.migrateData(action,userId);
					
			JSONObject responseText = new JSONObject();
			responseText.put("message", migrateResult);
			request.setAttribute("json", responseText);
			
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	public String getMigrateList() {
		try {
			boolean showMore = Boolean.parseBoolean(request.getParameter("show_more")) ;
			List<Migrate> migrateList = migrateDAO.getMigrateList(showMore);
					
            Gson gson = new Gson(); 
            String json = gson.toJson(migrateList); 
            request.setAttribute("json", json);	
			
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
}
