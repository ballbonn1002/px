package com.cubesofttech.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.time.Month;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.impl.xb.xsdschema.RestrictionDocument.Restriction;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Payment_detail;

@Repository
public class Payment_detailDAOImpl implements Payment_detailDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Payment_detail payment_detail) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(payment_detail);
		session.flush();
		
	}

	@Override
	public List<Payment_detail> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_detail> payment_detail = null;
		try {
			payment_detail = session.createCriteria(Payment_detail.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return payment_detail;
		}

	@Override
	public void update(Payment_detail payment_detail) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(payment_detail);
		session.flush();
		
	}

	@Override
	public void delete(Payment_detail payment_detail) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(payment_detail);
		session.flush();
		
	}

	@Override
	public long dashboardPaymentMonth(String paymentType,String month,String year) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
		try {
			YearMonth yearMonthObject = YearMonth.of(Integer.parseInt(year),Month.valueOf(month.toUpperCase()).getValue());
        	String sdate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-1";
        	String edate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-" + String.valueOf(yearMonthObject.lengthOfMonth());
        	
			String sql = " select sum(pd.amount) from payment_detail as pd"
					+ " inner join payment p on pd.user_id = p.user_id and pd.payment_id = p.payment_id"
					+ " inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
					+ " where pd.payment_type_id = :paymentType"
					+ "	and pg.payment_date BETWEEN :sdate and :edate";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("paymentType", paymentType);
			query.setParameter("sdate", sdate);
			query.setParameter("edate", edate);
			if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public long dashboardPaymentYear(String paymentType, String year) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
		try {
			String sql = " select sum(pd.amount) from payment_detail as pd"
					+ " inner join payment p on pd.user_id = p.user_id and pd.payment_id = p.payment_id"
					+ " inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
					+ " where pd.payment_type_id = :paymentType"
					+ "	and (year(pg.payment_date) = :year)";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("paymentType", paymentType);
			query.setParameter("year", year);
			if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public List<Payment_detail> searchPaymentDetailByPidnUid(String pId,String uId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_detail> payment_detail = null;
		try {
			Criteria cr = session.createCriteria(Payment_detail.class);
			cr.add(Restrictions.eq("payment_id", pId));
			cr.add(Restrictions.eq("user_id", uId));
			payment_detail = cr.list();
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		return payment_detail;
	}
	
	
	
	

}
