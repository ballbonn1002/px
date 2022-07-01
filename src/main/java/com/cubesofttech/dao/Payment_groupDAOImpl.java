package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Payment_group;

@Repository
public class Payment_groupDAOImpl implements Payment_groupDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
    public void save(Payment_group payment_group) throws Exception{
        Session session = this.sessionFactory.getCurrentSession();
        session.save(payment_group);
        session.flush();
        //session.close();
    }
	
	@Override
    public void update(Payment_group payment_group) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(payment_group);
        session.flush();
        //session.close();
    }
	
	@Override
    public void delete(Payment_group payment_group) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete( payment_group);
        session.flush();
        //session.close();
    }
	
	@Override
    public List<Payment_group> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_group> paymentGroupList = null;
		try {
			String sql = "SELECT * FROM payment_group ORDER BY time_create DESC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentGroupList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentGroupList;
	}
    

    @Override
    public Payment_group findById(Integer  Payment_group_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Payment_group payment_group = null;
        try {
        	payment_group = (Payment_group) session.get(Payment_group.class, Payment_group_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return payment_group;
    }

	@Override
	public List<Payment_group> listForReport() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_group> paymentGroupList = null;
		try {
			String sql = "SELECT payment_group.*,SUM(payment.total_pay) AS total_pay FROM payment_group JOIN payment ON\r\n"
					+ "payment_group.payment_group_id = payment.payment_group_id\r\n"
					+ "GROUP BY payment_group.payment_group_id;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentGroupList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentGroupList;
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
