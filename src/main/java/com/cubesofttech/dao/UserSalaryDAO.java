package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.UserSalary;


public interface UserSalaryDAO {
	  	public void save(UserSalary userSalary) throws Exception;
	    
	    public List<UserSalary> findAll() throws Exception;
	    
	    public void update(UserSalary userSalary) throws Exception;
	    
	    public void delete(UserSalary userSalary) throws Exception;
	    
	    public List<Map<String, Object>> findSsi(String uId) throws Exception;
	    
	    public List<Map<String, Object>> findSsiById(String uId) throws Exception;

}


