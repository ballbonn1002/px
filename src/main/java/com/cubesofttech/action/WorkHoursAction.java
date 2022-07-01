package com.cubesofttech.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Debug;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.LeaveTypeDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.LeaveType;
import com.cubesofttech.model.WorkHours;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
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

	
	/*
	 * public static final String USERID = "userId"; 
	 * public static final String ONLINEUSER = "onlineUser";
	 */

	public String reportWorkAllList() {
		try {
			
			List<Map<String, Object>> userlist = userDAO.UserEnable();
			request.setAttribute("userlist", userlist);
			System.out.println(userlist);
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date Longday = DateUtil.periodMinus(date, 8);
			Timestamp tstampbefore = new Timestamp(Longday.getTime());
			
			Date date1;
			date1 = tstamp;
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);
			
			String month = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);
			
			List<Map<String, Object>> workhoursList = workHoursDAO.findworkmonthalll(tstamp, tstampbefore, month, year);
			request.setAttribute("workhoursList", workhoursList);
			
			/* log.debug(list); */
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
			System.out.println(userid);
			
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
			String month = datenow.substring(3, 5);
			String year = datenow.substring(6, 10);			
			
			Timestamp start_date = DateUtil.dateToTimestamp("01"+"-0"+DateUtil.getMonth() +"-"+ DateUtil.getYear(), "00:00");
			Timestamp end_date = DateUtil.dateToTimestamp("31"+"-"+DateUtil.getMonth() +"-"+ DateUtil.getYear(), "00:00");
			System.out.println(start_date+"/"+end_date);
			List<Map<String, Object>> userleave = leaveDAO.findUserLeave(userid, start_date, end_date);
			request.setAttribute("userleave", userleave);
			
			List<LeaveType> type_leave = leavetypeDAO.findAll();
			request.setAttribute("leavetypelistChoice", type_leave);
			request.setAttribute("type_1", type_leave.get(0).getLeaveTypeName());
			request.setAttribute("type_2", type_leave.get(1).getLeaveTypeName());
			request.setAttribute("type_3", type_leave.get(2).getLeaveTypeName());
			request.setAttribute("type_4", type_leave.get(3).getLeaveTypeName());
			request.setAttribute("type_5", type_leave.get(4).getLeaveTypeName());
			request.setAttribute("type_6", type_leave.get(5).getLeaveTypeName());
/*----------------------------------------------------------------------------------------------------------*/
			
		/*	User ur = (User) request.getSession().getAttribute(ONLINEUSER);
			String logonUser = ur.getId(); // check list
			String userId = ur.getId(); // leaves
			request.setAttribute("logonUser", logonUser);
			request.setAttribute("userId", userId);
			String usercalendar = request.getParameter(USERID);
			if (usercalendar != null) {
				userId = usercalendar;
			}
			Date date = new Date();
			Timestamp tstamp = new Timestamp(date.getTime());
			Date date1 = tstamp;

			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			String datenow = dateFormat.format(date1);
			request.setAttribute("datenow", datenow);
			request.setAttribute("datenowcalendar", datenow);
			String timecalendar = request.getParameter("timecalendar");
			String datecalendar = request.getParameter("datecalendar");
			request.setAttribute("datecalendar", datecalendar);
			String month = null;
			String year = null;
			if (datecalendar == null) {
				month = datenow.substring(3, 5);
				year = datenow.substring(6, 10);
			} else {
				month = datecalendar.substring(0, 2);
				year = datecalendar.substring(6, 10);
			}

			List<Map<String, Object>> work = workHoursDAO.checklistcalendar(logonUser, month, year);
			List<Map<String, Object>> timemonth = workHoursDAO.timemonth(logonUser, month, year);

			int i = 0;
			int checkinhourtoday = 0;
			int checkinmintoday = 0;
			int checkourhourtomorrow = 0;
			int checkourmintomorrow = 0;
			int fullhourtomorrow = 0;
			int fullmintomorrow = 0;
			int fulltomorrow = 0;
			int fulltimehour = 0;
			int fulltimemin = 0;

			for (Map<String, Object> map : timemonth) {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					Date date11 = (Date) entry.getValue();
					DateFormat datFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					String x = datFormat.format(date11);
					String time = x.toString();
					String datecheckin = time.substring(0, 10);
					request.setAttribute("datecheckin", datecheckin);

					// check status check in
					User user = userDAO.findById(logonUser);
					String stime = user.getWorkTimeStart();
					request.setAttribute("stime", stime);

					List<Map<String, Object>> checkincalendars = workHoursDAO.checkincalendars(datecheckin, logonUser,
							month, year);
					String checkout = null;
					String checkout1 = null;
					for (Map<String, Object> map1 : checkincalendars) {
						for (Map.Entry<String, Object> entry1 : map1.entrySet()) {
							Timestamp x1 = (Timestamp) entry1.getValue();
							checkout = x1.toString().substring(0, 16);
							checkourhourtomorrow = Interger.parseInt(x1.toString().substring(11, 13)); // hourin
							checkourmintomorrow = Interger.parseInt(x1.toString().substring(14, 16)); // minin
							work.get(i).put("mycheckin", checkout);
							work.get(i).put("mycheckins", x1);
						}
					}
					if (checkincalendars.size() == 0) {
						work.get(i).put("mycheckins", x);
					}
					List<Map<String, Object>> works = workHoursDAO.checklistcalendars(datecheckin, logonUser, month,
							year);
					if (works.size() == 0) { // time checkout tomorrow
						List<Map<String, Object>> idcheckincalendars = workHoursDAO.idcheckincalendars(datecheckin,
								logonUser, month, year);
						for (Map<String, Object> map1 : idcheckincalendars) {
							for (Map.Entry<String, Object> entry1 : map1.entrySet()) {
								BigInteger a = (BigInteger) entry1.getValue();
								String idcheckin = a.toString();

								List<Map<String, Object>> idcheckoutcalendars = workHoursDAO
										.idcheckoutcalendars(idcheckin, logonUser);
								for (Map<String, Object> map2 : idcheckoutcalendars) {
									for (Map.Entry<String, Object> entry2 : map2.entrySet()) {
										BigInteger a2 = (BigInteger) entry2.getValue();
										String idcheckoutsearchtime = a2.toString();
										List<Map<String, Object>> timecheckoutfromid = workHoursDAO
												.timecheckoutfromid(idcheckoutsearchtime);
										for (Map<String, Object> map3 : timecheckoutfromid) {
											for (Map.Entry<String, Object> entry3 : map3.entrySet()) {
												Timestamp x3 = (Timestamp) entry3.getValue();
												String checkout3 = x3.toString().substring(11, 16);
												checkinhourtoday = Interger.parseInt(x3.toString().substring(11, 13)); // hourtoday
												checkinmintoday = Interger.parseInt(x3.toString().substring(14, 16)); // mintoday
												fullhourtomorrow = ((24 - checkourhourtomorrow) + checkinhourtoday)
														* 60;
												fullmintomorrow = (checkinmintoday - checkourmintomorrow);
												fulltomorrow = (fullhourtomorrow + fullmintomorrow);
												fulltimehour = (fulltomorrow / 60) - 1;
												fulltimemin = fulltomorrow % 60;

												if (checkinhourtoday == checkourhourtomorrow
														&& checkinmintoday <= checkourmintomorrow) { // checkin>checkout
													work.get(i).put("checkouttime", checkout3);
												} else if (checkinhourtoday < checkourhourtomorrow) {
													work.get(i).put("checkouttime", checkout3);
												} else {
												}
											}
										}
									}
								}
							}
						} // close time checkout tomorrow
					} else {
						for (Map<String, Object> map1 : works) {
							for (Map.Entry<String, Object> entry1 : map1.entrySet()) {
								Timestamp x1 = (Timestamp) entry1.getValue();
								checkout1 = x1.toString().substring(11, 16);
								work.get(i).put("checkouttime", checkout1);
							}
						}
					}
					List<Map<String, Object>> works1 = workHoursDAO.checklistcalendarstime(datecheckin, logonUser,
							month, year);
					String fulltimehourx = null, fulltimeminx = null;
					if (works1.size() == 0
							&& (checkinhourtoday == checkourhourtomorrow && checkinmintoday <= checkourmintomorrow)) { // timecheckouttomorrow
						if (fulltimehour == 0 && fulltimemin == 0) {
							fulltimehourx = "";
							fulltimeminx = "";
							work.get(i).put("min", fulltimeminx);
						} else {
							work.get(i).put("hour", fulltimehour);
							work.get(i).put("min", fulltimemin);
						}
					} else if (checkinhourtoday < checkourhourtomorrow) {

						if (fulltimehour == 0 && fulltimemin == 0) {
							fulltimehourx = "";
							fulltimeminx = "";
							work.get(i).put("hour", fulltimehourx);
							work.get(i).put("min", fulltimeminx);
						} else {
							work.get(i).put("hour", fulltimehour);
							work.get(i).put("min", fulltimemin);
						}
					} else {
					}

					checkinhourtoday = 0;
					checkinmintoday = 0;
					checkourhourtomorrow = 0;
					checkourmintomorrow = 0;
					fullhourtomorrow = 0;
					fullmintomorrow = 0;
					fulltomorrow = 0;
					fulltimehour = 0;
					fulltimemin = 0;
					int hours = 0;
					int min = 0;
					String fulltimehourx1 = null;
					for (Map<String, Object> map1 : works1) {
						for (Map.Entry<String, Object> entry1 : map1.entrySet()) {
							if (entry1.getValue() == null) { //
								fulltimehourx1 = "";
								work.get(i).put("hour", fulltimehourx1);
								work.get(i).put("min", fulltimehourx1);
							} else {
								int x1 = (Integer) entry1.getValue();
								if ((x1 == 0)) {
									hours = 0;
									min = 0;
									String h = String.valueOf(hours);
									String m = String.valueOf(min);
									String hour = ("" + 0 + h);
									String mins = ("" + 0 + m);
									work.get(i).put("hour", hour);
									work.get(i).put("min", mins);
								} else if (x1 > 0) {
									min = x1 % 60;
									hours = x1 / 60;
									if (hours <= 10 && min < 10) {
										String h = String.valueOf(hours);
										String m = String.valueOf(min);
										String hours1 = ("" + 0 + h);
										int hour = Interger.parseInt(hours1);
										String mins = ("" + 0 + m);
										if (hour == 0) {
											work.get(i).put("hour", (hour));
										} else {
											work.get(i).put("hour", (hour - 1));
										}
										work.get(i).put("min", mins);

									} else if (hours <= 10 && min > 10) {
										String h = String.valueOf(hours);
										String m = String.valueOf(min);
										String hours1 = ("" + 0 + h);
										int hour = Interger.parseInt(hours1);
										if (hour == 0) {
											work.get(i).put("hour", (hour));
										} else {
											work.get(i).put("hour", (hour - 1));
										}
										work.get(i).put("min", min);

									} else if (hours > 10 && min < 10) {
										String h = String.valueOf(hours);
										String m = String.valueOf(min);
										String hour2 = ("" + 0 + h);
										String min1 = ("" + 0 + m);
										int hour = Interger.parseInt(hour2);
										work.get(i).put("hour", (hour - 1));
										work.get(i).put("min", min1);

									} else if (min < 10) {
										String m = String.valueOf(min);
										String mins = ("" + 0 + m);
										work.get(i).put("hour", (hours - 1));
										work.get(i).put("min", mins);
									} else {
										work.get(i).put("hour", (hours - 1));
										work.get(i).put("min", min);
									}
								} else {
									hours = 0;
									min = 0;
									work.get(i).put("hour", hours);
									work.get(i).put("min", min);
								}
							}
						}
					}
					i++;
				}
			}

			List<Map<String, Object>> startmonth = workHoursDAO.startmonth(logonUser, month, year);
			String startmonths = null;
			for (Map<String, Object> maps : startmonth) {
				for (Map.Entry<String, Object> entry : maps.entrySet()) {
					Date date11 = (Date) entry.getValue();
					DateFormat datFormat = new SimpleDateFormat("01-MM-yyyy");
					startmonths = datFormat.format(date11);
				}
			}
			request.setAttribute("startmonths", startmonths);

			List<Map<String, Object>> cubeUser = userDAO.sequense();
			request.setAttribute("cubeUser", cubeUser);
			request.setAttribute("work", work);
			request.setAttribute("checktimecalendar", "1");

			String test = (year + "-" + month + "-" + "01");
			request.setAttribute("month", month);
			request.setAttribute("test", test);
			if (timecalendar != null) {
				request.setAttribute("flag12", test);
			}

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
			List leavelist = leaveDAO.myLeavesList(userId, start_date, end_date);
			Double leave_1 = 0.000, leave_2 = 0.000, leave_3 = 0.000, leave_5 = 0.000, leave_6 = 0.000;
			String status = "1";
			List LeaveID = leaveDAO.findLeaveId(userId, start_date, end_date, status);
			if (leavelist != null) {
				request.setAttribute("leave", leavelist);
				int x = 0;
				while (x <= LeaveID.size() - 1) {
					System.out.println("inLoopWhile");
					String a[] = LeaveID.get(x).toString().split("[={}]");
					System.out.println("Split Success");
					for (int b = 0; b <= a.length - 1; b++) {
						System.out.println("a[" + b + "]= " + a[b]);
					}
					int id = 0;
					for (int b = 0; b <= a.length - 1; b++) {
						System.out.println("inLoopFor");
						if (tryParseInt(a[b])) {
							System.out.println("inIf");
							id = Integer.parseInt(a[b]);
							System.out.println("This is Array No: " + b + " =" + a[b]);
							Leaves leaveDashboard = leaveDAO.findByLeaveId(id);
							System.out.println("Ref Success");
							Double noday = leaveDashboard.getNoDay().doubleValue();
							System.out.println("This NoDay : " + noday);
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

				System.out.println("777");
			}
			request.setAttribute("leave_1", leave_1);
			request.setAttribute("leave_2", leave_2);
			request.setAttribute("leave_3", leave_3);
			request.setAttribute("leave_5", leave_5);
			request.setAttribute("leave_6", leave_6);	*/
			
			
			
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	
	
	
	public String bonusReport(){
		try {
			List<Map<String, Object>> Users = userDAO.Query_Userlist();
			request.setAttribute("Users", Users);
			log.debug(Users);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
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

	public String findBonusByYear(){
		try {
			//List<Map<String, Object>> Users = userDAO.Query_Userlist();
			//request.setAttribute("Users", Users);
			
			String userid = request.getParameter("user_id");
			String year = request.getParameter("year");
			
			List<Map<String, Object>> BonusByYear = workHoursDAO.findBonusByYear(userid,year);
			
			//query code
			
            Gson gson = new Gson(); 
            String json = gson.toJson(BonusByYear); 
            request.setAttribute("json", json);	
            
			log.debug(userid);
			log.debug(year);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
		
	

}
