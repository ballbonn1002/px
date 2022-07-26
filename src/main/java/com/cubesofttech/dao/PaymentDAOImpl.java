package com.cubesofttech.dao;

import java.math.BigDecimal;
import java.time.Month;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Payment;
import com.cubesofttech.model.UserSalary;


@Repository
public class PaymentDAOImpl implements PaymentDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.save(payment);
		session.flush();
		
	}

	@Override
	public List<Payment> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment> payment = null;
		try {
			payment = session.createCriteria(Payment.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return payment;
		}

	@Override
	public void update(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(payment);
		session.flush();
		
	}

	@Override
	public void delete(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(payment);
		session.flush();
		
	}
	
	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Payment.class).setProjection(Projections.max("id"));
			maxId = (Integer) criteria.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			return new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else {
			return new Integer(0);
		}
	}

	@Override
	public List<Map<String, Object>> findAllByGroupId() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> payment = null;
		try {
			String sql = "select pg.payment_group_id, pg.name, pg.payment_date, pg.status, SUM(p.salary) as salary ,SUM(p.income_net) as income_net,SUM(p.expend_net) as expend_net,COUNT(p.payment_id) as payment_count FROM payment as p "
					+ "inner join payment_group as pg On p.payment_group_id = pg.payment_group_id where pg.status != 0 Group by p.payment_group_id ORDER BY pg.time_create DESC;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE); 
			payment = query.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return payment;
	}
	
	@Override
	public List<Map<String, Object>> countStatus() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> payment = null;
		try {
			String sqlUpdate = "select COUNT(p.payment_id) as payment_count"
					+ "			FROM Payment as p"
					+ "			inner join payment_group as pg"
					+ "			On p.payment_group_id = pg.payment_group_id"
					+ "			where pg.status != 0"
					+ "			Group by p.payment_group_id"
					+ "			Order by pg.time_create DESC";
			SQLQuery query = session.createSQLQuery(sqlUpdate);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE); 
			payment = query.list();
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return payment;
	}
	
	@Override
	public long dashboardEmpTypeMonth(String EmpId, String month, String year) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
        try {
        	
        	YearMonth yearMonthObject = YearMonth.of(Integer.parseInt(year),Month.valueOf(month.toUpperCase()).getValue());
        	String sdate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-1";
        	String edate = year+"-"+Month.valueOf(month.toUpperCase()).getValue()+"-" + String.valueOf(yearMonthObject.lengthOfMonth());
         
        	String sql = "select sum(total_pay) from Payment p"
        			+ "	  inner join payment_group pg on p.payment_group_id = pg.payment_group_id "
					+ "	  where p.employee_type_id = :employee_id"
					+ "	  and (pg.payment_date BETWEEN :sdate and :edate)";
					
			SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("employee_id",EmpId);
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
	public long dashboardEmpTypeYear(String EmpId, String year) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		long count = 0;
        try {
        	
         
        	String sql = "select sum(total_pay) from Payment p"
        			+ "	  inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
					+ "	  where p.employee_type_id = :employee_id"
					+ "	  and (year(pg.payment_date) = :year)";
					
        	SQLQuery query = session.createSQLQuery(sql);	
			query.setParameter("employee_id",EmpId);
			query.setParameter("year",year);
            if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
			
            
            if (query.list().get(0) != null) {
            	count = ((BigDecimal)query.list().get(0)).longValue();
            }
  
        } catch (Exception e) {
        	e.printStackTrace();

        } 
        return count;
	}
	
	@Override
	public Payment findById(Integer payment_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Payment payment = null;
        try {
        	payment = (Payment) session.get(Payment.class, payment_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }
        return payment;
	}

	@Override
	public List<Map<String, Object>> getPaymentTable(int paymentGroupId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> payment = null;
		try {
			String sqlUpdate = "select "
					+ "			u.user_id,user.name,p.employee_type_id,p.employee_type_name,p.status,p.absent,p.absence,p.payment_id,p.OT1,p.OT2,p.OT3,p.actual_day,p.actual_hours,p.remark"
					+ "			from payment as p"
					+ "			inner join user_salary as u on u.user_id = p.user_id"
					+ "			inner join employee_type et on p.employee_type_id = et.employee_type_id"
					+ "			inner join user on user.id = u.user_id"
					+ "			where u.date = ("
					+ "			    select max(u2.date) from user_salary as u2"
					+ "				where u2.user_id = u.user_id"
					+ "			) and ("
					+ "				p.payment_group_id = :pg_id"
					+ "			)"
					+ "			group by u.user_id;";
			SQLQuery query = session.createSQLQuery(sqlUpdate);
			query.setParameter("pg_id",paymentGroupId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE); 
			payment = query.list();
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return payment;
	}
	
	
	@Override
	public List<Payment> findAllByGroupId(String paymentGroupId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment> payment = null;
		try {
		Criteria cr = session.createCriteria(Payment.class);
		cr.add(Restrictions.eq("payment_group_id", paymentGroupId));
		payment = cr.list();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return payment;
		
	}

	@Override
	public List<Map<String, Object>> getStatusByGroupId(String paymentGroupId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> payment = null;
		try {
			String sqlUpdate = "select status"
					+ "			from payment"
					+ "			where payment_group_id = :pg_id";
			SQLQuery query = session.createSQLQuery(sqlUpdate);
			query.setParameter("pg_id",paymentGroupId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE); 
			payment = query.list();
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return payment;
	}

	@Override
	public List<Map<String, Object>> getTotalPayByGroupId(String paymentGroupId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> payment = null;
		try {
			String sqlUpdate = "select sum(salary) as salary, sum(income_net) as income_net, sum(expend_net) as expend_net , sum(total_pay) as total_pay"
					+ "			from payment"
					+ "			where payment_group_id = :pg_id";
			SQLQuery query = session.createSQLQuery(sqlUpdate);
			query.setParameter("pg_id",paymentGroupId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE); 
			payment = query.list();
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return payment;
	}

	
	
	
	
	

}
