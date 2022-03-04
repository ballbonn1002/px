package com.cubesofttech.tx;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;


import com.cubesofttech.dao.FileUploadDAO;
import com.cubesofttech.dao.JobsiteDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.FaqImage;
import com.cubesofttech.model.FileUpload;
import com.cubesofttech.model.Jobsite;
import com.cubesofttech.model.FAQCategory;
import com.cubesofttech.model.FAQStatus;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ibm.icu.util.GregorianCalendar;
import com.opensymphony.xwork2.ActionSupport;

public class jobsiteTX extends ActionSupport {
	public static final String ONLINEUSER = "onlineUser";
	private static final Logger log = Logger.getLogger(jobsiteTX.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private JobsiteDAO jobsiteDAO;

	@Autowired
	private UserDAO userDAO;

	Integer id;

	List<Map<String, Object>> faqJoin; // faqJoin include faq and faq_category and faq_status columns
	List<FAQCategory> faqCategoryList;
	List<FAQStatus> faqStatusList;
	

	/* FAQ Image */
	File FaqImage;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String jobsite_add() {
		try {	
			List<Map<String, Object>> jslist = jobsiteDAO.findAll();
			request.setAttribute("jobsitelist", jslist);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String jobsite_json() {
		try {

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(jobsiteDAO.findAll3());

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	public String jobsite_jsonbyid() {
		try {
			log.debug("id: " + id);
			Gson gson = new GsonBuilder().create();
			
			String responseJSON = gson.toJson(jobsiteDAO.findAllbyid(id));

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	public String jobsite_save() {
		try {
			
			String name = request.getParameter("name");
			String user_create = request.getParameter("user");
			
			Jobsite jobsite = new Jobsite();
		
			jobsite.setName_site(name);
			jobsite.setUser_create(user_create);
			jobsite.setTime_create(DateUtil.getCurrentTime());

			jobsiteDAO.save(jobsite);
			

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}

	}
	public String jobsite_delete() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Jobsite jobsite = jobsiteDAO.findById(idValue);

			jobsiteDAO.delete(jobsite);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	public String jobsite_edit() throws Exception {
		try {
			String Id = request.getParameter("id");
			Integer idValue = Integer.valueOf(Id);
			Jobsite jobsite = jobsiteDAO.findById(idValue);
			
			String namesite = request.getParameter("name");
			String user_update = request.getParameter("user");
			jobsite.setName_site(namesite);
			jobsite.setUser_update(user_update);
			jobsite.setTime_update(DateUtil.getCurrentTime());
			jobsiteDAO.update(jobsite);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e.getMessage());
			return ERROR;
		}
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}

