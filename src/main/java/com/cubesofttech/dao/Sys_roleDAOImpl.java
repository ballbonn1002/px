package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Department;
import com.cubesofttech.model.Sys_role;

@Repository
public class Sys_roleDAOImpl implements Sys_roleDAO{
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(Sys_role sys_role) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.save(sys_role);
        session.flush();
		
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> sys_role_id = null;
		try {
			String sql = " SELECT sys_role_id, CONCAT(sys_role_id) FROM sys_role  ORDER BY sys_role_id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			sys_role_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sys_role_id;
	}

	@Override
	public List<Sys_role> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Sys_role> sys_roleList = null;
		try {
			String sql = "SELECT * FROM sys_role";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			sys_roleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sys_roleList;
	}

	@Override
	public List<Map<String, Object>> findAllList() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> sys_roleList = null;
		try {
			String sql = "SELECT * FROM sys_role";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			sys_roleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sys_roleList;
	}

	@Override
	public List<Sys_role> findBySys_roleId(String sys_roleId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Sys_role> list = null;
        try {
            
            Criteria cr = session.createCriteria(Sys_role.class);
            cr.add(Restrictions.eq("sys_roleId", sys_roleId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public Sys_role findById(int sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		 Session session = this.sessionFactory.getCurrentSession();
	        Sys_role sys_role = null;
	        try {
	            sys_role = (Sys_role) session.get(Sys_role.class, sys_role_id);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //session.close();
	        }        
	        return sys_role;
	}

	@Override
	public void update(Sys_role sys_role) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(sys_role);
        session.flush();
        //session.close();
	}

	@Override
	public void delete(Sys_role sys_role) throws Exception {
		// TODO Auto-generated method stub
		 Session session = this.sessionFactory.getCurrentSession();
	        session.delete(sys_role);
	        session.flush();
	        //session.close();
	}

	@Override
	public List<Sys_role> search(String sys_roleId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Sys_role> list = null;
        try {
            
            Criteria cr = session.createCriteria(Sys_role.class);
            cr.add(Restrictions.eq("sys_roleId", sys_roleId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public List<Sys_role> findByName(String name) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Sys_role> sys_roleList = null;
		try {
			String sql = "SELECT * FROM sys_role WHERE name='"+name+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			sys_roleList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sys_roleList;
	}

	
}
