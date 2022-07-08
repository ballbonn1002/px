package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Payment;


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
	public List<Map<String, Object>> findAllByGroupId() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> payment = null;
		try {
			String sql = "select pg.payment_group_id, pg.name, pg.payment_date, pg.status, SUM(p.salary) as salary ,SUM(p.income_net) as income_net, "
					+ "SUM(p.expend_net) as expend_net,COUNT(p.payment_id) as payment_count FROM payment as p "
					+ "inner join payment_group as pg On p.payment_group_id = pg.payment_group_id Group by p.payment_group_id ORDER BY pg.time_create DESC;";
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
					+ "			Where p.status != 0"
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
	
	
	

}
