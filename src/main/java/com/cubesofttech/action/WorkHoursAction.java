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
	private static String checkFlag = "";
	public static final String USERID = "userId"; 
	 

	public String reportWorkAllList() {
		try {
			
			List<Map<String, Object>> userlist = userDAO.UserEnable();
			request.setAttribute("userlist", userlist);
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date Longday = DateUtil.periodMinus(date, 8);
			Timestamp tstampbefore = new Timestamp(Longday.getTime());
			
			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);
			log.debug("datenow: "+datenow);
			
			Timestamp start_date = DateUtil.dateToTimestamp("01"+"-"+DateUtil.getMonth() +"-"+ DateUtil.getYear(), "00:00");
			Timestamp end_date = DateUtil.dateToTimestamp("31"+"-"+DateUtil.getMonth() +"-"+ DateUtil.getYear(), "00:00");
			log.debug(start_date);
			log.debug(end_date);

			String month = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			log.debug(month);
			log.debug(year);
			
			List<Map<String, Object>> worklist = workHoursDAO.worktime(month, year);
			request.setAttribute("worklist", worklist);
			
			List<Map<String, Object>> userwork = userDAO.userWork(month, year);
			request.setAttribute("userwork", userwork);
			
			
			return SUCCESS;
			
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
		
	}
	public String reportWorkSum() {
		try {
			/* userid from report_work.jsp*/
			String userid = request.getParameter("id");
			request.setAttribute("userid", userid);
			
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date Longday = DateUtil.periodMinus(date, 8);
			Timestamp tstampbefore = new Timestamp(Longday.getTime());
			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);
			request.setAttribute("datenowcalendar", datenow);
			
			Timestamp start_date1 = DateUtil.dateToTimestamp("01"+"-"+DateUtil.getMonth() +"-"+ DateUtil.getYear(), "00:00");
			Timestamp end_date1 = DateUtil.dateToTimestamp("31"+"-"+DateUtil.getMonth() +"-"+ DateUtil.getYear(), "00:00");
			System.out.println(start_date1+"/"+end_date1);
			List<Map<String, Object>> userleave = leaveDAO.findUserLeave(userid, start_date1, end_date1);
			request.setAttribute("userleave", userleave);
			
			List<LeaveType> type_leave1 = leavetypeDAO.findAll();
			request.setAttribute("leavetypelistChoice", type_leave1);
			request.setAttribute("type_1", type_leave1.get(0).getLeaveTypeName());
			request.setAttribute("type_2", type_leave1.get(1).getLeaveTypeName());
			request.setAttribute("type_3", type_leave1.get(2).getLeaveTypeName());
			request.setAttribute("type_4", type_leave1.get(3).getLeaveTypeName());
			request.setAttribute("type_5", type_leave1.get(4).getLeaveTypeName());
			request.setAttribute("type_6", type_leave1.get(5).getLeaveTypeName());
			
/*----------------------------------------------------------------------------------------------------------*/
			List<Map<String, Object>> userwork = userDAO.findUserWork(userid);
			request.setAttribute("userwork", userwork);
			//List<Map<String, Object>> leavesum = leaveDAO.leaveApprSum(userid, start_date1, end_date1);
			//userwork.addAll(leavesum);
/*----------------------------------------------------------------------------------------------------------*/
			
			String year = datenow.substring(6, 10);
			List<Map<String, Object>> test1 = workHoursDAO.checkoutcalendar(userid, year);
			List<Map<String, Object>> test2 = workHoursDAO.checkincalendar(userid, year);
			JSONArray test1arr = new JSONArray(test1);
			JSONArray test2arr = new JSONArray(test2);
			List listcheck = new ArrayList<>();
			for(int i = 0;i<test1arr.length();i++) {
				HashMap<String, String> obj = new HashMap<String, String>();
			    obj.put("datecheck", test1arr.getJSONObject(i).getString("datecheck"));
			    String checkintime = test2arr.getJSONObject(i).getString("checkin");
			    String checkin = checkintime.substring(0, 5);
			    obj.put("checkin", checkin);
			    
			    String checkouttime = test1arr.getJSONObject(i).getString("checkout");
			    String checkout = checkouttime.substring(0, 5);
		    	obj.put("checkout", checkout);
			    listcheck.add(obj);
		    }	
			request.setAttribute("listcheck", listcheck);
			
			List<Holiday> holidayList = holidayDAO.findAll();
			request.setAttribute("holidayList", holidayList);

			List<Map<String, Object>> userseq = userDAO.sequense();
			request.setAttribute("userseq", userseq);

			// leaves
			List<LeaveType> leavetypeList = leavetypeDAO.findAll_calendar();
			request.setAttribute("leavetypeList", leavetypeList);

			List<LeaveType> type_leave = leavetypeDAO.findAll_calendar();
			for (int j = 0; j < type_leave.size(); j++) {
				LeaveType leave = type_leave.get(j);
				request.setAttribute("type_" + leave.getLeaveTypeId(), leave.getLeaveTypeName());
			}

			DateTimeFormatter dateT = DateTimeFormatter.ofPattern("01-01-yyyy");
			LocalDate localDate = LocalDate.now();
			String s = "00:00:00.0";

			Timestamp start_date = DateUtil.dateToTimestamp(dateT.format(localDate), s);
			Timestamp end_date = DateUtil.changetoEndYear(dateT.format(localDate));
			List leavelist = leaveDAO.myLeavesList(userid, start_date, end_date);
			Double leave_1 = 0.000, leave_2 = 0.000, leave_3 = 0.000, leave_5 = 0.000, leave_6 = 0.000;
			String status = "1";
			List LeaveID = leaveDAO.findLeaveId(userid, start_date, end_date, status);
			if (leavelist != null) {
				request.setAttribute("leave", leavelist);
				int x = 0;
				while (x <= LeaveID.size() - 1) {
					String a[] = LeaveID.get(x).toString().split("[={}]");
					for (int b = 0; b <= a.length - 1; b++) {
					}
					int id = 0;
					for (int b = 0; b <= a.length - 1; b++) {
						if (tryParseInt(a[b])) {
							log.debug("inIf");
							id = Integer.parseInt(a[b]);
							Leaves leaveDashboard = leaveDAO.findByLeaveId(id);
							Double noday = leaveDashboard.getNoDay().doubleValue();
							if (leaveDashboard.getLeaveTypeId().contains("1")) {
								leave_1 = leave_1 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("2")) {
								leave_2 = leave_2 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("3")) {
								leave_3 = leave_3 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("5")) {
								leave_5 = leave_5 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("6")) {
								leave_6 = leave_6 + noday;
							}
						}
					}
					x++;
				}
			}
			request.setAttribute("leave_1", leave_1);
			request.setAttribute("leave_2", leave_2);
			request.setAttribute("leave_3", leave_3);
			request.setAttribute("leave_5", leave_5);
			request.setAttribute("leave_6", leave_6);	
			
			String flag_cal = request.getParameter("flag");
			if (flag_cal != null) {
				Calendar cal1 = Calendar.getInstance();
				cal = cal1;
			}
			
			int month1 = cal.get(Calendar.MONTH);
			int year1 = cal.get(Calendar.YEAR);

			request.setAttribute("now_month", month1);
			request.setAttribute("now_year", year1);
			checkFlag = "0";
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	public void searchCalendar() {
		try {
			log.debug("searchCalendar");
			String userid = request.getParameter("userid");			
			String year = request.getParameter("year");
			List<Map<String, Object>> test1 = workHoursDAO.checkoutcalendar(userid, year);
			List<Map<String, Object>> test2 = workHoursDAO.checkincalendar(userid, year);

			JSONArray test1arr = new JSONArray(test1);
			JSONArray test2arr = new JSONArray(test2);
			
			JSONArray arrayCheck1 = new JSONArray();
			JSONArray arrayCheck2 = new JSONArray();
			JSONArray arrayCheck3 = new JSONArray();
			for(int i = 0 ; i < test1.size(); i++ ){
				arrayCheck1.put(test1arr.getJSONObject(i).getString("datecheck"));
				String checkouttime = test1arr.getJSONObject(i).getString("checkout");
				String checkout;
				String checkouttime_sub = checkouttime.substring(0, 5);
				checkout = checkouttime_sub;
				arrayCheck2.put(checkout);
			}
			for(int i = 0 ; i < test2.size(); i++ ){
				String checkintime = test2arr.getJSONObject(i).getString("checkin");
				String checkin;
				String checkintime_sub = checkintime.substring(0, 5);
	    		checkin = checkintime_sub;
	    		arrayCheck3.put(checkin);
			}
			
			PrintWriter out = response.getWriter();
	        JSONObject json = new JSONObject();
	        json.put("datecheck", arrayCheck1);
	        json.put("checkout", arrayCheck2);
	        json.put("checkin", arrayCheck3);
	        
			// leaves
			List<LeaveType> leavetypeList = leavetypeDAO.findAll_calendar();
			request.setAttribute("leavetypeList", leavetypeList);

			List<LeaveType> type_leave = leavetypeDAO.findAll_calendar();
			for (int j = 0; j < type_leave.size(); j++) {
				LeaveType leave = type_leave.get(j);
				request.setAttribute("type_" + leave.getLeaveTypeId(), leave.getLeaveTypeName());
			}

			DateTimeFormatter dateT = DateTimeFormatter.ofPattern("01-01-yyyy");
			LocalDate localDate = LocalDate.now();
			System.out.println("localDate: "+localDate);
			String s = "00:00:00.0";
			
			String start = (year+"-01-01 "+s);
			String end = (year+"-12-31 "+s);
			Timestamp start_date = Timestamp.valueOf(start);
			Timestamp end_date = Timestamp.valueOf(end);;
			log.debug("start_date: "+start_date);
			log.debug("end_date: "+end_date);
			
			List leavelist = leaveDAO.myLeavesList(userid, start_date, end_date);
			Double leave_1 = 0.000, leave_2 = 0.000, leave_3 = 0.000, leave_5 = 0.000, leave_6 = 0.000;
			String status = "1";
			List LeaveID = leaveDAO.findLeaveId(userid, start_date, end_date, status);
			if (leavelist != null) {
				request.setAttribute("leave", leavelist);
				//System.out.println(leavelist);
				int x = 0;
				while (x <= LeaveID.size() - 1) {
					String a[] = LeaveID.get(x).toString().split("[={}]");
					for (int b = 0; b <= a.length - 1; b++) {
					}
					int id = 0;
					for (int b = 0; b <= a.length - 1; b++) {
						if (tryParseInt(a[b])) {
							id = Integer.parseInt(a[b]);
							Leaves leaveDashboard = leaveDAO.findByLeaveId(id);
							Double noday = leaveDashboard.getNoDay().doubleValue();
							if (leaveDashboard.getLeaveTypeId().contains("1")) {
								leave_1 = leave_1 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("2")) {
								leave_2 = leave_2 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("3")) {
								leave_3 = leave_3 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("5")) {
								leave_5 = leave_5 + noday;
							}
							if (leaveDashboard.getLeaveTypeId().contains("6")) {
								leave_6 = leave_6 + noday;
							}
						}
					}
					x++;
				}
			}
			
			request.setAttribute("leave_1", leave_1);
			request.setAttribute("leave_2", leave_2);
			request.setAttribute("leave_3", leave_3);
			request.setAttribute("leave_5", leave_5);
			request.setAttribute("leave_6", leave_6);
			
			JSONArray arrayLeave1 = new JSONArray();
			JSONArray arrayLeave2 = new JSONArray();
			JSONArray arrayLeave3 = new JSONArray();
			JSONArray arrayLeave4 = new JSONArray();
			
			JSONArray leavelist_arr = new JSONArray(leavelist);
			System.out.println(leavelist_arr);
			for(int i=0; i<leavelist.size(); i++) {
				arrayLeave1.put(leavelist_arr.getJSONObject(i).getInt("leave_id"));
				arrayLeave2.put(leavelist_arr.getJSONObject(i).getString("start_date"));
				arrayLeave3.put(leavelist_arr.getJSONObject(i).getString("end_date"));
				arrayLeave4.put(leavelist_arr.getJSONObject(i).get("leave_type_id"));
			}
			json.put("leave_id", arrayLeave1);
			json.put("leave_start", arrayLeave2);
			json.put("leave_end", arrayLeave3);
			json.put("leave_typeid", arrayLeave4);
	        
	        out.print(json);
	    	out.flush();
	    	out.close();
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String searchMonthYear() {
		try {
		log.debug("searchMonthYear");	

		String selectmonth = request.getParameter("month");
		String year = request.getParameter("year");
		int s_month = Integer.parseInt(selectmonth)+1;
		String month = Integer.toString(s_month);  
		log.debug("month "+month);
		log.debug("year "+year);

		List<Map<String, Object>> worklist = workHoursDAO.worktime(month, year);
		request.setAttribute("worklist", worklist);
		
		List<Map<String, Object>> userwork = userDAO.userWork(month, year);
		request.setAttribute("userwork", userwork);
		log.debug(userwork);
		
		return SUCCESS;
		
		} catch(Exception e) {
			log.error(e);
			return ERROR;
		}
	}
		
	private boolean tryParseInt(String value) {
		try {
			int x = Integer.parseInt(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
		
	}
}
