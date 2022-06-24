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
	
	

}
