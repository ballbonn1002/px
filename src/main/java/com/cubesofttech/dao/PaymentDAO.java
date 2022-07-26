package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Payment;


public interface PaymentDAO {
	
	public void save(Payment payment) throws Exception;

    public List<Payment> findAll() throws Exception;

    public void update(Payment payment) throws Exception;

    public void delete(Payment payment) throws Exception;
    
    Integer getMaxId() throws Exception;
    
    public List<Map<String, Object>> findAllByGroupId() throws Exception;
    
    public List<Map<String, Object>> countStatus() throws Exception;
    
    public long dashboardEmpTypeMonth(String EmpId, String month, String year) throws Exception;
    public long dashboardEmpTypeYear(String EmpId, String year) throws Exception;
    
    public Payment findById(Integer payment_id) throws Exception;
    
    public List<Map<String, Object>> getPaymentTable(int paymentGroupId) throws Exception;
    
    
    public List<Payment> findAllByGroupId(String paymentGroupId) throws Exception;
    
    public List<Map<String, Object>> getStatusByGroupId(String paymentGroupId) throws Exception;
    public List<Map<String, Object>> getTotalPayByGroupId(String paymentGroupId) throws Exception;
    
    public Map<String, Object> getRemarkByDatenUserId(int month,int year, String userId) throws Exception;

}
