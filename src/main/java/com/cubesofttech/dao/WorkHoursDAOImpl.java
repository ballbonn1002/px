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
	public List<Map<String, Object>> findBonusByYear(String userId,String Year) throws Exception {
		List<Map<String, Object>> query_listMap = null;
		Session session =  this.sessionFactory.getCurrentSession(); 
		try {
			String sql = "SELECT payment.user_id , payment_detail.payment_type_id , payment_group.payment_date ,payment_detail.amount FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"; 
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query_listMap = query.list();
			Log.debug(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return query_listMap;
	}
	
	

}
