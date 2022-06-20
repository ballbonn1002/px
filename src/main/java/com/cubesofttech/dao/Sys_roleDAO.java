package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Sys_role;


public interface Sys_roleDAO {
    
    public void save(Sys_role sys_role) throws Exception;
    
    public List<Map<String, Object>> sequense() throws Exception;
    
    public List<Sys_role> findAll() throws Exception;
    public List<Map<String, Object>> findAllList() throws Exception;
    
    public List<Sys_role> findBySys_roleId(String sys_roleId) throws Exception;
    
    public Sys_role findById(int sys_role_id) throws Exception;
    
    public void update(Sys_role sys_role) throws Exception;
    
    public void delete(Sys_role sys_role) throws Exception;

	public List<Sys_role> search(String sys_roleId) throws Exception;
	
	public List<Sys_role> findByName(String name) throws Exception;
}
