package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.UserPaymentConfig;

public interface UserPaymentConfigDAO {
    
    public void save(UserPaymentConfig userPaymentConfig) throws Exception;
    
    public List<UserPaymentConfig> findAll() throws Exception;
    public List<UserPaymentConfig> findIncome() throws Exception;
    public List<UserPaymentConfig> findExpend() throws Exception;
    
    public List<Map<String, Object>> sumIncomeById(String userId) throws Exception;
    public List<Map<String, Object>> sumExpendById(String userId) throws Exception;
    
    public UserPaymentConfig findById(String paymentconfigId  ) throws Exception;
    
    public void update(UserPaymentConfig userPaymentConfig) throws Exception;
    
    public void delete(UserPaymentConfig userPaymentConfig) throws Exception;
    
    public List<UserPaymentConfig> findAllByUser(String userId) throws Exception;
    
    public UserPaymentConfig findByUsernPid(String userId,String paymenttypeId) throws Exception;
    
}