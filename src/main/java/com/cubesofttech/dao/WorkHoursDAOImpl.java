package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.WorkHours;

@Repository
public class WorkHoursDAOImpl implements WorkHoursDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(WorkHours WorkHours) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(WorkHours);
		session.flush();
		// session.close();
		
	}
	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> workHoursList = null;
		try {
			String sql = "SELECT * FROM work_hours";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			workHoursList = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workHoursList;
	
	}
	
	/*
	 * @Override 
	 * public List<Map<String, Object>> findworkmonthall(java.sql.Timestamp Datenow, 
	 * java.sql.Timestamp DateBefore,String month, String year) throws Exception { 
	 * Session session =  this.sessionFactory.getCurrentSession(); 
	 * List<Map<String, Object>> workHoursList = null; 
	 * try { 
	 * 	String sql = "SELECT * FROM work_hours WHERE YEAR(work_hours_time_work)=:year " +
	 * "AND MONTH(work_hours_time_work)=:month "; 
	 * SQLQuery query = session.createSQLQuery(sql); 
	 * query.setParameter("month", month);
	 * query.setParameter("year", year);
	 * query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
	 * workHoursList = query.list();
	 * } catch (Exception e) { 
	 * 		e.printStackTrace(); 
	 * } return workHoursList; }
	 */

	@Override 
	public List<Map<String, Object>> findworkmonthalll(Timestamp tstamp, 
			Timestamp tstampbefore, String month, String year) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> workhoursList = null; 
		try {
			String sql = "SELECT * FROM work_hours WHERE YEAR(work_hours_time_work)=:year " 
					+ "AND MONTH(work_hours_time_work)=:month "; 
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			workhoursList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workhoursList;

	 }
	
	@Override
	public List<Map<String, Object>> findUserWork(String userid, String month, String year) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> userwork = null;
		try {
			String sql = "SELECT * FROM work_hours WHERE YEAR(work_hours_time_work)=:year " 
					+ "AND MONTH(work_hours_time_work)=:month AND user_create=:userid"; 
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
			query.setParameter("month", month);
			query.setParameter("year", year);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userwork; 
	}

	@Override
	public List<Map<String, Object>> worktime(String month, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> worktime = null;
		try {
			String sql = "SELECT user_create, SUM(workinghours) AS workinghours FROM `work_hours` "
					+ "WHERE MONTH(work_hours_time_work) =:month AND YEAR(work_hours_time_work) =:year "
					+ "GROUP BY user_create;";
			
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("month", month);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			worktime = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return worktime;
	}


	@Override
	public List<Map<String, Object>> checkoutcalendar(String userid, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> test1 = null;
		try {
			String sql = "SELECT DATE(work_hours_time_work) AS datecheck, TIME(work_hours_time_work) AS checkout, workinghours FROM `work_hours` "
					+ "WHERE work_hours_type = 2 AND user_create =:userid AND YEAR(work_hours_time_work) =:year ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			test1 = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test1;
	}
	@Override
	public List<Map<String, Object>> checkincalendar(String userid, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> test2 = null;
		try {
			String sql = "SELECT TIME(work_hours_time_work) AS checkin FROM `work_hours` "
					+ "WHERE work_hours_type = 1 AND user_create =:userid AND YEAR(work_hours_time_work) =:year ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("userid", userid);
			query.setParameter("year", year);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			test2 = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test2;
	}
	
}
