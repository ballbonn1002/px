package com.cubesofttech.action;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import static java.time.temporal.TemporalAdjusters.firstDayOfYear;
import static java.time.temporal.TemporalAdjusters.lastDayOfYear;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.exolab.castor.types.DateTime;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.struts2.components.Debug;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.LeaveTypeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.Holiday;
import com.cubesofttech.model.LeaveType;
import com.cubesofttech.model.Leaves;
import com.cubesofttech.model.User;
import com.cubesofttech.model.WorkHours;
import com.cubesofttech.util.DateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class WorkHoursAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	/* private static final long serialVersionUID = 2280661337420278284L; */
	
	private static final Integer Interger = null;

	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private WorkHoursDAO workHoursDAO;	
	
	@Autowired
	private LeaveDAO leaveDAO;
	
	@Autowired
	private LeaveTypeDAO leavetypeDAO;
	
	@Autowired
	private HolidayDAO holidayDAO;
	
	private static Calendar cal = Calendar.getInstance(); // Use Calendar .Year
	public static final String USERID = "userId"; 
	 
	

	
	public String reportSalaryDepart() {		
		try {
			
			List<Map<String, Object>> departmentId = workHoursDAO.departmentById();
			request.setAttribute("DepartmentId", departmentId);
			
			List<Map<String, Object>> findYearSalary = workHoursDAO.findYear();
			request.setAttribute("FindYearSalary", findYearSalary);

			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String findMonthSalaryDepart() {		
		try {
			String mYear = request.getParameter("findYear");
			String mDepart = request.getParameter("department");
			log.debug(mYear);
			log.debug(mDepart);
			
			List<Map<String, Object>> findMonth = workHoursDAO.monthSalary(mYear,mDepart);
			request.setAttribute("FindMonth", findMonth);
			
			//log.debug(findMonth);
			
			Gson gson = new Gson(); 
            String json = gson.toJson(findMonth); 
            request.setAttribute("json", json);	
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}


		
	

}
