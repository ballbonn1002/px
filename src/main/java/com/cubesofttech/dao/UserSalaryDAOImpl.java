package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

<<<<<<< HEAD
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
=======
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
>>>>>>> 3664aca851ce5d357eb68e3a6215cd7ed9271381
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Sys_role;
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
<<<<<<< HEAD
	public List<UserSalary> findByUserId(String user_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserSalary> results = null;
		try {
			Criteria cr = session.createCriteria(UserSalary.class);
			cr.add(Restrictions.eq("user_id", user_id));
			results = cr.list();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return results;
	}

	@Override
	public void updateUserSalary(UserSalary userSalary) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		try {
		//Transaction tx = session.beginTransaction();
		String hqlUpdate = "update UserSalary c set c.amount= :newAmount , c.date= :newDate , c.description= :newDescription , c.user_update = :newUser_update , c.time_update = :newTime_update where c.user_id = :User_id";
		// or String hqlUpdate = "update Customer set name = :newName where name = :oldName";
		int updatedEntities = session.createQuery( hqlUpdate )
				.setParameter("newAmount", userSalary.getAmount())
				.setParameter("newDate", userSalary.getDate())
				.setParameter("newDescription", userSalary.getDescription())
				.setParameter("newUser_update", userSalary.getUser_update())
				.setParameter("newTime_update", userSalary.getTime_update())
				.setParameter("User_id", userSalary.getUser_id())
		        .executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//tx.commit();
		
		
	}
	
	
=======
	public List<UserSalary> findSalary(String user_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<UserSalary> List = null;
		try {
			String sql = "SELECT user_salary.user_id, user_salary.amount, user.withholding_auto FROM `user_salary`  JOIN user ON user_salary.user_id=user.id WHERE user_salary.user_id='"+user_id+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}

	@Override
	public List<UserSalary> findAllList() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<UserSalary> List = null;
		try {
			String sql = "SELECT user_id, amount, withholding_auto FROM `user_salary` LEFT JOIN user ON user_salary.user_id=user.id ;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}

	@Override
	public UserSalary findById(String user_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        UserSalary usersalary = null;
        try {
        	usersalary = (UserSalary) session.get(UserSalary.class, user_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return usersalary;
	}
>>>>>>> 3664aca851ce5d357eb68e3a6215cd7ed9271381

}
