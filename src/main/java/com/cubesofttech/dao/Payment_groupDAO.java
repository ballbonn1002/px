package com.cubesofttech.dao;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Payment_group;


public interface Payment_groupDAO {

	 public void save(Payment_group payment_group) throws Exception;
	 
	 public void update(Payment_group payment_group) throws Exception;
	    
	 public void delete(Payment_group payment_group) throws Exception;

	 public List<Payment_group> findAll() throws Exception;
	 
	 public Payment_group findById(String Payment_group_id ) throws Exception;
	 

}