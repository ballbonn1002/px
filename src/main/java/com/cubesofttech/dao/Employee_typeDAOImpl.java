package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Employee_type;

/**
 * @author Peerakit
 *
 */
@Repository
public class Employee_typeDAOImpl implements Employee_typeDAO{
    
    @Autowired
    private SessionFactory sessionFactory;
    
 
    @Override
    public void save(Employee_type employee_type) throws Exception{
        Session session = this.sessionFactory.getCurrentSession();
        session.save(employee_type);
        session.flush();
        //session.close();
    }

    @Override
    public List<Employee_type> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Employee_type> emptypeList = null;
		try {
			String sql = "SELECT * FROM employee_type";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			emptypeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emptypeList;
	}
    
    @Override
    public List<Map<String, Object>> findAllList() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> emptypeList = null;
		try {
			String sql = "SELECT * FROM department";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			emptypeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emptypeList;
	}



    @Override
    public void update(Employee_type employee_type) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(employee_type);
        session.flush();
        //session.close();
    }

    @Override
    public void delete(Employee_type employee_type) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(employee_type);
        session.flush();
        //session.close();
    }

    @Override
	public List<Map<String, Object>> sequense() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> employeetype_id = null;
		try {
			String sql = " SELECT employee_type_id, CONCAT(employee_type_id) FROM employee_type  ORDER BY id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			employeetype_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employeetype_id;
	}
    
    
	@Override
	public List<Employee_type> findByEmployee_typeId(int EmployeeTypeId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        List<Employee_type> list = null;
        try {
            
            Criteria cr = session.createCriteria(Employee_type.class);
            cr.add(Restrictions.eq("EmployeeTypeId",EmployeeTypeId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}
 
    @Override
    public Employee_type findById(int employee_type_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Employee_type employee_type = null;
        try {
            employee_type = (Employee_type) session.get(Employee_type.class, employee_type_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return employee_type;
    }
	
    @Override
	public List<Employee_type> search(String EmployeeTypeId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        List<Employee_type> list = null;
        try {
            
            Criteria cr = session.createCriteria(Employee_type.class);
            cr.add(Restrictions.eq("EmployeeTypeId", EmployeeTypeId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}
}
