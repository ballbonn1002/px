package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Employee_type;


public interface Employee_typeDAO {
    
    public void save(Employee_type employee_type) throws Exception;
    
    public List<Map<String, Object>> sequense() throws Exception;
    
    public List<Employee_type> findAll() throws Exception;
    public List<Map<String, Object>> findAllList() throws Exception;
    
    public List<Employee_type> findByEmployee_typeId(String EmployeeTypeId) throws Exception;
    
    public Employee_type findById(String employee_type_id ) throws Exception;
    
    public void update(Employee_type employee_type) throws Exception;
    
    public void delete(Employee_type employee_type) throws Exception;

	public List<Employee_type> search(String employee_type) throws Exception;
}
