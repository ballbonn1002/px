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
import com.cubesofttech.model.Sysuser;

@Repository
public class SysuserDAOImpl implements SysuserDAO{
@Autowired
	private SessionFactory sessionFactory;

@Override
public void save(Sysuser sysuser) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
    session.save(sysuser);
    session.flush();
}

@Override
public List<Map<String, Object>> sequense() throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	List<Map<String, Object>> sysuser_id = null;
	try {
		String sql = " SELECT sys_user_id, CONCAT(sys_user_id) FROM sys_user  ORDER BY sys_user_id;  ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		sysuser_id = query.list();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return sysuser_id;
}

@Override
public List<Sysuser> findAll() throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	List<Sysuser> sysuserList = null;
	try {
		String sql = "SELECT * FROM sys_user" ;  
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		sysuserList = query.list();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return sysuserList;
}

@Override
public List<Map<String, Object>> findAllList() throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	List<Map<String, Object>> sysuserList = null;
	try {
		String sql = "SELECT * FROM sys_user";
		SQLQuery query = session.createSQLQuery(sql);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		sysuserList = query.list();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return sysuserList;
}

@Override
public List<Sysuser> findBySysuserId(String sysuserId) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
    List<Sysuser> list = null;
    try {
        
        Criteria cr = session.createCriteria(Sysuser.class);
        cr.add(Restrictions.eq("sysuserId", sysuserId));
        
        list = cr.list();

    } catch (Exception e) {
    	e.printStackTrace();
    	return null;

    } finally {

    }
    return list;
}

@Override
public Sysuser findById(String id) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
    Sysuser sysuser = null;

    try {
        sysuser = (Sysuser) session.get(Sysuser.class, id);
    } catch (Exception e) {
        //e.printStackTrace();
    }finally{
        //session.close();
    }        
    return sysuser;
}

@Override
public void update(Sysuser sysuser) throws Exception {
	 Session session = this.sessionFactory.getCurrentSession();
     session.clear();
     session.update(sysuser);
     session.flush();
}

@Override
public void delete(Sysuser sysuser) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
    session.delete(sysuser);
    session.flush();
}

@Override
public List<Sysuser> search(String sysuserId) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
    List<Sysuser> list = null;
    try {
        
        Criteria cr = session.createCriteria(Sysuser.class);
        cr.add(Restrictions.eq("sysuserId", sysuserId));
        
        list = cr.list();

    } catch (Exception e) {
    	e.printStackTrace();
    	return null;

    } finally {

    }
    return list;
	}

@Override
public List<Map<String, Object>> findById2(String id) throws Exception {
	Session session = this.sessionFactory.getCurrentSession();
	List id1 = null;
	try {
		String sql = " SELECT * FROM sys_user WHERE sys_user_id = :id ";
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("id", id);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		id1 = query.list();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return id1;

}
}
