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


import com.cubesofttech.model.PageGroup;

@Repository
public class PageGroupDAOImpl implements PageGroupDAO{
	
	 @Autowired
	 private SessionFactory sessionFactory;
	

	@Override
	public void save(PageGroup page_group) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.save(page_group);
        session.flush();
        //session.close();
		
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> page_group_id = null;
		try {
			String sql = " SELECT page_group_id, CONCAT(page_group_id) FROM page_group  ORDER BY page_group_id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			page_group_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page_group_id;
	}

	@Override
	public List<PageGroup> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<PageGroup> page_groupList = null;
		try {
			String sql = "SELECT * FROM page_group;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			page_groupList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page_groupList;
	}

	

	@Override
	public List<PageGroup> findByPageGroupId(String PageGroupId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<PageGroup> list = null;
        try {
            
            Criteria cr = session.createCriteria(PageGroup.class);
            cr.add(Restrictions.eq("page_groupId", PageGroupId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public PageGroup findById(String id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        PageGroup page_group = null;
        try {
            page_group = (PageGroup) session.get(PageGroup.class, id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return page_group;
	}

	@Override
	public void update(PageGroup page_group) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(page_group);
        session.flush();
        //session.close();
	}

	@Override
	public void delete(PageGroup page_group) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(page_group);
        session.flush();
        //session.close();
	}

	@Override
	public List<PageGroup> search(String PageGroupId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<PageGroup> list = null;
        try {
            
            Criteria cr = session.createCriteria(PageGroup.class);
            cr.add(Restrictions.eq("page_groupId", PageGroupId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public List<PageGroup> findAllList() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<PageGroup> page_groupList = null;
		try {
			String sql = "SELECT * FROM page_group;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			page_groupList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page_groupList;
	}

}
