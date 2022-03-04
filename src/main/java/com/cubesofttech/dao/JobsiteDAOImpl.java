package com.cubesofttech.dao;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.FAQ;
import com.cubesofttech.model.Jobsite;
@Repository
public class JobsiteDAOImpl implements JobsiteDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Map<String, Object>> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM job_site";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override
	public void save(Jobsite jobsite) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(jobsite);
		session.flush();

	}

	@Override
	public void update(Jobsite jobsite) throws Exception {
	
		Session session = this.sessionFactory.getCurrentSession();
		session.update(jobsite);
		session.flush();

	}

	@Override
	public void delete(Jobsite jobsite) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(jobsite);
		session.flush();

	}

	@Override
	public Jobsite findById(Integer id) throws Exception {

		Session session = this.sessionFactory.getCurrentSession();
		Jobsite jobsite = (Jobsite) session.get(Jobsite.class, id);

		return jobsite;
	}
	@Override
	public List<Map<String, Object>> findAll2() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT  user.*,job_site.name_site FROM user LEFT JOIN job_site ON user.id_sitejob = job_site.id_sitejob";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override
	public List<Map<String, Object>> findAll3() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM job_site";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
	@Override
	public List<Map<String, Object>> findAllbyid(Integer id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> faqJoin = null;
		try {
			String sql = "SELECT * FROM job_site WHERE id_sitejob =:id ";

			// System.out.println("SQL: " + sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			faqJoin = query.list();
		} catch (Exception e) {
			// Log.debug("Method findAll in [FaqDAOImpl] Error!");
			e.printStackTrace();
		}
		return faqJoin;

	}
}
