package com.cubesofttech.dao;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Payment_type;


public interface Payment_typeDAO {

	 public void save(Payment_type payment_type) throws Exception;
	 
	 public List<Map<String, Object>> sequense() throws Exception;
	 public List<Payment_type> findAll() throws Exception;
	public List<Payment_type> findtype1() throws Exception;
	public List<Payment_type> findtype0() throws Exception;
	public List<Payment_type> findcount() throws Exception;
	
	 
	 public List<Map<String, Object>> findAllList() throws Exception;
	 
	 public List<Payment_type> findByPaymentTypeId(String paymentTypeId) throws Exception;
	 
	 public Payment_type findById(String Payment_type_id ) throws Exception;
	 
	 public void update(Payment_type payment_type) throws Exception;
	 
	    
	 public void delete(Payment_type payment_type) throws Exception;
	 
	 public List<Payment_type> search(String paymentTypeId) throws Exception;

}