package com.cubesofttech.ms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.HolidayDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class HolidayMS extends ActionSupport {

	
	private static final long serialVersionUID = 1L;

	private static final Logger log = Logger.getLogger(HolidayMS.class);

	@Autowired
	private HolidayDAO holidayDAO;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String getAllHoliday() {
		try {

			Gson gson = new GsonBuilder().create();

			String responseJSON = gson.toJson(holidayDAO.findAll());

			request.setAttribute("json", responseJSON);
			log.debug(responseJSON);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
