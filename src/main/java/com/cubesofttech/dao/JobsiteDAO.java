package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Jobsite;

public interface JobsiteDAO {
	public List<Map<String, Object>> findAll() throws Exception;
	public void save(Jobsite jobsite) throws Exception;
	public void update(Jobsite jobsite) throws Exception;
	public void delete(Jobsite jobsite) throws Exception;
	public Jobsite findById(Integer id) throws Exception;
	public List<Map<String, Object>> findAll2() throws Exception;
	public List<Map<String, Object>> findAll3() throws Exception;
	public List<Map<String, Object>> findAllbyid(Integer id) throws Exception;
}
