package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.UserPaymentConfig;

@Repository
public class UserPaymentConfigDAOImpl implements UserPaymentConfigDAO{
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(UserPaymentConfig userPaymentConfig) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(userPaymentConfig);
        session.flush();
        //session.close();
		
	}

	@Override
	public List<UserPaymentConfig> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserPaymentConfig> paymentconfigList = null;
		try {
			String sql = "SELECT pt.Payment_type_id, pt.Payment_type_name, pt.type, pt.sequence, pc.* FROM user_payment_config AS pc RIGHT JOIN Payment_type AS pt ON pc.Payment_type_id=pt.Payment_type_id WHERE pt.config_flag = 1 ORDER BY sequence ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentconfigList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentconfigList;
		
	}

	@Override
	public List<UserPaymentConfig> findIncome() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserPaymentConfig> incomeList = null;
		try {
			String sql = "SELECT pt.Payment_type_id, pt.Payment_type_name, pt.type, pt.sequence, pc.* FROM user_payment_config AS pc RIGHT JOIN Payment_type AS pt ON pc.payment_type_id=pt.Payment_type_id WHERE pt.config_flag = 1 AND pt.type = 1 ORDER BY pt.sequence ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			incomeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return incomeList;
	}

	@Override
	public List<UserPaymentConfig> findExpend() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserPaymentConfig> expendList = null;
		try {
			String sql = "SELECT pt.Payment_type_id, pt.Payment_type_name, pt.type, pt.sequence, pc.* FROM user_payment_config AS pc RIGHT JOIN Payment_type AS pt ON pc.payment_type_id=pt.Payment_type_id WHERE pt.config_flag = 1 AND pt.type = 0 ORDER BY pt.sequence ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			expendList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expendList;
	}
	
	@Override
	public UserPaymentConfig findById(String paymentconfigId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		UserPaymentConfig userPaymentConfig = null;
        try {
        	userPaymentConfig = (UserPaymentConfig) session.get(UserPaymentConfig.class, paymentconfigId);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return userPaymentConfig;
	}
	
	@Override
	public void update(UserPaymentConfig userPaymentConfig) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(userPaymentConfig);
        session.flush();
        //session.close();
		
	}

	@Override
	public void delete(UserPaymentConfig userPaymentConfig) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(userPaymentConfig);
        session.flush();
        //session.close();
		
	}

	@Override
	public List<UserPaymentConfig> findAllByUser(String userId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List <UserPaymentConfig> allUser = null;
		try {
			String hqlUpdate = "select c From UserPaymentConfig c where c.userId = :userId";
			allUser = session.createQuery( hqlUpdate )
					.setParameter("userId", userId)
					.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allUser;
	}

	@Override
	public UserPaymentConfig findByUsernPid(String userId, String paymenttypeId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		UserPaymentConfig userPayment = null;
		try {
			Criteria cr = session.createCriteria(UserPaymentConfig.class);
			cr.add(Restrictions.eq("paymentypeId", paymenttypeId));
			cr.add(Restrictions.eq("userId", userId));
			userPayment = (UserPaymentConfig) cr.list().get(0);
			System.out.println("HELLO");
		}
		catch (Exception e) {
			return null;
		}
		return userPayment;
	}
	




}