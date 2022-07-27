package com.cubesofttech.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.time.Month;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.action.PaymentTypeAction;
import com.cubesofttech.model.User;
import com.google.gson.Gson;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(User User) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(User);
		session.flush();
		// session.close();
	}
	
	@Override
	public void saveOrUpdate(User User) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(User);
		session.flush();
		// session.close();
	}

	@Override
	public List<User> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = null;
		try {
			String sql = "SELECT * FROM `user` ORDER BY id ASC;" ; 
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return userList;
	}
	
	@Override
	public List<User> findAllPayroll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = null;
		try {
			String sql = "SELECT user.id as userid, employee_id, user.name as name, user.department_id as dep, position.name as pos, employee_type.name as emp_type FROM `user` "
						 + "LEFT JOIN position ON user.position_id = position.position_id "
						 + "LEFT JOIN employee_type ON user.employee_type_id = employee_type.employee_type_id;" ;
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return userList;
	}
	
	@Override
	public List<Map<String, Object>> findAllleaves() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userList = null;
		try {
			String sql = "SELECT leaves.user_id,user.department_id FROM leaves INNER JOIN user ON leaves.user_id=user.id GROUP BY leaves.user_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return userList;
	}

	@Override
	public User findById(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		User User = null;
		try {
			User = (User) session.get(User.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return User;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> findByemail(String email) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> findByemail = null;
		try {
			String sql = " SELECT email,id FROM user WHERE user.email = :email ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("email", email);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findByemail = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findByemail;
	}
	@Override
	public List<Map<String, Object>> findAllforReport() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userList = null;
		try {
			String sql = " SELECT * FROM user";
			SQLQuery query = session.createSQLQuery(sql);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	public List countYear() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		String year = null;
		List list=null;
		try {
			String sql = " SELECT COUNT(DISTINCT EXTRACT(YEAR FROM start_date)) AS numyear FROM user";
			SQLQuery query = session.createSQLQuery(sql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Map<String, Object>> findById3(String ur) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;
		try {
			String sql = " SELECT role_id FROM user WHERE user.id = :ur ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("ur", ur);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void update(User User) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(User);
		session.flush();
		// session.close();
	}

	@Override
	public void delete(User User) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(User);
		session.flush();
		// session.close();
	}

	@Override
	public List<User> findBySelect(String usertoappr) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> selectuser = null;
		try {
			String approver = "";
			if (usertoappr != null) {
				approver = "   WHERE user.id =  :usertoappr";
			}

			String sql = " SELECT  manager_id  FROM user " + approver + "";

			// SELECT MIN(user.id), user.manager_id, user.department_id,
			// user.name FROM user
			// WHERE user.id = (SELECT user.id FROM user WHERE user.id =
			// 'wishida.p' )

			// SELECT user.id, user.manager_id, user.department_id, user.name
			// FROM user WHERE user.id =
			// ( SELECT user.id FROM user WHERE user.id = 'wishida.p' )

			// SELECT Student_Fname, Student_Lname
			// FROM Student
			// WHERE Age= manager
			// (SELECT Age manager
			// FROM Student
			// WHERE Student_Fname='เยาวภา');

			// SELECT user.id, user.manager_id FROM user WHERE user.id
			// ='wishida.p'

			SQLQuery query = session.createSQLQuery(sql);
			if (usertoappr != null) {
				query.setParameter("usertoappr", usertoappr);
			}
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectuser = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectuser;
	}

	@Override
	public List<Map<String, Object>> findByApprove(String usertoappr) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> selectuser = null;
		try {
			String approver = "";
			if (usertoappr != null) {
				approver = "   WHERE user.id =  :usertoappr";
			}

			String sql = " SELECT MIN(user.id), user.manager_id, user.department_id, user.name  FROM user " + approver;

			SQLQuery query = session.createSQLQuery(sql);
			if (usertoappr != null) {
				query.setParameter("usertoappr", usertoappr);
			}
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectuser = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectuser;
	}

	@Override
	public List<Map<String, Object>> allName() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;
		try {
			String sql = "SELECT id,department_id,CONCAT(department_id,' - ',id) AS roleuser,name FROM user "
					+ " ORDER BY enable DESC, department_id ASC ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;
		try {
			String sql = " SELECT id,enable, CONCAT(department_id,' - ',id) AS roleuser,  department_id, manager_id, name "
					+ " FROM user  " + " ORDER BY enable DESC, department_id ASC   ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Map<String, Object>> Query_Userlist() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;
		try {
			String sql = "SELECT user.id,user.title_name_th,user.name,user.flag_search,user.role_id,user.employee_id,user.department_id,user.email,user.enable ,CONCAT(user.id), user.position_id,user.start_date,job_site.name_site FROM user LEFT JOIN job_site ON user.id_sitejob = job_site.id_sitejob WHERE flag_search = 1 ORDER BY id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Map<String, Object>> findChangeLeader(String approverchange) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> selectuser = null;
		try {
			String approver = "";
			if (approverchange != null) {
				approver = "   WHERE user.manager_id =  :approverchange";
			}

			String sql = " SELECT MIN(user.manager_id), user.manager_id, user.department_id, user.name  FROM user "
					+ approver;

			SQLQuery query = session.createSQLQuery(sql);
			if (approverchange != null) {
				query.setParameter("approverchange", approverchange);
			}
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectuser = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectuser;
	}

	@Override
	public List<Map<String, Object>> findById2(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List id1 = null;
		try {
			String sql = " SELECT * FROM user WHERE user.id = :id ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			id1 = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id1;

	}

	@Override
	public List<Map<String, Object>> positionuser(String currentUserlist) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> positionuser = null;
		try {

			String sql = " SELECT department_id " + " FROM user " + " WHERE id = :currentUserlist " + " LIMIT 1 ";

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("currentUserlist", currentUserlist);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			positionuser = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return positionuser;
	}

	@Override
	public int[] count_user() {
		Session session = this.sessionFactory.getCurrentSession();
		int[] count = new int[5];
		int count_it = 0;
		int count_intern = 0;
		int count_hr = 0;
		int count_admin = 0;
		int count_total = 0;
		try {
			String sql = " SELECT COUNT(id) " + " FROM user " + "where department_id = 'IT'";
			String sql2 = " SELECT COUNT(id) " + " FROM user " + "where department_id = 'IN'";

			String sql3 = " SELECT COUNT(id) " + " FROM user " + "where department_id = 'HR'";

			String sql4 = " SELECT COUNT(id) " + " FROM user " + "where department_id = 'AD'";
			String sql5 = " SELECT COUNT(id) " + " FROM user ";

			SQLQuery query = session.createSQLQuery(sql);
			SQLQuery query2 = session.createSQLQuery(sql2);
			SQLQuery query3 = session.createSQLQuery(sql3);
			SQLQuery query4 = session.createSQLQuery(sql4);
			SQLQuery query5 = session.createSQLQuery(sql5);

			count_it = ((Number) query.uniqueResult()).intValue();
			count_intern = ((Number) query2.uniqueResult()).intValue();
			count_hr = ((Number) query3.uniqueResult()).intValue();
			count_admin = ((Number) query4.uniqueResult()).intValue();
			count_total = ((Number) query5.uniqueResult()).intValue();

			count[0] = count_it;
			count[1] = count_intern;
			count[2] = count_hr;
			count[3] = count_admin;
			count[4] = count_total;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}

	@Override
	public User findByFbId(String fbId) throws Exception {
		User result = null;
		Session session = this.sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("facebookid", fbId));
		List results = cr.list();
		if (!results.isEmpty()) {
			result = (User) results.get(0);
			return result;
		} else {
			return null;
		}

	}

	@Override
	public User findbyLineId(String lineId) throws Exception {
		User result = null;
		Session session = this.sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("line_id", lineId));
		List results = cr.list();
		if (!results.isEmpty()) {
			result = (User) results.get(0);
			return result;
		} else {
			return null;
		}

	}

	@Override
	public void linkLine(String userId, String lineId) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			User user = (User) session.get(User.class, userId);
			user.setLine_id(lineId);
			session.update(user);
			tx.commit();
			session.flush();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void linkFacebook(String userId, String facebookid) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			User user = (User) session.get(User.class, userId);
			user.setFacebookid(facebookid);
			session.update(user);
			tx.commit();
			session.flush();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
	}

	@Override
	public String userListJSON() {
		Session session = this.sessionFactory.getCurrentSession();
		String result = null;
		List<Map<String, String>> list = null;
		try {
			String hql = "SELECT new map(u.id as id, u.name as name, u.enable as enable, u.roleId as role, u.departmentId as department, u.positionId as position, u.managerId as manager) FROM User u";
			list = session.createQuery(hql).list();
			result = new Gson().toJson(list);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return result;
	}

//reset lastyear quota
	public String resetLastyearQuota() {

		Session session = this.sessionFactory.getCurrentSession();

		try {
			String sql = " UPDATE user SET leave_quota_lastyear = 0 WHERE Month(sysdate()) BETWEEN '4' and '12' ";
			SQLQuery query = session.createSQLQuery(sql);
			query.executeUpdate();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return "1";
	}

//Count User Enable and Disable
	public List<Map<String, Object>> UserCountEnable() {

		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT COUNT(enable) as total ,name,id,department_id FROM user WHERE enable = 1";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}

// USER ACTIVE / IN
	public List<Map<String, Object>> UserEnable(String enable) {

		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id FROM user WHERE enable = '1' AND id LIKE '%"+enable+"%'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}
	
	public List<Map<String, Object>> UserEnable() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;
		try {
			String sql = "SELECT name, id, department_id, enable FROM user WHERE enable = '1'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}
	
	public List<Map<String,Object>> AllUserEnable()
	{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id,path FROM user WHERE enable = '1' LIMIT 10,10";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}
	
	public List<Map<String,Object>> AllUserEnableOffset(int limit,int offset,String search)
	{
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id,path FROM user WHERE enable = '1' ";
			if(!search.isEmpty()) {
				sql += " and lower(id) like '%"+search.toLowerCase()+"%' or lower(name) like '%"+search.toLowerCase()+"%' ";
			}
			sql += " LIMIT "+offset+","+limit+" ";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}
	
	@Override
	public long CountAllUserEnableOffset(String search)
	{
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
		try {
			String hql = " SELECT count(id) FROM User WHERE enable = '1' ";
			
			if(!search.isEmpty()) {
				hql += " and lower(id) like '%"+search.toLowerCase()+"%' or lower(name) like '%"+search.toLowerCase()+"%' ";
			}
 
			Query query = session.createQuery(hql);

			count = (long)query.list().get(0);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<Map<String,Object>> findUserEnablebyNameOrId(String name){
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id,path FROM user WHERE enable = '1' And (id LIKE '%"+name+"%' OR name LIKE '%"+name+"%')";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}
	public List<Map<String,Object>> findUserEnablebyDepartment(String Department){
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id,path FROM user WHERE enable = '1' And department_id LIKE '%"+Department+"%'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;

	}
	public List<Map<String,Object>> findUserEnablebyIdAndDepartment(String Department , String nameorid){
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id,path FROM user WHERE enable = '1' And (id LIKE '%"+nameorid+"%' OR name LIKE '%"+nameorid+"%') And department_id =:deid";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("deid", Department);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}
	
	public List<Map<String, Object>> UserDisable() {

		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserInactive = null;

		try {
			String sql = "SELECT COUNT(enable) as total ,name,id,department_id FROM user WHERE enable = 0";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserInactive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserInactive;
	}

	@Override
	public User findByPhoneNum(String phone_num) throws Exception {
		User result = null;
		Session session = this.sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("phone_num", phone_num));
		List results = cr.list();
		if (!results.isEmpty()) {
			result = (User) results.get(0);
			return result;
		} else {
			return null;
		}

	}

	public List<Map<String, Object>> findByWhereInId(String online_user) {

		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userOnlineList = null;

		try {
			String sql = "SELECT * FROM `user` WHERE id IN (" + online_user + ") ORDER BY `id` ASC";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userOnlineList = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return userOnlineList;
	}

	/* test */
	@Override
	public List<Map<String, Object>> findRoleNameById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> test_holiday = null;
		try {

			String sql = "SELECT user.id, user.path, role.name FROM user  INNER JOIN role ON user.role_id=role.id  WHERE user.id IN ("
					+ id + ") ORDER BY `id` ASC";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			test_holiday = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test_holiday;
	}

	@Override
	public List<Map<String, Object>> test_birthdaysummary() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> test_birthdaysummary = null;
		String sql;
		try {

//String sql = "SELECT time_create,status_id,user_id,DAY(time_create)AS DAY,MONTH(time_create) AS MONTH, YEAR(time_create) AS YEAR FROM `expense_group` WHERE user_id='yanikar.t' AND YEAR(time_create)= '2017' GROUP BY (time_create) ASC";

			// sql = "SELECT time_create,status_id,user_id,DAY(time_create)AS
			// DAY,MONTH(time_create) AS MONTH, YEAR(time_create) AS YEAR FROM
			// `expense_group` WHERE user_id='' AND YEAR(time_create)= '' GROUP BY
			// (time_create) ASC";
			sql = "SELECT enable,birth_date,id,DAY(birth_date)AS DAY,MONTH(birth_date) AS MONTH, YEAR(birth_date) AS YEAR FROM user WHERE enable = '1' AND birth_date IS NOT NULL ORDER BY MONTH(birth_date) ASC,DAY(birth_date) ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			test_birthdaysummary = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test_birthdaysummary;
	}

	public List<Map<String, Object>> Query_Userlist2() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;
		try {
			String sql = "SELECT id,name,flag_search,role_id,department_id,email,enable, position_id,start_date,user_create,MAX(work_hours.time_create)AS last_chackin, gender, CASE WHEN gender= 'M' THEN '1'WHEN gender = 'F' THEN '2'ELSE 'Null'END AS gendertrue FROM user,work_hours WHERE user.id=work_hours.user_create AND user.flag_search = 1 GROUP BY user.id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			user = query.list();
			/* System.out.println(user); */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<Map<String, Object>> getGender(String[] setgender) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;

		try {
			String sql = "SELECT id, name FROM `user` WHERE id = '" + setgender[0] + "'";
			/* System.out.println(sql); */
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);

			user = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<Map<String, Object>> updateGender(String[] setgender) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> user = null;

		try {
			String sql = " UPDATE user SET gender = '" + setgender[1] + "' WHERE id = '" + setgender[0] + "'";
			/* System.out.println(sql); */
			SQLQuery query = session.createSQLQuery(sql);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Map<String, Object>> findRoleById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> role = null;
		try {

			String sql = "SELECT * FROM `user_role` WHERE user_id = '" + id + "'";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			role = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return role;
	}

	///////
	/*
	 * @Override public String apprNameById(String id) { Session session =
	 * this.sessionFactory.getCurrentSession(); String result = null;
	 * List<Map<String,String>> list = null; try { String hql =
	 * "SELECT new map (u.name) FROM user u WHERE u.id="+id+"";
	 * Log.debug("dataBBB"+hql); list = session.createQuery(hql).list(); result =
	 * new Gson().toJson(list); } catch (HibernateException e) {
	 * e.printStackTrace(); } return result; }
	 */

	@Override
	public List<Map<String, Object>> apprNameById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> name = null;
		try {

			String sql = "SELECT name FROM user WHERE id = '" + id + "'";

			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			name = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public List<Map<String, Object>> findTimeUserWork(String user) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> name = null;
		try {

			String sql = "SELECT work_time_start,work_time_end FROM user WHERE id =:user ";

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("user", user);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			name = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public List<Map<String, Object>> findAllUser(String month, String year) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> name = null;
		try {

			String sql = "SELECT DISTINCT user_create FROM work_hours WHERE YEAR(work_hours_time_work)=:year AND MONTH(`work_hours_time_work`)=:month Order by user_create";

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			name = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public List<Map<String, Object>> findAllUserYear(String year) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> name = null;
		try {

			String sql = "SELECT DISTINCT user_create FROM work_hours WHERE YEAR(work_hours_time_work)=:year Order by user_create";

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			name = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	public List<Map<String,Object>> HappyBirthday(String month, String day){
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> Onlinelist_body = null;
		try {
			String sql = "SELECT * FROM user WHERE MONTH(birth_date) =:month AND DAY(birth_date) =:day";
			
			SQLQuery query = session.createSQLQuery(sql);
			
			query.setParameter("month", month);
			query.setParameter("day", day);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Onlinelist_body = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return Onlinelist_body;
	}
	
	public List<Map<String,Object>> findUserChat(String name){
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> Onlinelist_body = null;
		try {
			String sql = "SELECT name,id,path FROM user WHERE enable = '1' And (id LIKE '"+name+"%' OR name LIKE '"+name+"%')";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Onlinelist_body = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return Onlinelist_body;
	}

	@Override
	public List<Map<String, Object>> AllUserEnable(String OwnerId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> UserActive = null;

		try {
			String sql = "SELECT name,id,department_id,path FROM user WHERE enable = '1' AND id NOT IN ('"+OwnerId+"')";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			UserActive = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return UserActive;
	}

	@Override
	public List<Map<String, Object>> userWork(String month, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userwork = null;
		try {
			String sql = "SELECT u.name, u.id, u.department_id, e.term_day, "
					+ " (SELECT SUM(no_day) FROM `leaves` WHERE user_id = u.id AND MONTH(start_date) =:month AND MONTH(end_date) =:month "
					+ " AND YEAR(start_date) =:year AND YEAR(end_date) =:year AND leave_status_id = 1 GROUP BY user_id) AS no_day "
					+ "FROM ((user u LEFT JOIN employee_type e ON u.employee_type_id = e.employee_type_id) "
					+ "LEFT JOIN leaves l ON u.id = l.user_id) WHERE u.enable = '1' GROUP BY u.id";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userwork = query.list();
			System.out.println(userwork);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userwork;
	}

	@Override
	public List<Map<String, Object>> findUserWork(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userwork = null;
		try {
		/*	String sql = "SELECT u.name, u.id, u.department_id, e.term_day, "
					+ " (SELECT SUM(no_day) FROM `leaves` WHERE user_id =:id AND MONTH(start_date) =:month AND MONTH(end_date) =:month "
					+ " AND YEAR(start_date) =:year AND YEAR(end_date) =:year AND leave_status_id = 1 GROUP BY user_id) AS no_day "
					+ "FROM ((user u LEFT JOIN employee_type e ON u.employee_type_id = e.employee_type_id) "
					+ "LEFT JOIN leaves l ON u.id = l.user_id) WHERE u.enable = '1' AND u.id =:id GROUP BY u.id ";	*/
				String sql = "SELECT u.name, u.id, u.department_id, e.term_day "
					+ "FROM user u LEFT JOIN employee_type e ON u.employee_type_id = e.employee_type_id "
					+ "WHERE enable = '1' AND u.id =:id ";	
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userwork = query.list();
			System.out.println(userwork);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userwork;
	}

	
	@Override
	public List<User> userList() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = null;
		try {
			String sql = " SELECT id,name,department_id FROM `user`; " ;
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return userList;
	}

	@Override
	public long rowCountByEmpIdDateInterval(String EmpId,String month,String year)  throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
        try {
        	
        	YearMonth yearMonthObject = YearMonth.of(Integer.parseInt(year),Month.valueOf(month.toUpperCase()).getValue());
        	String sdate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-1";
        	String edate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-" + String.valueOf(yearMonthObject.lengthOfMonth());
         
        	String sql = "select count(*) from User u"
					+ "	  where u.employee_type_id = :employee_id"
        			+ "   and ("
        			+ "		("
        			+ "			(:sdate BETWEEN u.start_date and u.end_date)"
        			+ "			or (:edate BETWEEN u.start_date and u.end_date)"
        			+ "		)"
        			+ "or	("
        			+ "			( :year = year(u.start_date)"
        			+ "			and :month = month(u.start_date))"
        			+ "			or ( :year = year(u.end_date)"
        			+ "			and :month = month(u.end_date))"
        			+ "		)"
        			+ ")";
			SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("employee_id",EmpId);
			query.setParameter("sdate",sdate);
			query.setParameter("edate",edate);
			query.setParameter("year", Integer.parseInt(year.trim()));
			query.setParameter("month",Month.valueOf(month.toUpperCase()).getValue());
			
            
			count = ((BigInteger)query.list().get(0)).longValue();
  
        } catch (Exception e) {
        	e.printStackTrace();

        } 
        return count;
	}
	
	public long rowCountByEmpIdFilterYear(String EmpId,String year) {
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
		try {
			String hql = "select count(u) from User u"
					+ "	  where (year(u.startDate) <= :year and year(u.endDate) >= :year)"
					+ "   and u.employee_type_id = :employee_id" ; 
			Query query = session.createQuery(hql);
			query.setParameter("year", Integer.parseInt(year.trim()));
			query.setParameter("employee_id",EmpId);
			count = (long)query.list().get(0);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public long dashboardDepartmentMonth(String DepartId,String month,String year)  throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
        try {
            
        	YearMonth yearMonthObject = YearMonth.of(Integer.parseInt(year),Month.valueOf(month.toUpperCase()).getValue());
        	String sdate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-1";
        	String edate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-" + String.valueOf(yearMonthObject.lengthOfMonth());
         
        	String sql = "select sum(p.total_pay) from User u"
        			+ " inner join payment p on u.id = p.user_id"
        			+ "	inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
        			+ "	where u.department_id = :DepartId"
        			+ "	and (pg.payment_date BETWEEN :sdate and :edate)";
        	
        	
        	SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("DepartId",DepartId);
			query.setParameter("sdate",sdate);
			query.setParameter("edate",edate);
            if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
  
        } catch (Exception e) {
        	e.printStackTrace();

        } 
        return count;
	}
	
	public long dashboardDepartmentYear(String DepartId,String year) {
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
		try {
         
        	String sql = "select sum(p.total_pay) from User u"
        			+ " inner join payment p on u.id = p.user_id"
        			+ "	inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
        			+ "	where u.department_id = :DepartId"
        			+ "	and (year(pg.payment_date) = :year)";
        	
        	
        	SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("DepartId",DepartId);
			query.setParameter("year",year);
            if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public long dashboarPositionMonth(String PositionId, String month, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
        try {
            
        	YearMonth yearMonthObject = YearMonth.of(Integer.parseInt(year),Month.valueOf(month.toUpperCase()).getValue());
        	String sdate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-1";
        	String edate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-" + String.valueOf(yearMonthObject.lengthOfMonth());
         
        	String sql = "select sum(p.total_pay) from User u"
        			+ " inner join payment p on u.id = p.user_id"
        			+ "	inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
        			+ "	where u.position_id = :positionId"
        			+ "	and (pg.payment_date BETWEEN :sdate and :edate)";
        	
        	
        	SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("positionId",PositionId);
			query.setParameter("sdate",sdate);
			query.setParameter("edate",edate);
            if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
  
        } catch (Exception e) {
        	e.printStackTrace();

        } 
        return count;
	}

	@Override
	public long dashboardPositionYear(String PositionId, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
		try {
         
        	String sql = "select sum(p.total_pay) from User u"
        			+ " inner join payment p on u.id = p.user_id"
        			+ "	inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
        			+ "	where u.position_id = :positionId"
        			+ "	and (year(pg.payment_date) = :year)";
        	
        	
        	SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("positionId",PositionId);
			query.setParameter("year",year);
            if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<Map<String, Object>> countUserOutOfYearByYear(String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		
		List<Map<String, Object>> countUserList = null ;
		try {
			String sql = "SELECT user.id ,user.department_id"
					+ ", EXTRACT(YEAR FROM user.start_date) start_year , EXTRACT(MONTH FROM user.start_date) start_month"
					+ ", EXTRACT(YEAR FROM user.end_date) end_year , EXTRACT(MONTH FROM user.end_date) end_month"
					+ ", COUNT(*) AS employee_count"
					+ " FROM user"
					+ " WHERE"
					+ " EXTRACT(YEAR FROM user.start_date) < '"+year+"' AND (EXTRACT(YEAR FROM user.end_date) > '"+year+"' OR EXTRACT(YEAR FROM user.end_date) IS NULL)"
					+ " Group BY department_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			countUserList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countUserList;
	}

	@Override
	public List<Map<String, Object>> countUserStartInYearByYear(String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		
		List<Map<String, Object>> countUserList = null ;
		try {
			String sql = "SELECT user.id ,user.department_id , EXTRACT(YEAR FROM user.start_date) start_year , EXTRACT(MONTH FROM user.start_date) month , EXTRACT(YEAR FROM user.end_date) end_year , EXTRACT(MONTH FROM user.end_date) end_month ,COUNT(*) AS employee_count FROM user WHERE EXTRACT(YEAR FROM user.start_date) = '"+year+"' AND (EXTRACT(YEAR FROM user.end_date) = '"+year+"' OR EXTRACT(YEAR FROM user.end_date) IS NULL) GROUP BY department_id , month ORDER BY department_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			countUserList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countUserList;
	}

	@Override
	public List<Map<String, Object>> countUserEndInYearByYear(String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		
		List<Map<String, Object>> countUserList = null ;
		try {
			String sql = "SELECT user.id ,user.department_id"
					+ ", EXTRACT(YEAR FROM user.start_date) start_year , EXTRACT(MONTH FROM user.start_date) start_month"
					+ ", EXTRACT(YEAR FROM user.end_date) end_year , EXTRACT(MONTH FROM user.end_date) month"
					+ ",COUNT(*) AS employee_count"
					+ " FROM user"
					+ " WHERE"
					+ " EXTRACT(YEAR FROM user.start_date) = '"+year+"' AND (EXTRACT(YEAR FROM user.end_date) = '"+year+"')"
					+ " GROUP BY department_id , month"
					+ " ORDER BY department_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			countUserList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countUserList;
	}

	@Override
	public List<Map<String, Object>> findAllDuplicatePayroll(String payrollGroupId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userList = null;
		try {
			String sql = "SELECT user.id as userid, employee_id, user.name as name, user.department_id as dep, position.name as pos, employee_type.name as emp_type , if (user.id in (SELECT p.user_id FROM payment p WHERE p.payment_group_id = :pgid),1,0) as checkbox FROM `user` "
						 + "LEFT JOIN position ON user.position_id = position.position_id "
						 + "LEFT JOIN employee_type ON user.employee_type_id = employee_type.employee_type_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("pgid", payrollGroupId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return userList;
	}
	
	

	
	
	
}
