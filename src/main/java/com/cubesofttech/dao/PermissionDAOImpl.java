package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Page;
import com.cubesofttech.model.Permission;


@Repository
public class PermissionDAOImpl implements PermissionDAO{
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.save(permission);
        session.flush();
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> permission_id = null;
		try {
			String sql = " SELECT permission_id, CONCAT(permission_id) FROM permission  ORDER BY permission_id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permission_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permission_id;
	}

	@Override
	public List<Permission> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "SELECT * FROM permission";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Map<String, Object>> findAllList() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> permissionList = null;
		try {
			String sql = "SELECT * FROM permission";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> findByPermissionId(String permissionId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Permission> list = null;
        try {
            
            Criteria cr = session.createCriteria(Permission.class);
            cr.add(Restrictions.eq("permissionId", permissionId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public Permission findById(int permission_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        Permission permission = null;
        try {
            permission = (Permission) session.get(Permission.class, permission_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return permission;
	}

	@Override
	public void update(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(permission);
        session.flush();
	}

	@Override
	public void delete(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(permission);
        session.flush();
        //session.close();
	}

	@Override
	public List<Permission> search(String permissionId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Permission> list = null;
        try {
            
            Criteria cr = session.createCriteria(Permission.class);
            cr.add(Restrictions.eq("permissionId", permissionId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public List<Permission> insert(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		//String sys = sys_role_id;
		try {
			
			String sql= 	"INSERT INTO permission (page_id, page_name, sys_role_id, user_create, user_update, time_create, time_update) "
							+"SELECT p.page_id, p.page_name, s.sys_role_id, s.user_create, s.user_update, s.time_create, s.time_update "
							+"FROM sys_role s, page p WHERE s.sys_role_id= "+sys_role_id+"";


					
					
			SQLQuery query = session.createSQLQuery(sql);
			//query.setParameter("sys_role_id", sys_role_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
			Log.debug(e);
		}
		return permissionList;
	}

	@Override
	public List<Permission> updateBySysRoleId(String sys_role_id, String page_group_active, String page_active,
			String view, String create_update, String del_role, String approve) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> perList = null;
		//String sys = sys_role_id;
		try {
			
			String sql= 	"UPDATE permission SET page_group_active='"+page_group_active+"',page_active='"+page_active+"',view='"+view+"' "
							+",create_update='"+create_update+"',delete_role='"+del_role+"',approve='"+approve+"' "
							+" WHERE sys_role_id= "+sys_role_id+"";


					
					
			SQLQuery query = session.createSQLQuery(sql);
			//query.setParameter("sys_role_id", sys_role_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
			Log.debug(e);
		}
		return perList;
	}

	@Override
	public List<Permission> listPerxPage(String sys_role_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "Select permission.*, page.page_group_id, page.is_active, page.check_view, page.check_create_update, page.check_delete, page.check_approve "
					+ "from permission JOIN page ON permission.page_id = page.page_id WHERE permission.sys_role_id="+sys_role_id+";";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> findBySysRoleId(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "SELECT * FROM permission WHERE sys_role_id="+sys_role_id+"";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> testList(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "Select permission.permission_id, permission.sys_role_id, permission.page_group_active, page.page_group_id, page_group.group_name, page.page_name, page_group.is_active AS PG_is_active "
					+ "from permission JOIN page ON permission.page_id = page.page_id "
					+ "JOIN page_group ON page_group.page_group_id=page.page_group_id WHERE permission.sys_role_id="+sys_role_id+" GROUP BY page_group.page_group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> updateStatus(String sys_role_id, String page_group_id, String page_group_active,
			String login_user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "UPDATE permission, page \r\n"
					+ "	 SET permission.page_group_active = '"+page_group_active+"',permission.user_update = '"+login_user+"' \r\n"
					+ "                        \r\n"
					+ "	 WHERE permission.page_id = page.page_id \r\n"
					+ "	 AND page.page_group_id='"+page_group_id+"'\r\n"
					+ "	 AND permission.sys_role_id='"+sys_role_id+"';";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	

	
	
	

	
}
	

