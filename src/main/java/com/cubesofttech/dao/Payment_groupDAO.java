package com.cubesofttech.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Payment_group;


public interface Payment_groupDAO {

	 public void save(Payment_group payment_group) throws Exception;
	 
	 public void update(Payment_group payment_group) throws Exception;
	    
	 public void delete(Payment_group payment_group) throws Exception;

	 public List<Payment_group> findAll() throws Exception;
	 
	 public Payment_group findById(Integer Payment_group_id ) throws Exception;
	 
	 public List<Payment_group> listForReport() throws Exception;
	 
	public List<Map<String, Object>> findBonusByYear(String userId,String Year) throws Exception;
	
	public List<Map<String, Object>> findBonusByMultipleYear(String userId,List<String> listOfYear) throws Exception;
	
	public List<Map<String, Object>> findYear() throws Exception;
	
	public List<Map<String, Object>> monthSalary(String mYear, String mDepart) throws Exception;

}