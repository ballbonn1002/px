package com.cubesofttech.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.ListUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Debug;
import org.hibernate.boot.model.naming.ImplicitNameSource;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.beust.jcommander.internal.Console;
import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.FunctionDAO;
import com.cubesofttech.dao.HolidayDAO;
import com.cubesofttech.dao.LeaveDAO;
import com.cubesofttech.dao.LeaveTypeDAO;
import com.cubesofttech.dao.PaymentDAO;
import com.cubesofttech.dao.Payment_groupDAO;
import com.cubesofttech.dao.Payment_typeDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.dao.UserDAO;
import com.cubesofttech.dao.UserPaymentConfigDAO;
import com.cubesofttech.dao.WorkHoursDAO;
import com.cubesofttech.model.Holiday;
import com.cubesofttech.model.LeaveType;
import com.cubesofttech.model.Leaves;
import com.cubesofttech.model.Payment_group;
import com.cubesofttech.model.Payment_type;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PayrollReportAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(PaymentTypeAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserPaymentConfigDAO userpaymentconfigDAO;

	@Autowired
	private Payment_groupDAO payment_groupDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private PaymentDAO paymentDAO;

	@Autowired
	private Payment_typeDAO payment_typeDAO;

	@Autowired
	private WorkHoursDAO workHoursDAO;

	@Autowired
	private LeaveDAO leaveDAO;

	@Autowired
	private LeaveTypeDAO leavetypeDAO;

	@Autowired
	private HolidayDAO holidayDAO;

	@Autowired
	private PositionDAO positionDAO;

	@Autowired
	private DepartmentDAO departmentDAO;

	@Autowired
	private FunctionDAO functionDAO;

	private static Calendar cal = Calendar.getInstance(); // Use Calendar .Year
	private static String check_flag = "";

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String listReportPayroll() {
		try {
			List<Payment_group> payment_group = payment_groupDAO.listForReport();
			request.setAttribute("groupList", payment_group);
			log.debug(payment_group);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String groupMember() {
		try {
			String id = request.getParameter("payment_group_id");
			log.debug(id);
			Integer idValue = Integer.valueOf(id);

			List<Payment_group> payment_group = payment_groupDAO.listForReportById(idValue);
			log.debug(payment_group);
			request.setAttribute("payment_groupList", payment_group);

			List<Payment_type> payment_type = payment_typeDAO.listName();
			log.debug(payment_type);
			request.setAttribute("payment_typeList", payment_type);

			List<Payment_group> group = payment_groupDAO.listConvert(idValue);
			log.debug(group);
			request.setAttribute("groupList", group);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String listUser() {
		try {
			List<Payment_type> payment_type = payment_typeDAO.findType();
			request.setAttribute("paymentTypeList", payment_type);
				
			List<User> user = userDAO.userList();
			request.setAttribute("userList", user);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String checkIdDate() {
		try {
				String u = request.getParameter("user");
				String fdate = request.getParameter("Date-Start");
				String edate = request.getParameter("Date-End");
				
				List<Map<String, Object>>payment= payment_typeDAO.findAmount(u, fdate, edate);
				int size = 15;

				List<List<Map<String, Object>>> partitionedList = ListUtils.partition(payment, size);
				log.debug(partitionedList);
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String json = gson.toJson(partitionedList);
				request.setAttribute("json", json);

			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

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
			log.debug("datenow: " + datenow);

			Timestamp start_date = DateUtil.dateToTimestamp("01" + "-" + DateUtil.getMonth() + "-" + DateUtil.getYear(),
					"00:00");
			Timestamp end_date = DateUtil.dateToTimestamp("31" + "-" + DateUtil.getMonth() + "-" + DateUtil.getYear(),
					"00:00");
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
			/* userid from report_work.jsp */
			String userid = request.getParameter("id");
			log.debug(userid);
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
			String year = datenow.substring(6, 10);
			String month = datenow.substring(3, 5);
			/*
			 * String yearnow = datenow.substring(6, 10); Timestamp start_date1 = DateUtil
			 * .dateToTimestamp("01" + "-" + DateUtil.getMonth() + "-" + DateUtil.getYear(),
			 * "00:00"); Timestamp end_date1 = DateUtil.dateToTimestamp("31" + "-" +
			 * DateUtil.getMonth() + "-" + DateUtil.getYear(), "00:00");
			 */
			log.debug(month + "/" + year);
			List<Map<String, Object>> userleave = leaveDAO.findUserLeave(userid, month, year);
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
			// List<Map<String, Object>> leavesum = leaveDAO.leaveApprSum(userid,
			// start_date1, end_date1);
			// userwork.addAll(leavesum);
			/*----------------------------------------------------------------------------------------------------------*/

			List<Map<String, Object>> test1 = workHoursDAO.checkoutcalendar(userid, year);
			List<Map<String, Object>> test2 = workHoursDAO.checkincalendar(userid, year);
			JSONArray test1arr = new JSONArray(test1);
			JSONArray test2arr = new JSONArray(test2);
			List listcheck = new ArrayList<>();
			for (int i = 0; i < test1arr.length(); i++) {
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
			// check_flag = "0";
			request.setAttribute("check_flag", "0");

			List<Map<String, Object>> Users = userDAO.Query_Userlist();
			request.setAttribute("UsersList", Users);

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public void searchCalendar() {
		try {
			String userid = request.getParameter("userid");
			String year = request.getParameter("year");

			List<Map<String, Object>> test1 = workHoursDAO.checkoutcalendar(userid, year);
			List<Map<String, Object>> test2 = workHoursDAO.checkincalendar(userid, year);

			JSONArray test1arr = new JSONArray(test1);
			JSONArray test2arr = new JSONArray(test2);

			JSONArray arrayCheck1 = new JSONArray();
			JSONArray arrayCheck2 = new JSONArray();
			JSONArray arrayCheck3 = new JSONArray();
			for (int i = 0; i < test1.size(); i++) {
				arrayCheck1.put(test1arr.getJSONObject(i).getString("datecheck"));
				String checkouttime = test1arr.getJSONObject(i).getString("checkout");
				String checkout;
				String checkouttime_sub = checkouttime.substring(0, 5);
				checkout = checkouttime_sub;
				arrayCheck2.put(checkout);
			}
			for (int i = 0; i < test2.size(); i++) {
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
			String s = "00:00:00.0";

			String start = (year + "-01-01 " + s);
			String end = (year + "-12-31 " + s);
			Timestamp start_date = Timestamp.valueOf(start);
			Timestamp end_date = Timestamp.valueOf(end);
			log.debug("start_date: " + start_date);
			log.debug("end_date: " + end_date);

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
			for (int i = 0; i < leavelist.size(); i++) {
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

			String selectmonth = request.getParameter("month");
			String year = request.getParameter("year");
			int s_month = Integer.parseInt(selectmonth) + 1;
			String month = Integer.toString(s_month);

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

	public String leaveSearch() {
		try {

			String userid = request.getParameter("userid");
			log.debug(userid);
			request.setAttribute("userid", userid);
			String year = request.getParameter("year");
			Integer selectmonth = Integer.parseInt(request.getParameter("month"));
			selectmonth = selectmonth + 1;
			String month = String.valueOf(selectmonth);
			log.debug(userid + "/" + month + "/" + year);

			Timestamp datestart = DateUtil.dateToTimestamp("01" + "-" + month + "-" + year, "00:00");
			Timestamp dateend = DateUtil.dateToTimestamp("31" + "-" + month + "-" + year, "00:00");

			List<Map<String, Object>> userleave = leaveDAO.findUserLeave(userid, month, year);
			request.setAttribute("userleave", userleave);

			Gson gson = new Gson();
			String json = gson.toJson(userleave);
			request.setAttribute("json", json);

			List<LeaveType> type_leave1 = leavetypeDAO.findAll();
			request.setAttribute("leavetypelistChoice", type_leave1);
			request.setAttribute("type_1", type_leave1.get(0).getLeaveTypeName());
			request.setAttribute("type_2", type_leave1.get(1).getLeaveTypeName());
			request.setAttribute("type_3", type_leave1.get(2).getLeaveTypeName());
			request.setAttribute("type_4", type_leave1.get(3).getLeaveTypeName());
			request.setAttribute("type_5", type_leave1.get(4).getLeaveTypeName());
			request.setAttribute("type_6", type_leave1.get(6).getLeaveTypeName());
			request.setAttribute("type_9", type_leave1.get(5).getLeaveTypeName());

			List leavelist = leaveDAO.myLeavesList(userid, datestart, dateend);
			Double leave_1 = 0.000, leave_2 = 0.000, leave_3 = 0.000, leave_5 = 0.000, leave_6 = 0.000;
			String status = "1";
			List LeaveID = leaveDAO.findLeaveId(userid, datestart, dateend, status);
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

			List<Map<String, Object>> test1 = workHoursDAO.checkoutcalendar(userid, year);
			List<Map<String, Object>> test2 = workHoursDAO.checkincalendar(userid, year);
			JSONArray test1arr = new JSONArray(test1);
			JSONArray test2arr = new JSONArray(test2);
			List listcheck = new ArrayList<>();
			for (int i = 0; i < test1arr.length(); i++) {
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

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getLeaveData() {
		try {
			String userid = request.getParameter("userId");
			request.setAttribute("userid", userid);
			String year = request.getParameter("year");
			Integer selectmonth = Integer.parseInt(request.getParameter("month"));
			String month = String.valueOf(selectmonth);

			YearMonth yearMonth = YearMonth.of(Integer.parseInt(year), selectmonth);
			LocalDate firstDate = yearMonth.atDay(1);
			LocalDate lastDate = yearMonth.atEndOfMonth();

			List<Map<String, Object>> userleave = leaveDAO.findUserLeave(userid, month, year);
			List<Map<String, Object>> userWorkingSummary = functionDAO.findWorkingSummary(userid, firstDate.toString(),
					lastDate.toString());

			Gson gson = new Gson();
			String jsonLeave = gson.toJson(userleave);
			String jsonSum = gson.toJson(userWorkingSummary);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("leave_data", jsonLeave);
			jsonObject.put("working_data", jsonSum);

			request.setAttribute("json", jsonObject.toString());

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getWorkingReport() {
		try {
			String year = request.getParameter("year");
			Integer selectmonth = Integer.parseInt(request.getParameter("month"));
			String month = String.valueOf(selectmonth);
			int start = Integer.parseInt(request.getParameter("start"));
			int length = Integer.parseInt(request.getParameter("length"));
			int draw = Integer.parseInt(request.getParameter("draw"));
			String search = request.getParameter("search") == null ? "" : request.getParameter("search") ;
//			String search = request.getParameter("search[value]") ;
			String order = request.getParameter("order[i][dir]") ;
			String column = request.getParameter("columns[i][name]") ;

			YearMonth yearMonth = YearMonth.of(Integer.parseInt(year), selectmonth);
			LocalDate firstDate = yearMonth.atDay(1);
			LocalDate lastDate = yearMonth.atEndOfMonth();

			List<Map<String, Object>> Users = userDAO.AllUserEnableOffset(length ,start,search);
			long countRow = userDAO.CountAllUserEnableOffset(search);
			
			JSONObject response_data = new JSONObject();
			JSONArray arr = new JSONArray();
			for (Map<String, Object> user : Users) {
				String userId = user.get("id").toString();
				String userName = user.get("name").toString();
				List<Map<String, Object>> userWorkingSummary = functionDAO.findWorkingSummary(userId,firstDate.toString(), lastDate.toString());

				JSONObject obj_cell = new JSONObject();
				obj_cell.put("id", userId);
				obj_cell.put("name", userName);
				obj_cell.put("working_day", userWorkingSummary.get(0).get("actual_working_per_month"));
				obj_cell.put("emp_working_day", userWorkingSummary.get(0).get("sum_emp_working"));
				obj_cell.put("emp_working_hr", userWorkingSummary.get(0).get("sum_emp_working_hr"));
				obj_cell.put("emp_absent", userWorkingSummary.get(0).get("sum_emp_absent"));
				obj_cell.put("emp_leave", userWorkingSummary.get(0).get("sum_emp_leave"));
				obj_cell.put("actual_working", userWorkingSummary.get(0).get("actual_working_day"));
				obj_cell.put("term_day", userWorkingSummary.get(0).get("term_day"));
				obj_cell.put("payment", userWorkingSummary.get(0).get("payment"));

				arr.put(obj_cell);
			}

			response_data.put("draw", draw);
			response_data.put("recordsTotal", countRow);
			response_data.put("recordsFiltered", countRow);
			response_data.put("data", arr);
			request.setAttribute("json", response_data.toString());

			return SUCCESS;
		} catch (Exception e) {
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

	public String bonusReport() {
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

	public String findBonusByYear() {
		try {

			String userid = request.getParameter("user_id");
			String year = request.getParameter("year");

			// query code
			List<Map<String, Object>> BonusByYear = payment_groupDAO.findAndSumBonusByYear(userid, year);

			Gson gson = new Gson();
			String json = gson.toJson(BonusByYear);

			// log.debug(json);
			request.setAttribute("json", json);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String findBonusByMultipleYear() {
		try {

			String userid = request.getParameter("user_id");
			String year = request.getParameter("year");
			List<String> yearList = Arrays.asList(year.split("\\s*,\\s*"));

			// query code
			List<Map<String, Object>> BonusByMultipleYear = payment_groupDAO.findAndSumBonusByMultipleYear(userid,
					yearList);

			Gson gson = new Gson();
			String json = gson.toJson(BonusByMultipleYear);

			request.setAttribute("json", json);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String reportSalaryDepart() {
		try {

			List<Map<String, Object>> departmentId = departmentDAO.sequense();
			request.setAttribute("DepartmentId", departmentId);
			
			List<Map<String, Object>> findYearSalary = payment_groupDAO.findYear();
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
			// log.debug(mYear);
			log.debug(mDepart);

			// List<Map<String, Object>> findMonth =
			// payment_groupDAO.monthSalary(mYear,mDepart);
			// request.setAttribute("FindMonth", findMonth);

			List<Map<String, Object>> multiSelect = payment_groupDAO.multiSalaryMonth(mYear, mDepart);
			request.setAttribute("MultiSelect", multiSelect);

			// log.debug(findMonth);
			// log.debug(multiSelect);

			Gson gson = new Gson();
			String json = gson.toJson(multiSelect);
			request.setAttribute("json", json);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String paymentStatistics() {
		try {
			
			
			/*String year = request.getParameter("year");
			log.debug(year);
			List<String> yearList = Arrays.asList(year.split("\\s*,\\s*"));
			log.debug("yearList: " + yearList);
			log.debug(yearList.get(yearList.size() - 1));
			String yyy = yearList.get(yearList.size() - 1);
			//log.debug(yearList[]);
			//query code
			JSONArray paymentChart = payment_groupDAO.paymentStatistics(yyy);
			log.debug(paymentChart);
			/*log.debug(paymentChart.size());
			for(int i = 0; i < paymentChart.size(); i++) {
					
			}
		(paymentChart.get(0)).values();
			//List<String> flag = (List<String>) paymentChart.getClass();
			JSONArray jsonarr = new JSONArray();
			JSONObject arr = new JSONObject(); 
			arr.put("name", yyy);
			arr.put("data",paymentChart);
			jsonarr.put(arr);
			log.debug(jsonarr);
			
					
            Gson gson = new Gson(); 
            String json = gson.toJson(arr);
            log.debug(json);
            

            request.setAttribute("json", jsonarr.toString());	 */
			String year = request.getParameter("year");
			List<String> yearList = Arrays.asList(year.split("\\s*,\\s*"));
			
			JSONArray arr_list = new JSONArray();
			for(int i = 0; i < yearList.size(); i++) {
				JSONArray res = payment_groupDAO.paymentStatistics(yearList.get(i));
				log.debug(res);
				JSONArray arr = new JSONArray();

				JSONObject obj_cell = new JSONObject();
                obj_cell.put("data", res);
            	if(res.length() == 0 ) {
            		//int e = 1;
            		 
            		 obj_cell.put("showInLegend", false);
            		obj_cell.put("visible", false);
            		// log.debug(e);
            	}else {
            		obj_cell.put("name", yearList.get(i));
            	}
                   arr_list.put(obj_cell);
			}	
			log.debug(arr_list);
            request.setAttribute("json", arr_list.toString());
            return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String findYearSalaryDepart() {		
		try {
			String mYear = request.getParameter("multiple_findYear");
			String mDepart = request.getParameter("multiple_department");
			//log.debug(mYear);
			//log.debug(mDepart);
			
			//List<Map<String, Object>> findMonth = payment_groupDAO.monthSalary(mYear,mDepart);
			//request.setAttribute("FindMonth", findMonth);
			
			List<Map<String, Object>> multiSelect = payment_groupDAO.multiSalaryYear(mYear,mDepart);
			request.setAttribute("MultiSelect", multiSelect);
			
			//log.debug(findMonth);
			//log.debug(multiSelect);
			
			Gson gson = new Gson(); 
            String json = gson.toJson(multiSelect); 
            request.setAttribute("json", json);	
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String employeeReport() {
		try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	public List<List<Integer>> FormatGraph(List<List<Integer>> count_userList
			,List<String> dp_name
			,List<Map<String, Object>> countUser
			,int expression) 
	{
		try {
			for (int j = 0 ; j < countUser.size(); j++) {
				String departString = (String) countUser.get(j).get("department_id");
					for (int mon = 1 ; mon < 13 ; mon++) {//for loop month
						if ((Integer)countUser.get(j).get("month") == mon) {
						Integer valInteger = Integer.parseInt((String)countUser.get(j).get("employee_count").toString());
						Integer month_arrInteger = mon-1;
							for (int month_iterator = month_arrInteger; month_iterator < 12 ; month_iterator++) {
								if (!(dp_name.indexOf(departString) < 0 || dp_name.indexOf(departString) >= count_userList.size())) {
									Integer current_valueInteger = count_userList.get(dp_name.indexOf(departString)).get(month_iterator);
									if (expression == 0) {
										count_userList.get(dp_name.indexOf(departString)).set(month_iterator,current_valueInteger + valInteger);
									}else {
										count_userList.get(dp_name.indexOf(departString)).set(month_iterator,current_valueInteger - valInteger);
									}
								}
							}						
						}
					}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			count_userList = null;
		}
		return count_userList;
	}
	
	
	public String getGraphData() {//findAll
		try {
			String Year = request.getParameter("year");
			String allDepartmentId = request.getParameter("allDepartmentId");	
			List<String> dp_name = Arrays.asList(allDepartmentId.split("\\s*,\\s*"));
			List<List<Integer>> count_userList = new ArrayList<List<Integer>>();
			
			//log.debug(Year);
			//log.debug(Year.getClass());

			List<Map<String, Object>> countUserByYearList = userDAO.countUserOutOfYearByYear(Year);
			List<Map<String, Object>> countUserStartInYearByYear = userDAO.countUserStartInYearByYear(Year);
			List<Map<String, Object>> countUserEndInYearByYear = userDAO.countUserEndInYearByYear(Year);

			for (String name : dp_name) {
				//get index of
				Integer ind = null;
				for (int i = 0 ; i < countUserByYearList.size(); i++) {
					if(countUserByYearList.get(i).get("department_id").equals(name)) {
						ind = i;
						break;
					}
				}
				if(ind != null) {
					List<Integer> buffer_listIntegers = new ArrayList<Integer>();
					for (int mon = 1 ; mon < 13 ; mon++) {//for loop month
						buffer_listIntegers.add( Integer.parseInt((String)countUserByYearList.get(ind).get("employee_count").toString()) );
						//log.debug(countUserByYearList.get(ind).get("employee_count"));
					}
					count_userList.add(buffer_listIntegers);
					
				}else {
					count_userList.add(new ArrayList<>(Arrays.asList(0,0,0,0,0,0,0,0,0,0,0,0)));
				}
			}
			
			//log.debug(count_userList);
			count_userList = FormatGraph(count_userList, dp_name, countUserStartInYearByYear,0);
			count_userList = FormatGraph(count_userList, dp_name, countUserEndInYearByYear,1);
					
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			//log.debug(count_userList);
			for (String name : dp_name) {
				jsonMap.put(name, count_userList.get(dp_name.indexOf(name)));
			}
				
			Gson gson = new Gson(); 
            String json = gson.toJson(jsonMap); 
            request.setAttribute("json", json);	
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}	
	}
	
	public Map<String,Object> FormatList_ReportYear(List<List<Integer>> lst,List<String> dp_name,Integer year){
		LocalDate today = LocalDate.now();
		int currentYear = today.getYear();
		int currentMonth = today.getMonthValue();
		
		Map<String,Object> FormatList_ReportYear = new HashMap<String,Object>();
		
		try {
			for (int i = 0 ; i < lst.size() ; i++) {				
				//FormatList_ReportYear.add(  new ArrayList<>(Arrays.asList(lst.get(i).get( (currentYear==year?(currentMonth-1):11) ))) );
				FormatList_ReportYear.put(dp_name.get(i),  new ArrayList<>(Arrays.asList(lst.get(i).get( (currentYear==year?(currentMonth-1):11) ))) );
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			FormatList_ReportYear = null;
		}
			return FormatList_ReportYear;
	}
	
	public String get_report_year_data() {
		try {
			String yearList = request.getParameter("year_list");
			String allDepartmentId = request.getParameter("allDepartmentId");
			List<String> year_list = Arrays.asList(yearList.split("\\s*,\\s*"));
			List<String> dp_name = Arrays.asList(allDepartmentId.split("\\s*,\\s*"));
			
			Map<String, Object> reportMultipleYear = new HashMap<String, Object>();
			
			/*******************************/
			for (int ind_year = 0 ; ind_year < year_list.size() ;ind_year++) {
			
				List<List<Integer>> count_userList = new ArrayList<List<Integer>>();
				List<Map<String, Object>> countUserByYearList = userDAO.countUserOutOfYearByYear(year_list.get(ind_year));
				List<Map<String, Object>> countUserStartInYearByYear = userDAO.countUserStartInYearByYear(year_list.get(ind_year));
				List<Map<String, Object>> countUserEndInYearByYear = userDAO.countUserEndInYearByYear(year_list.get(ind_year));
	
				
				for (String name : dp_name) {
					//get index of
					Integer ind = null;
					for (int i = 0 ; i < countUserByYearList.size(); i++) {
						if(countUserByYearList.get(i).get("department_id").equals(name)) {
							ind = i;
							break;
						}
					}
					if(ind != null) {
						List<Integer> buffer_listIntegers = new ArrayList<Integer>();
						for (int mon = 1 ; mon < 13 ; mon++) {//for loop month
							buffer_listIntegers.add( Integer.parseInt((String)countUserByYearList.get(ind).get("employee_count").toString()) );
						}
						count_userList.add(buffer_listIntegers);
						
					}else {
						count_userList.add(new ArrayList<>(Arrays.asList(0,0,0,0,0,0,0,0,0,0,0,0)));
					}
				}
				
				count_userList = FormatGraph(count_userList, dp_name, countUserStartInYearByYear,0);
				count_userList = FormatGraph(count_userList, dp_name, countUserEndInYearByYear,1);
				
				Map<String,Object> ReportYear = FormatList_ReportYear(count_userList,dp_name,Integer.parseInt(year_list.get(ind_year)));
								
				reportMultipleYear.put(year_list.get(ind_year),ReportYear);
				
			}
			/*******************************/
			log.debug(reportMultipleYear);
						
			Gson gson = new Gson(); 
            String json = gson.toJson(reportMultipleYear); 
            request.setAttribute("json", json);	
            
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String getAllDeparmentId() {
		try {
			List<Map<String, Object>> findAllDeparmentIdList  = departmentDAO.findAllList();
			
			Gson gson = new Gson(); 
            String json = gson.toJson(findAllDeparmentIdList); 
            request.setAttribute("json", json);		
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	public String reportDepartment() {
		try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	public String getDepartment() {
		try {
			List<Map<String, Object>> findAllDeparmentIdList  = departmentDAO.findAllList();
			
			Gson gson = new Gson(); 
            String json = gson.toJson(findAllDeparmentIdList); 
            request.setAttribute("json", json);		
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	public String getDataMonthDepartmentStatistics() {
		try {
			String mYear = request.getParameter("year_pick");
			String mDepart = request.getParameter("depart");
			//List<String> department = Arrays.asList(mDepart.split("\\s*,\\s*"));
			//log.debug(department);
			//log.debug(mYear);
			
			List<Map<String, Object>> getMonthStatistics = payment_groupDAO.getMonthStatic(mYear,mDepart);
			request.setAttribute("GetMonthStatistics", getMonthStatistics);
			
			//log.debug(findMonth);
			//log.debug(getMonthStatistics);
			
			Gson gson = new Gson(); 
            String json = gson.toJson(getMonthStatistics); 
            request.setAttribute("json", json);	
			
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	public String paymentchart() {
		try {
			String year = request.getParameter("year");
			log.debug(year);
			JSONArray arr_superlist = new JSONArray();
			JSONArray arr_list = new JSONArray();
			JSONArray arr_list1 = new JSONArray();
			JSONObject obj_data = new JSONObject();
			JSONObject obj_data1 = new JSONObject();
			
			List<BigDecimal> income = payment_groupDAO.paymentchartIn(year);
			List<BigDecimal> expend = payment_groupDAO.paymentchartEx(year);
			JSONArray drilldowns = payment_groupDAO.paymentDrilldowns(year);
			log.debug(drilldowns);
			//log.debug(income);
			//log.debug(expend);
			String[] month = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
			
			for(int i=0; i<income.size(); i++) {
				JSONObject obj_cell = new JSONObject();
				obj_cell.put("name", month[i]);
				obj_cell.put("y", income.get(i));
				obj_cell.put("drilldown", month[i]);
				obj_cell.put("color", "#28A745");
				arr_list.put(obj_cell);
			}
			obj_data.put("data",arr_list);
			obj_data.put("name", "รายการได้");
			arr_superlist.put(obj_data);

			
			for(int i=0; i < expend.size(); i++) {
				JSONObject obj_cell1 = new JSONObject();
				obj_cell1.put("name", month[i]);
				obj_cell1.put("y", expend.get(i));
				obj_cell1.put("drilldown", month[i]);
				obj_cell1.put("color", "#E7505A");
				arr_list1.put(obj_cell1);
			}
			obj_data1.put("data",arr_list1);
			obj_data1.put("name", "รายการหัก");
			arr_superlist.put(obj_data1);

			
			request.setAttribute("json", arr_superlist.toString());
			log.debug(arr_superlist.toString());
			
			return SUCCESS;
		}catch(Exception e) {
			return ERROR;
		}
	}
	
	public String report_year() {
		try {
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	
	
}
