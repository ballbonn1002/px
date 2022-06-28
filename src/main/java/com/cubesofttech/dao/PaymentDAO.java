package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Payment;


public interface PaymentDAO {
	
	public void save(Payment payment) throws Exception;

    public List<Payment> findAll() throws Exception;

    public void update(Payment payment) throws Exception;

    public void delete(Payment payment) throws Exception;
    
    public List<Map<String, Object>> findAllByGroupId() throws Exception;
    
    public List<Map<String, Object>> countStatus() throws Exception;

}
