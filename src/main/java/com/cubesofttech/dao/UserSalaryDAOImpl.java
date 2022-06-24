package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.UserSalary;

@Repository
public class UserSalaryDAOImpl implements UserSalaryDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(UserSalary userSalary) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.save(userSalary);
		session.flush();
		
	}

	@Override
	public List<UserSalary> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserSalary> userSalary = null;
		try {
			userSalary = session.createCriteria(UserSalary.class).list();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userSalary;
		}

	@Override
	public void update(UserSalary userSalary) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(userSalary);
		session.flush();
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(UserSalary userSalary) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(userSalary);
		session.flush();
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Map<String, Object>> findSsi(String uId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userSocialSecure = null;
		try {
			String sql = "SELECT * FROM user WHERE user.enable=1 ORDER BY id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userSocialSecure = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userSocialSecure;
	}
	
	@Override
	public List<Map<String, Object>> findSsiById(String uId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userSocialSecureById = null;
		try {
			String sql = "SELECT user.id,user.social_security,user.enable,user_salary.amount FROM user LEFT JOIN user_salary ON user.id = user_salary.user_id  WHERE user.enable=1 AND user.id = '"+uId+"' ORDER BY id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userSocialSecureById = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userSocialSecureById;
	}

}
