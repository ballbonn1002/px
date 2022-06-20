package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Pagemenu;


public interface PagemenuDAO {
    
    public void save(Pagemenu page_group) throws Exception;
    
    public List<Map<String, Object>> sequense() throws Exception;
    
    public List<Pagemenu> findAll() throws Exception;
    public List<Map<String, Object>> findAllList() throws Exception;
    
    public List<Pagemenu> findByPagemenuId(String pagemenuId) throws Exception;
    
    public Pagemenu findById(String id) throws Exception;
    
    public void update(Pagemenu page_group) throws Exception;
    
    public void delete(Pagemenu page_group) throws Exception;

	public List<Pagemenu> search(String pagemenuId) throws Exception;
}
