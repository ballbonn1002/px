package com.cubesofttech.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PageDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.cubesofttech.model.Page;

public class PageAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(PageAction.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public PageDAO pageDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Page = "pageList";
	
	public String listPage() {
		try {
					List<Page> pageList = pageDAO.findAll();
					request.setAttribute(Page, pageList);
					log.debug(pageList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }

}
