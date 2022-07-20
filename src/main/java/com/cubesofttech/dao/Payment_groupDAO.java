package com.cubesofttech.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;

import com.cubesofttech.model.Payment_group;


public interface Payment_groupDAO {

	 public void save(Payment_group payment_group) throws Exception;
	 
	 public void update(Payment_group payment_group) throws Exception;
	    
	 public void delete(Payment_group payment_group) throws Exception;
	 
	 Integer getMaxId() throws Exception;

	 public List<Payment_group> findAll() throws Exception;
	 
	 public Payment_group findById(Integer Payment_group_id ) throws Exception;
	 
	 public List<Payment_group> listForReport() throws Exception;
	 
	public List<Map<String, Object>> findAndSumBonusByYear(String userId,String Year) throws Exception;
	
	public List<Map<String, Object>> findAndSumBonusByMultipleYear(String userId,List<String> listOfYear) throws Exception;
	
	public List<Map<String, Object>> findYear() throws Exception;
	
	public List<Map<String, Object>> multiSalaryMonth(String mYear, String mDepart) throws Exception;
	
	public List<Map<String, Object>> multiSalaryYear(String mYear, String mDepart) throws Exception;
	
	public List<Map<String, Object>> getMonthStatic(String mYear, String mDepart) throws Exception;
	
	public List<Payment_group> testList(Integer payment_group_id) throws Exception;
	
	public List<Payment_group> listConvert(Integer payment_group_id) throws Exception;

	public List<Payment_group> searchByDate(String startDate,String endDate) throws Exception;
	
	public List<Payment_group> listForReportById(Integer payment_group_id) throws Exception;
	
	public JSONArray paymentStatistics(String year) throws Exception;
}