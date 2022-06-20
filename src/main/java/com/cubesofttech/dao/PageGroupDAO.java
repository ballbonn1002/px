package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;


import com.cubesofttech.model.PageGroup;

public interface PageGroupDAO {
	 public void save(PageGroup page_group) throws Exception;
	    
	    public List<Map<String, Object>> sequense() throws Exception;
	    
	    public List<PageGroup> findAll() throws Exception;
	    
	    public List<PageGroup> findAllList() throws Exception;
	    
	    public List<PageGroup> findByPageGroupId(String PageGroupId) throws Exception;
	    
	    public PageGroup findById(String id) throws Exception;
	    
	    public void update(PageGroup page_group) throws Exception;
	    
	    public void delete(PageGroup page_group) throws Exception;

		public List<PageGroup> search(String PageGroupId) throws Exception;
		
		

}
