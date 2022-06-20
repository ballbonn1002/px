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
import com.cubesofttech.model.Pagemenu;
@Repository
	public class PagemenuDAOImpl implements PagemenuDAO{

@Autowired
  private SessionFactory sessionFactory;

	@Override
	public void save(Pagemenu page_group) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.save(page_group);
        session.flush();
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> pagemenu_id = null;
		try {
			String sql = " SELECT id, CONCAT(id) FROM page_group  ORDER BY id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pagemenu_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pagemenu_id;
	}

	@Override
    public List<Pagemenu> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Pagemenu> pagemenuList = null;
		try {
			String sql = "SELECT * FROM page_group" ;  
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pagemenuList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pagemenuList;
	}

	@Override
	public List<Map<String, Object>> findAllList() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> pagemenuList = null;
		try {
			String sql = "SELECT * FROM page_group";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pagemenuList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pagemenuList;
	}

	@Override
	public List<Pagemenu> findByPagemenuId(String pagemenuId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        List<Pagemenu> list = null;
        try {
            
            Criteria cr = session.createCriteria(Pagemenu.class);
            cr.add(Restrictions.eq("pagemenuId", pagemenuId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public Pagemenu findById(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        Pagemenu page_group = null;
        try {
            page_group = (Pagemenu) session.get(Pagemenu.class, id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return page_group;
	}

	@Override
	public void update(Pagemenu page_group) throws Exception {
		 Session session = this.sessionFactory.getCurrentSession();
	        session.clear();
	        session.update(page_group);
	        session.flush();
		
	}

	@Override
	public void delete(Pagemenu page_group) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(page_group);
        session.flush();
		
	}

	@Override
	public List<Pagemenu> search(String pagemenuId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        List<Pagemenu> list = null;
        try {
            
            Criteria cr = session.createCriteria(Pagemenu.class);
            cr.add(Restrictions.eq("pagemenuId", pagemenuId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

}
