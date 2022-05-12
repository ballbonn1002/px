package com.cubesofttech.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.cubesofttech.model.WorkHours;

public interface WorkHoursDAO {
	
	public void save(WorkHours workHours) throws Exception;
	public List<Map<String, Object>> findAll() throws Exception;
	/*
	 * public List<Map<String, Object>> findworkmonthall(java.sql.Timestamp Datenow,
	 * java.sql.Timestamp DateBefore, String month, String year) throws Exception;
	 */	
	public List<Map<String, Object>> findworkmonthalll(Timestamp tstamp, Timestamp tstampbefore, String month, String year) throws Exception;
	List<Map<String, Object>> findUserWork(String userid, String month, String year) throws Exception;
	 
	
}
