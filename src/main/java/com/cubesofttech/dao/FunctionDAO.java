package com.cubesofttech.dao;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserSalary;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Holiday;
import com.cubesofttech.model.Leaves;
import com.cubesofttech.model.WorkHours;
import com.cubesofttech.model.LeaveType;

public interface FunctionDAO {
  
	public List<Map<String, Object>> findWorkingList(String userId,String startDate,String endDate) throws Exception;
	
	public List<Map<String, Object>> findWorkingSummary(String userId,String startDate,String endDate) throws Exception;
		
}
