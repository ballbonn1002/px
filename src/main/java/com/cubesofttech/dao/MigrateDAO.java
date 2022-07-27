package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Department;
import com.cubesofttech.model.Employee_type;
import com.cubesofttech.model.Migrate;
import com.cubesofttech.model.Migrate_detail;

public interface MigrateDAO { 
	public int save(Migrate migrate) throws Exception;
	public void saveDetail(List<Migrate_detail> migrateDetail,int id) throws Exception;
	public List<Migrate> getMigrateList(Boolean showMore) throws Exception;
	public String migrateData(String action,String userId) throws Exception;
}
