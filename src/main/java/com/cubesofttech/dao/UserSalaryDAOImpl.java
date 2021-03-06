package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

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
	public List<Map<String, Object>> findSsi() throws Exception {
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
	public Map<String, Object> findSsiById(String uId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Map<String, Object> userSocialSecureById = null;
		try {
			String sql = "SELECT user.id,user.social_security,user.enable,user_salary.amount FROM user LEFT JOIN user_salary ON user.id = user_salary.user_id  WHERE user.enable=1 AND user.id = :uId ORDER BY id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("uId", uId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userSocialSecureById = (Map<String, Object>) query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userSocialSecureById;
	}

	@Override

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


	public List<UserSalary> findSalary(String user_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<UserSalary> List = null;
		try {
			String sql = "SELECT user_salary.user_id, user_salary.amount, user.withholding_auto FROM `user`  JOIN user_salary ON user_salary.user_id=user.id \r\n"
					+ "WHERE user_salary.user_id='"+user_id+"'";
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
	
	@Override
	public List<Map<String, Object>> findAllUserSalary() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userSalary = null;
		try {
			//String sql = "SELECT user.id,user.title_name_th,user.name,user.title_name_en,user.name_en,user.enable,user.social_security ,user_salary.user_salary_id,user_salary.amount,user_salary.date ,employee_type.name AS employee_type_name,employee_type.payment,employee_type.term,employee_type.term_day FROM user INNER JOIN user_salary ON user.id = user_salary.user_id INNER JOIN employee_type ON user.employee_type_id = employee_type.employee_type_id WHERE user.enable = 1 ORDER BY id ASC";
			String sql = "SELECT user.id FROM user WHERE user.enable = 1 ORDER BY id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userSalary = query.list();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userSalary;
	}

	@Override
	public List<Map<String, Object>> findUserSalaryByID(String userId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> userSalaryById = null;
		try {
			//String sql = "SELECT user.id,user.title_name_th,user.name,user.flag_search,user.role_id,user.employee_id,user.department_id,user.email,user.enable ,CONCAT(user.id), user.position_id,user.start_date,job_site.name_site FROM user LEFT JOIN job_site ON user.id_sitejob = job_site.id_sitejob WHERE flag_search = 1 ORDER BY id ASC";
			String sql = "SELECT user.id,user.title_name_th,user.name,user.title_name_en,user.name_en,user.enable,user.social_security ,user_salary.user_salary_id,user_salary.amount,user_salary.date ,employee_type.name AS employee_type_name,employee_type.payment,employee_type.term,employee_type.term_day FROM user INNER JOIN user_salary ON user.id = user_salary.user_id INNER JOIN employee_type ON user.employee_type_id = employee_type.employee_type_id WHERE user.enable = 1 AND user.id = '"+userId+"' ORDER BY id ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			userSalaryById = query.list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userSalaryById;
	}

	@Override
	public Map<String, Object> testTax(String user_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Map<String, Object> List = null;
		try {
			String sql = "SELECT user_salary.user_id, user_salary.amount, user.withholding_auto FROM `user`  JOIN user_salary ON user_salary.user_id=user.id \r\n"
					+ "WHERE user_salary.user_id='"+user_id+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List = (Map<String, Object>)query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}


}
