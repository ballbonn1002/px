package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Page;

public interface PageDAO {
	public void save(Page page) throws Exception;
    
    public List<Map<String, Object>> sequense() throws Exception;
    
    public List<Page> findAll() throws Exception;
    public List<Map<String, Object>> findAllList() throws Exception;
    
    public List<Page> findByPageId(String PageId) throws Exception;
    
    public Page findById(String page_id) throws Exception;
    
    public void update(Page page) throws Exception;
    
    public void delete(Page page) throws Exception;

	public List<Page> search(String PageId) throws Exception;
	
	public List<Page> listPerxPage(String sys_role_id) throws Exception;


}
