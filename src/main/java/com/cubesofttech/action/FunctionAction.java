package com.cubesofttech.action;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.model.WorkHours;
import com.opensymphony.xwork2.ActionSupport;

public class FunctionAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(PaymentTypeAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	public FunctionDAO funtionDAO;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	
	public String getWorkingList() {
		try {
			String userId = request.getParameter("userId") == null ? "test.data1" : request.getParameter("userId") ;
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			//Set default if startDate,endDate null value
			Date date = new Date();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();		
			LocalDate lastDayOfMonth = localDate.with(TemporalAdjusters.lastDayOfMonth());
			LocalDate firstDayOfMonth = localDate.with(TemporalAdjusters.firstDayOfMonth());
			
			if(startDate == null) {
				startDate = firstDayOfMonth.toString();
			}
			if(endDate == null) {
				endDate = lastDayOfMonth.toString();
			}
						
			List<Map<String, Object>> workingList = funtionDAO.findWorkingList(userId, startDate, endDate);	//List for display on table detail
			List<Map<String, Object>> workingSummary = funtionDAO.findWorkingSummary(userId, startDate, endDate); //Summary (record 0) : count_working,actual_working,absent,sum_hours
					
			request.setAttribute("WorkingList", workingList);
			request.setAttribute("WorkingSummary", workingSummary);
			
			return SUCCESS;

		} catch (Exception e) {

			return ERROR;
		}
	}
}
