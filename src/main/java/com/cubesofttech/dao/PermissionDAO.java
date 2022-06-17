package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Permission;


public interface PermissionDAO {
	public void save(Permission permission) throws Exception;
    
    public List<Map<String, Object>> sequense() throws Exception;
    
    public List<Permission> findAll() throws Exception;
    public List<Map<String, Object>> findAllList() throws Exception;
    
    public List<Permission> findByPermissionId(String permissionId) throws Exception;
    
    public Permission findById(int permission_id) throws Exception;
    
    public void update(Permission permission) throws Exception;
    
    public void delete(Permission permission) throws Exception;

	public List<Permission> search(String permissionId) throws Exception;
	
	public List<Permission> insert(String sys_role_id) throws Exception;
	
	public List<Permission> updateBySysRoleId(String sys_role_id,String page_group_active,String page_active,String view,String create_update,String del_role,String approve) throws Exception;
	
	public List<Permission> listPerxPage(String sys_role_id) throws Exception;
	
	public List<Permission> findBySysRoleId(String sys_role_id) throws Exception;
	
	public List<Permission> testList(String sys_role_id) throws Exception;
	
	public List<Permission> updateStatus(String sys_role_id, String page_group_id, String page_group_active, String login_user);
}
