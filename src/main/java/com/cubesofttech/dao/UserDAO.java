package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.User;

public interface UserDAO {

	public void save(User user) throws Exception;

	public List<User> findAll() throws Exception;
	
	public List<User> findAllPayroll() throws Exception;
	
	public List<Map<String, Object>> findAllleaves() throws Exception;
	
	public List countYear() throws Exception;
	
	public User findById(String id) throws Exception;

	/*
	 * public static User findByRoleId(String roleId) throws Exception { // TODO
	 * Auto-generated method stub return null; }
	 */
	public String resetLastyearQuota();

	public List<Map<String, Object>> findByemail(String id) throws Exception;

	public List<Map<String, Object>> findById2(String id) throws Exception;

	public void update(User user) throws Exception;

	public void delete(User user) throws Exception;

	public List<User> findBySelect(String usertoappr) throws Exception;
	
	public List<Map<String, Object>> findAllforReport() throws Exception;

	public List<Map<String, Object>> allName() throws Exception;

	public List<Map<String, Object>> findByApprove(String usertoappr) throws Exception;

	public List<Map<String, Object>> sequense() throws Exception;

	public List<Map<String, Object>> Query_Userlist() throws Exception;

	public List<Map<String, Object>> findChangeLeader(String approverchange) throws Exception;

	public List<Map<String, Object>> findById3(String ur) throws Exception;

	public List<Map<String, Object>> positionuser(String logonUser) throws Exception;
	


	public int[] count_user(); // PieCharts

	public User findByFbId(String id) throws Exception;

	public User findbyLineId(String lineId) throws Exception;

	public void linkLine(String userId, String lineId);

	public void linkFacebook(String userId, String facebookid);

	public String userListJSON();

	public List<Map<String, Object>> UserCountEnable();

	public List<Map<String, Object>> UserEnable(String enable);
	
	public List<Map<String, Object>> UserEnable();

	public List<Map<String, Object>> UserDisable();

	public User findByPhoneNum(String phone_num) throws Exception;

	public List<Map<String, Object>> findByWhereInId(String online_user);

	List<Map<String, Object>> findRoleNameById(String id);

	public List<Map<String, Object>> test_birthdaysummary() throws Exception;

	public List<Map<String, Object>> Query_Userlist2() throws Exception;

	public List<Map<String, Object>> getGender(String[] setgender) throws Exception;

	public List<Map<String, Object>> updateGender(String[] setgender) throws Exception;

	public List<Map<String, Object>> findRoleById(String id);

	List<Map<String, Object>> apprNameById(String id);

	public List<Map<String, Object>> findTimeUserWork(String user) throws Exception;
	public List<Map<String, Object>> findAllUser(String month,String year) throws Exception;
	public List<Map<String, Object>> findAllUserYear(String year) throws Exception;
	
	public List<Map<String,Object>> AllUserEnable()throws Exception;
	public List<Map<String,Object>> AllUserEnable(String OwnerId) throws Exception;
	public List<Map<String,Object>> findUserEnablebyNameOrId(String name)throws Exception;
	public List<Map<String,Object>> findUserEnablebyDepartment(String Department)throws Exception;
	public List<Map<String,Object>> findUserEnablebyIdAndDepartment(String Department , String nameorid)throws Exception;
	
	public List<Map<String,Object>> findUserChat(String name)throws Exception;

	public List<Map<String,Object>> HappyBirthday(String month, String day)throws Exception;
	
	public List<Map<String, Object>> userWork(String month, String year) throws Exception; 
	
	public List<Map<String, Object>> findUserWork(String id) throws Exception; 

	public List<User> userList() throws Exception;
	
	public long rowCountByEmpIdDateInterval(String EmpId,String month,String year)  throws Exception;
	
	public long rowCountByEmpIdFilterYear(String EmpId,String year) throws Exception;
	
	public long dashboardDepartmentMonth(String DepartId,String month,String year) throws Exception;
	
	public long dashboardDepartmentYear(String DepartId,String year) throws Exception;
	
	public long dashboarPositionMonth(String PositionId,String month,String year) throws Exception;
	
	public long dashboardPositionYear(String PositionId,String year) throws Exception;
	
	public List<Map<String,Object>> countUserOutOfYearByYear(String year) throws Exception;
	
	public List<Map<String,Object>> countUserStartInYearByYear(String year) throws Exception;
	
	public List<Map<String,Object>> countUserEndInYearByYear(String year) throws Exception;
	
}
