package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.cubesofttech.model.Department;
import com.opensymphony.xwork2.ActionSupport;

public class DashboardAction extends ActionSupport {
	
	private static final Logger log = Logger.getLogger(DashboardAction.class);
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String list() {
		try {
				
					
				return SUCCESS;
		} catch (Exception e) {
				log.error(e);
				return ERROR;
		}
	}

}
