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
	public List<Map<String, Object>> departmentById() throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> departmentId = null;
		try {
			String sql = "SELECT * FROM position GROUP BY department_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			departmentId = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return departmentId; 
	}
	
	@Override
	public List<Map<String, Object>> findYear() throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> findYearSalary = null;
		try {
			String sql = "SELECT EXTRACT(YEAR FROM payment_group.payment_date) AS year FROM payment_group GROUP BY EXTRACT(YEAR FROM payment_group.payment_date)";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findYearSalary = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findYearSalary; 
	}
	
	@Override
	public List<Map<String, Object>> monthSalary(String mYear, String mDepart) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> findMonth = null;
		try {
			String sql = "SELECT payment_group.payment_group_id, payment_group.name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, EXTRACT(MONTH FROM payment_group.payment_date) AS month, SUM(payment.total_pay) AS sum_total_pay, user.position_id, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+mDepart+"' AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"' GROUP BY payment.payment_group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findMonth = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findMonth; 
	}

}
