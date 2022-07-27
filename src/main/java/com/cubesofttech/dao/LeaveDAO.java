package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Leaves;
import com.google.gson.JsonElement;

public interface LeaveDAO {
	public List findLeaveId(String userId, Timestamp startDate, Timestamp endDate,String status)throws Exception;
	
	public void save(Leaves leaves) throws Exception;
	
	public void saveOrUpdate(Leaves leaves) throws Exception;

	public List<Leaves> findAll() throws Exception;
	
    public List<Map<String,Object>> findAllList() throws Exception;
    
	public Leaves findByLeaveId(int leaveId) throws Exception;

	public void update(Leaves leaves) throws Exception;

	public void delete(Leaves leaves) throws Exception;

	public List<Leaves> search(String leaveId) throws Exception;

	public List<Map<String, Object>> findLeave() throws Exception;

	public List<Map<String, Object>> listoneperson(String leaveid) throws Exception;

	public List<Map<String, Object>> selectId(String userId) throws Exception;

	Integer getMaxId() throws Exception;

	public List<Map<String, Object>> listwaitperson(String leaveid) throws Exception;

	public List<Map<String, Object>> searchtable(Timestamp startDate, Timestamp endDate, String userId) throws Exception;
	
	public List<Map<String, Object>> searchtable(Timestamp startDate, Timestamp endDate, String userId,String type) throws Exception;
	
	//use for search unapprove leave by type
	public List<Map<String, Object>> searchtable4(Timestamp startDate, Timestamp endDate, String userId,String type) throws Exception; 
	
	public List<Map<String, Object>> searchapprovedall(Timestamp startDate, Timestamp endDate, String userId) throws Exception;

	public List<Map<String, Object>> searchAll() throws Exception;

	public List<Map<String, Object>> searchmyleave(Timestamp start_date, Timestamp end_date, String user) throws Exception;

	public List<Map<String, Object>> approverform(String leaveId) throws Exception;

	public List<Map<String, Object>> findMyApprover(String manager) throws Exception;

	public List<Map<String, Object>> searchtable2(Timestamp start_date, Timestamp end_date, String userSelect) throws Exception;
	
	public List<Map<String, Object>> searchtable2(Timestamp start_date, Timestamp end_date, String userSelect,String type) throws Exception;
	
	public List<Map<String, Object>> searchtable3(Timestamp start_date, Timestamp end_date, String userSelect,String type) throws Exception;
	
	public List<Map<String, Object>> searchapproved(Timestamp start_date, Timestamp end_date, String userSelect) throws Exception;
	
	public List<Map<String, Object>> startyear(Timestamp startDate, Timestamp endDate) throws Exception;

	public List<Map<String, Object>> findleaveall(String userLogin) throws Exception;

	public List<Map<String, Object>> join3table(String role) throws Exception;

	public List<Map<String, Object>> findleaveallByType(String userLogin, int type) throws Exception;

	public List<Map<String, Object>> searchtable3(String userId) throws Exception;

	List<Map<String, Object>> searchAll_user(String user) throws Exception;
	
	public List<Map<String, Object>> top10(int year,String enable) throws Exception;
	
	public List<Map<String, Object>> LeaveAll(int month,int year,String enable,int sort2) throws Exception;
	
	public List<Map<String, Object>> searchCountbyUser(String user,int year) throws Exception;
	
	public List<Map<String, Object>> LeaveTypename(String user,int year,int month) throws Exception;
	
	public List<Map<String, Object>> searchCountbyMonths(int month,int year,String enable) throws Exception;
	
	public List<Map<String, Object>> findUserByyear(String year) throws Exception;
	
	public List<Map<String, Object>> ReportsByyear(int year, int type, String user) throws Exception;
	
	public List<Map<String, Object>> ReportsByyear2(int year, String user) throws Exception;
	
	public List<Map<String, Object>> ReportsType(String year, String user,String month) throws Exception;
	
	public List<Map<String, Object>> findleaveByuser(String userLogin) throws Exception;
	
	public List<Map<String, Object>> findleaveAll() throws Exception;

	List<Map<String, Object>> findPatiwanla(String userLogin, int type, Timestamp startDate, Timestamp endDate);

	List<Map<String, Object>> findHoliday() throws Exception;

	List<Map<String, Object>> findHoliday3() throws Exception;

	public List<Map<String, Object>> myLeavesList(String userId, Timestamp startDate, Timestamp endDate);

	public Double LastYearQuota(String userId, int currentYear) throws Exception;

	public Double ThisYearQuota(String userId) throws Exception;

	List<Map<String, Object>> myLeavesList(String userId, Timestamp startDate, Timestamp endDate, String status);

	public String sumWaitLeave(String user) throws Exception;
	public List<Map<String, Object>> test_LeavesList(String userId, int year);
	
	public List<Map<String, Object>> test_LeavesSummary(int year,int type);
	
	public List<Map<String, Object>> leaveselectM(int year) throws Exception ;
	
	public List<Map<String, Object>> searchApproved(Timestamp start_date, Timestamp end_date, String jsonId, String jsonStatus,
			String jsonType) throws Exception;
	
	public List<Map<String, Object>> searchDashboard(String jsonId, String date) throws Exception;
	
	public List<Map<String, Object>> searchDashboardQuota(String jsonId, String date) throws Exception;
	
	public List<Map<String, Object>> leaveUpdateStatus(String userId, String leave) throws Exception;
	
	public List<Map<String, Object>> findUserLeave(String user ,Timestamp start_date1,Timestamp end_date1) throws Exception;
	 	
	public List<Map<String, Object>> findUserLeave(String user, String month, String year) throws Exception;
	
	public List<Map<String, Object>> leaveApprSum(String userId, Timestamp start_date1, Timestamp end_date1) throws Exception;
	
	public List<Map<String, Object>> leaveApprSumAll(String month, String year) throws Exception;
	
	public List<Map<String, Object>> reportleavemonth(String months, String years) throws Exception;
	public List<Map<String, Object>> searchreportleavemonth1(String monthsee, String yearsee) throws Exception;
	public List<Map<String, Object>> reportleaveyeartype1(String years) throws Exception;
	public List<Map<String, Object>> reportleaveyeartype2(String years) throws Exception;
	public List<Map<String, Object>> reportleaveyeartype3(String years) throws Exception;
	public List<Map<String, Object>> reportleaveyeartype5(String years) throws Exception;
	public List<Map<String, Object>> reportleaveyeartype6(String years) throws Exception;
	public List<Map<String, Object>> reportallleave(String years) throws Exception;
	
	public List<Map<String, Object>> leavejson() throws Exception;

}