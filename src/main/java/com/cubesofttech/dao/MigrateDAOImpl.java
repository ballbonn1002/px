package com.cubesofttech.dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Department;
import com.cubesofttech.model.LeaveType;
import com.cubesofttech.model.Leaves;
import com.cubesofttech.model.Migrate;
import com.cubesofttech.model.Migrate_detail;
import com.cubesofttech.model.Permission;
import com.cubesofttech.model.Position;
import com.cubesofttech.model.User;
import com.cubesofttech.model.WorkHours;

@Repository
public class MigrateDAOImpl implements MigrateDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private DepartmentDAO departmentDAO;
	
	@Autowired
	private LeaveTypeDAO leaveTypeDAO;
	
	@Autowired
	private PositionDAO positionDAO;
	
	@Autowired
	private LeaveDAO leaveDAO;
	
	@Autowired
	private WorkHoursDAO workHoursDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HolidayDAO holidayDAO;
	
    @Override
    public int save(Migrate migrate) throws Exception{
        Session session = this.sessionFactory.openSession();
        session.save(migrate);
        session.flush();
        int id = migrate.getMigrate_id();
        return id;
        //session.close();
    }
    
    @Override
    public void saveDetail(List<Migrate_detail> migrateDetailList,int id) throws Exception{
        Session session = this.sessionFactory.openSession();
        for(Migrate_detail detail: migrateDetailList) {
        	detail.setMigrate_id(id);
            session.save(detail);
        }
        session.flush();
        //session.close();
    }
    
    @Override
    public List<Migrate> getMigrateList(Boolean showMore) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Migrate> migrateList = null;
		try {
			
			String sql = "select * from migrate order by migrate_id  desc";
			if(showMore == false) {
				sql += " limit 10";
			}
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE); 
			migrateList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return migrateList;
	}

	@Override
	public String migrateData(String action, String userId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String migrateResult = "";

		try {
			//========== Connect To HRM DB ============//
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hrm", "root", "");
			
			//========== GET lasted migrate time ============//
			List<Migrate> migrateList = getMigrateList(false);
			String lastedMigrate = "";
			if(!migrateList.isEmpty()) {
				Map<String, Object>  migrate =	(Map<String, Object>) migrateList.get(0);
				 lastedMigrate = migrate.get("time_create").toString();
			}
			
			//========== Prepare Data for insert migrate table ============//
			JSONArray jsonError = new JSONArray();
			List<Migrate_detail> migrateDetailList = new ArrayList<Migrate_detail>();
			int selectNumAll = 0;
			int insertNumAll = 0;
			int errorNumAll = 0;
			
			//========== Table Department ============//
			String table = "department";
			JSONObject department_error = new JSONObject();
			department_error.put("table", table);
			JSONArray department_id_err = new JSONArray();
			int selectNumDept = 0;
			int insertNumDept = 0;
			int errorNumDept = 0;
			
			String sql = "select * from department where time_update >= '"+lastedMigrate+"'";					
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql) ;
			while (rs.next()) {
				selectNumDept++;
				try {			
					//Set value to model object
					Department department = new Department();
					department.setDepartment_id(rs.getString("id"));
					department.setName(rs.getString("name"));
					department.setDescription(rs.getString("description"));
					department.setPrefixId(rs.getString("prefix_id"));
					department.setTimeCreate(rs.getTimestamp("time_create"));
					department.setTimeUpdate(rs.getTimestamp("time_update"));
					department.setUsercreate(rs.getString("user_create"));
					department.setUserupdate(rs.getString("user_update"));
					
					//execute insert or update to payroll
					departmentDAO.saveOrUpdate(department);
					insertNumDept++;
				}catch (Exception e) {
					department_id_err.put(rs.getString("id"));
					errorNumDept++;
				}
			}
			department_error.put("id", department_id_err);
			department_error.put("error", errorNumDept);
			jsonError.put(department_error);
			
			//Set record to migrate_detail
			Migrate_detail detailDept = new Migrate_detail();
			detailDept.setStatus(errorNumDept == 0 ? "1" : "0");
			detailDept.setSelect_from(table);
			detailDept.setInsert_to(table);
			detailDept.setSelect_num(Integer.toString(selectNumDept));
			detailDept.setInsert_num(Integer.toString(insertNumDept));
			detailDept.setError_num(Integer.toString(errorNumDept));
			detailDept.setUser_create(userId);
			detailDept.setUser_update(userId);
			detailDept.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			detailDept.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			migrateDetailList.add(detailDept);
			//=========================================//
			
			//========== Table Leave_Type ============//
			table = "leave_type";
			JSONObject leaveType_error = new JSONObject();
			leaveType_error.put("table", table);
			JSONArray leaveType_id_err = new JSONArray();
			int selectNumLeaveType = 0;
			int insertNumLeaveType = 0;
			int errorNumLeaveType = 0;
			
			String sqlLeaveType = "select * from leave_type where time_update >= '"+lastedMigrate+"'";					
			Statement stmtLeaveType = con.createStatement();
			ResultSet rsLeaveType = stmtLeaveType.executeQuery(sqlLeaveType);
			while (rsLeaveType.next()) {
				selectNumLeaveType++;
				try {			
					//Set value to model object
					LeaveType leaveType = new LeaveType();
					leaveType.setLeaveTypeId(rsLeaveType.getString("leave_type_id"));
					leaveType.setLeaveTypeName(rsLeaveType.getString("leave_type_name"));
					leaveType.setDescription(rsLeaveType.getString("description"));
					leaveType.setTimeCreate(rsLeaveType.getTimestamp("time_create"));
					leaveType.setTimeUpdate(rsLeaveType.getTimestamp("time_update"));
					leaveType.setUserCreate(rsLeaveType.getString("user_create"));
					leaveType.setUserUpdate(rsLeaveType.getString("user_update"));
					
					//execute insert or update to payroll
					leaveTypeDAO.saveOrUpdate(leaveType);
					insertNumLeaveType++;
				}catch (Exception e) {
					leaveType_id_err.put(rsLeaveType.getString("leave_type_id"));
					errorNumLeaveType++;
				}
			}
			leaveType_error.put("id", leaveType_id_err);
			leaveType_error.put("error", errorNumLeaveType);
			jsonError.put(leaveType_error);
			
			//Set record to migrate_detail
			Migrate_detail detailLeaveType = new Migrate_detail();
			detailLeaveType.setStatus(errorNumLeaveType == 0 ? "1" : "0");
			detailLeaveType.setSelect_from(table);
			detailLeaveType.setInsert_to(table);
			detailLeaveType.setSelect_num(Integer.toString(selectNumLeaveType));
			detailLeaveType.setInsert_num(Integer.toString(insertNumLeaveType));
			detailLeaveType.setError_num(Integer.toString(errorNumLeaveType));
			detailLeaveType.setUser_create(userId);
			detailLeaveType.setUser_update(userId);
			detailLeaveType.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			detailLeaveType.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			migrateDetailList.add(detailLeaveType);
			//==========================================//
			
			//========== Table Position ============//
			table = "position";
			JSONObject position_error = new JSONObject();
			position_error.put("table", table);
			JSONArray position_id_err = new JSONArray();
			int selectNumPosition = 0;
			int insertNumPosition = 0;
			int errorNumPosition = 0;
			
			String sqlPosition = "select * from position where time_update >= '"+lastedMigrate+"'";					
			Statement stmtPosition = con.createStatement();
			ResultSet rsPosition = stmtPosition.executeQuery(sqlPosition);
			while (rsPosition.next()) {
				selectNumPosition++;
				try {			
					//Set value to model object
					Position position = new Position();
					position.setPositionId(rsPosition.getString("position_id"));
					position.setDepartmentId(rsPosition.getString("department_id"));
					position.setName(rsPosition.getString("name"));
					position.setDescription(rsPosition.getString("description"));
					position.setPrefixId("");
					position.setUserCreate(rsPosition.getString("user_create"));
					position.setUserUpdate(rsPosition.getString("user_update"));
					position.setTimeCreate(rsPosition.getTimestamp("time_create"));
					position.setTimeUpdate(rsPosition.getTimestamp("time_update"));
					
					//execute insert or update to payroll
					positionDAO.saveOrUpdate(position);
					insertNumPosition++;
				}catch (Exception e) {
					position_id_err.put(rsPosition.getString("position_id"));
					errorNumPosition++;
				}
			}
			position_error.put("id", position_id_err);
			position_error.put("error", errorNumPosition);
			jsonError.put(position_error);
			
			//Set record to migrate_detail
			Migrate_detail detailPosition = new Migrate_detail();
			detailPosition.setStatus(errorNumPosition == 0 ? "1" : "0");
			detailPosition.setSelect_from(table);
			detailPosition.setInsert_to(table);
			detailPosition.setSelect_num(Integer.toString(selectNumPosition));
			detailPosition.setInsert_num(Integer.toString(insertNumPosition));
			detailPosition.setError_num(Integer.toString(errorNumPosition));
			detailPosition.setUser_create(userId);
			detailPosition.setUser_update(userId);
			detailPosition.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			detailPosition.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			migrateDetailList.add(detailPosition);
			//==========================================//
			
			//========== Table Leave ============//
			table = "leaves";
			JSONObject leave_error = new JSONObject();
			leave_error.put("table", table);
			JSONArray leave_id_err = new JSONArray();
			int selectNumLeave = 0;
			int insertNumLeave = 0;
			int errorNumLeave = 0;
			
			String sqlLeave = "select * from leaves where time_update >= '"+lastedMigrate+"'";					
			Statement stmtLeave = con.createStatement();
			ResultSet rsLeave = stmtLeave.executeQuery(sqlLeave);
			while (rsLeave.next()) {
				selectNumLeave++;
				try {			
					//Set value to model object
					Leaves leave = new Leaves();
					leave.setLeaveId(rsLeave.getInt("leave_id"));
					leave.setLeaveTypeId(rsLeave.getString("leave_type_id"));
					leave.setLeaveStatusId(rsLeave.getString("leave_status_id"));
					leave.setHalfDay(rsLeave.getString("half_day"));
					leave.setUserId(rsLeave.getString("user_id"));
					leave.setApprUserId(rsLeave.getString("appr_user_id"));					
					leave.setDescription(rsLeave.getString("description"));				
					leave.setReason(rsLeave.getString("reason"));
					leave.setStartTime(rsLeave.getString("start_time"));
					leave.setEndTime(rsLeave.getString("end_time"));;
					leave.setStartDate(rsLeave.getTimestamp("start_date"));
					leave.setEndDate(rsLeave.getTimestamp("end_date"));
					leave.setNoDay(rsLeave.getBigDecimal("no_day"));
					leave.setLeaveFile(rsLeave.getString("leave_file"));														
					leave.setUserCreate(rsLeave.getString("user_create"));
					leave.setUserUpdate(rsLeave.getString("user_update"));
					leave.setTimeCreate(rsLeave.getTimestamp("time_create"));
					leave.setTimeUpdate(rsLeave.getTimestamp("time_update"));
					
					//execute insert or update to payroll
					leaveDAO.saveOrUpdate(leave);
					insertNumLeave++;
				}catch (Exception e) {
					leave_id_err.put(rsLeave.getString("leave_id"));
					errorNumLeave++;
				}
			}
			leave_error.put("id", leave_id_err);
			leave_error.put("error", errorNumLeave);
			jsonError.put(leave_error);
			
			//Set record to migrate_detail
			Migrate_detail detailLeave = new Migrate_detail();
			detailLeave.setStatus(errorNumLeave == 0 ? "1" : "0");
			detailLeave.setSelect_from(table);
			detailLeave.setInsert_to(table);
			detailLeave.setSelect_num(Integer.toString(selectNumLeave));
			detailLeave.setInsert_num(Integer.toString(insertNumLeave));
			detailLeave.setError_num(Integer.toString(errorNumLeave));
			detailLeave.setUser_create(userId);
			detailLeave.setUser_update(userId);
			detailLeave.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			detailLeave.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			migrateDetailList.add(detailLeave);
			//==========================================//
			
			//========== Table Work Hours ============//
			table = "work_hours";
			JSONObject workHours_error = new JSONObject();
			workHours_error.put("table", table);
			JSONArray workHours_id_err = new JSONArray();
			int selectNumWorkHours = 0;
			int insertNumWorkHours = 0;
			int errorNumWorkHours = 0;
			
			String sqlWorkHours = "select * from work_hours where time_update >= '"+lastedMigrate+"'";					
			Statement stmtWorkHours = con.createStatement();
			ResultSet rsWorkHours = stmtWorkHours.executeQuery(sqlWorkHours);
			while (rsWorkHours.next()) {
				selectNumWorkHours++;
				try {			
					//Set value to model object
					WorkHours workHours = new WorkHours();
					workHours.setWorkHoursId(rsWorkHours.getInt("work_hours_id"));
					workHours.setWorkHoursType(rsWorkHours.getString("work_hours_type"));
					workHours.setWorkHoursTimeWork(rsWorkHours.getTimestamp("work_hours_time_work"));
					workHours.setLatitude(rsWorkHours.getString("latitude"));
					workHours.setLongitude(rsWorkHours.getString("longitude"));
					workHours.setDescription(rsWorkHours.getString("description"));		
					workHours.setUserAgent(rsWorkHours.getString("user_agent"));
					workHours.setIpAddress(rsWorkHours.getString("ip_address"));																	
					workHours.setUserCreate(rsWorkHours.getString("user_create"));
					workHours.setUserUpdate(rsWorkHours.getString("user_update"));
					workHours.setTimeCreate(rsWorkHours.getTimestamp("time_create"));
					workHours.setTimeUpdate(rsWorkHours.getTimestamp("time_update"));
					workHours.setWorkinghours(rsWorkHours.getInt("workinghours"));
					
					//execute insert or update to payroll
					workHoursDAO.saveOrUpdate(workHours);
					insertNumWorkHours++;
				}catch (Exception e) {
					workHours_id_err.put(rsWorkHours.getString("work_hours_id"));
					errorNumWorkHours++;
				}
			}
			workHours_error.put("id", workHours_id_err);
			workHours_error.put("error", errorNumWorkHours);
			jsonError.put(workHours_error);
			
			//Set record to migrate_detail
			Migrate_detail detailWorkHours = new Migrate_detail();
			detailWorkHours.setStatus(errorNumWorkHours == 0 ? "1" : "0");
			detailWorkHours.setSelect_from(table);
			detailWorkHours.setInsert_to(table);
			detailWorkHours.setSelect_num(Integer.toString(selectNumWorkHours));
			detailWorkHours.setInsert_num(Integer.toString(insertNumWorkHours));
			detailWorkHours.setError_num(Integer.toString(errorNumWorkHours));
			detailWorkHours.setUser_create(userId);
			detailWorkHours.setUser_update(userId);
			detailWorkHours.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			detailWorkHours.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			migrateDetailList.add(detailWorkHours);
			//==========================================//
			
			//========== Table User ============//
			table = "user";
			JSONObject user_error = new JSONObject();
			user_error.put("table", table);
			JSONArray user_id_err = new JSONArray();
			int selectNumUser = 0;
			int insertNumUser = 0;
			int errorNumUser = 0;
			
			String sqlUser = "select * from user where time_update >= '"+lastedMigrate+"'";					
			Statement stmtUser = con.createStatement();
			ResultSet rsUser = stmtUser.executeQuery(sqlUser);
			while (rsUser.next()) {
				selectNumUser++;
				String id = rsUser.getString("id");
				try {			
					//Set value to model object
					User user = new User();
					user.setId(id);
					user.setRoleId(rsUser.getString("role_id"));
					user.setDepartmentId(rsUser.getString("department_id"));
					user.setPositionId(rsUser.getString("position_id"));
					user.setEmployeeId(rsUser.getString("employee_id"));
					user.setName(rsUser.getString("name"));
					user.setNickName(rsUser.getString("nick_name"));
					user.setPassword(rsUser.getString("password"));
					user.setEmail(rsUser.getString("email"));
					user.setBirthDate(rsUser.getDate("birth_date"));
					user.setAddress(rsUser.getString("address"));
					user.setFlagSearch(rsUser.getString("flag_search"));
					user.setStartDate(rsUser.getDate("start_date"));
					user.setEndDate(rsUser.getDate("end_date"));
					user.setWorkDayStart(rsUser.getString("work_day_start"));
					user.setWorkDayEnd(rsUser.getString("work_day_end"));
					user.setWorkTimeStart(rsUser.getString("work_time_start"));
					user.setWorkTimeEnd(rsUser.getString("work_time_end"));
					user.setEnable(rsUser.getString("enable"));
					user.setTimeCreate(rsUser.getTimestamp("time_create"));
					user.setTimeUpdate(rsUser.getTimestamp("time_update"));			
					user.setPhoneNum(rsUser.getString("phone_num"));
					user.setGender(rsUser.getString("gender"));
					user.setUsername("");
					user.setTitle_name_th(rsUser.getString("title_name_th"));
					user.setTitle_name_en(rsUser.getString("title_name_en"));
					user.setNameEN(rsUser.getString("name_en"));
					user.setNicknameEN(rsUser.getString("nick_name_en"));
					user.setNameEmer(rsUser.getString("emergency_contact"));
					user.setPhoneEmer(rsUser.getString("emergency_phone"));
					user.setEmployee_type_id(rsUser.getString("employee_type_id"));
					user.setSocial_security(rsUser.getString("social_security"));
					user.setWithholding(rsUser.getBigDecimal("withholding"));
					user.setWithholding_auto(rsUser.getString("withholding_auto"));
					user.setTax_deduction(rsUser.getString("tax_deduction"));
					user.setTransfer_type(rsUser.getString("transfer_type"));
					user.setBank(rsUser.getString("bank"));
					user.setBank_type(rsUser.getString("bank_type"));
					user.setBank_number(rsUser.getString("bank_number"));
					user.setBank_branch(rsUser.getString("bank_branch"));
					user.setCitizen_id(rsUser.getString("citizen_id"));
					user.setPassport_id(rsUser.getString("passport_id"));
										
					//execute insert or update to payroll
					userDAO.saveOrUpdate(user);
					insertNumUser++;
				}catch (Exception e) {
					user_id_err.put(rsUser.getString("id"));
					errorNumUser++;
				}
			}
			user_error.put("id", user_id_err);
			user_error.put("error", errorNumUser);
			jsonError.put(user_error);
			
			//Set record to migrate_detail
			Migrate_detail detailUser = new Migrate_detail();
			detailUser.setStatus(errorNumUser == 0 ? "1" : "0");
			detailUser.setSelect_from(table);
			detailUser.setInsert_to(table);
			detailUser.setSelect_num(Integer.toString(selectNumUser));
			detailUser.setInsert_num(Integer.toString(insertNumUser));
			detailUser.setError_num(Integer.toString(errorNumUser));
			detailUser.setUser_create(userId);
			detailUser.setUser_update(userId);
			detailUser.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			detailUser.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			migrateDetailList.add(detailUser);
			//==========================================//
			
			//========== Insert to Migrate ============//
			selectNumAll = selectNumDept + selectNumLeaveType + selectNumPosition + selectNumLeave + selectNumWorkHours + selectNumUser;
			insertNumAll = insertNumDept + insertNumLeaveType + insertNumPosition + insertNumLeave + insertNumWorkHours + insertNumUser;
			errorNumAll = errorNumDept + errorNumLeaveType + errorNumPosition + errorNumLeave + errorNumWorkHours + errorNumUser;
			Migrate migrate = new Migrate();
			migrate.setAction(action);
			migrate.setStatus(errorNumAll == 0 ? "1" : "0");
			migrate.setSelect_num(Integer.toString(selectNumAll));
			migrate.setInsert_num(Integer.toString(insertNumAll));
			migrate.setError_num(Integer.toString(errorNumAll));
			migrate.setDescription(jsonError.toString());
			migrate.setUser_create(userId);
			migrate.setUser_update(userId);
			migrate.setTime_create(new java.sql.Timestamp(System.currentTimeMillis()));
			migrate.setTime_update(new java.sql.Timestamp(System.currentTimeMillis()));
			int id = this.save(migrate);
			
			//========== Insert to Migrate Detail ============//
			this.saveDetail(migrateDetailList, id);
			
			con.close();
			migrateResult = "OK";
		} catch (Exception e) {
			e.printStackTrace();
			migrateResult = "ERROR:"+ e.getMessage();
		}
		return migrateResult;
	}

}
