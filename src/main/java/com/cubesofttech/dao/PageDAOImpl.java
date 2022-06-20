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

import com.cubesofttech.model.Page;



@Repository
public class PageDAOImpl implements PageDAO{
	
	@Autowired
	 private SessionFactory sessionFactory;

	@Override
	public void save(Page page) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.save(page);
        session.flush();
		
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> page_id = null;
		try {
			String sql = " SELECT page_id, CONCAT(page_id) FROM page  ORDER BY page_id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			page_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page_id;
	}

	@Override
	public List<Page> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Page> pageList = null;
		try {
			String sql = "SELECT * FROM page";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pageList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	@Override
	public List<Map<String, Object>> findAllList() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> pageList = null;
		try {
			String sql = "SELECT * FROM page";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pageList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}

	@Override
	public List<Page> findByPageId(String PageId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Page> list = null;
        try {
            
            Criteria cr = session.createCriteria(Page.class);
            cr.add(Restrictions.eq("pageId", PageId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public Page findById(String page_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        Page page = null;
        try {
            page = (Page) session.get(Page.class, page_id);
            System.out.println(page);
            
        } catch (Exception e) {
            e.printStackTrace();
        }       
        return page;
	}

	@Override
	public void update(Page page) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(page);
        session.flush();
	}

	@Override
	public void delete(Page page) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.delete(page);
        session.flush();
	}

	@Override
	public List<Page> search(String PageId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Page> list = null;
        try {
            
            Criteria cr = session.createCriteria(Page.class);
            cr.add(Restrictions.eq("pageId", PageId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public List<Page> listPerxPage(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Page> pageList = null;
		try {
			String sql = "Select permission.*, page.page_group_id, page.is_active, page.check_view, page.check_create_update, page.check_delete, page.check_approve "
					+ "from permission JOIN page ON permission.page_id = page.page_id WHERE permission.sys_role_id="+sys_role_id+";";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			pageList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageList;
	}
	

}
