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

import com.cubesofttech.model.Payment_type;

/**
 * @author Peerakit
 *
 */
@Repository
public class Payment_typeDAOImpl implements Payment_typeDAO{
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public void save(Payment_type payment_type) throws Exception{
        Session session = this.sessionFactory.getCurrentSession();
        session.save(payment_type);
        session.flush();
        //session.close();
    }

    @Override
    public List<Payment_type> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_type> paymentTypeList = null;
		try {
			String sql = "SELECT * FROM payment_type";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentTypeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentTypeList;
	}
    
    public List<Payment_type> findtype1() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_type> paymentTypeList01 = null;
		try {
			String sql = "SELECT* FROM `payment_type` WHERE type = '1' order by `sequence` ASC";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentTypeList01 = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentTypeList01;
	}
    
    
    public List<Payment_type> findtype0() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_type> paymentTypeList00 = null;
		try {
			String sql = "SELECT * FROM `payment_type` WHERE type = '0' order by `sequence` ASC" ;
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentTypeList00 = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentTypeList00;
	}
    public List<Payment_type> findcount() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_type> paymentTypeList = null;
		try {
			String sql = "SELECT sequence FROM `payment_type` order by `sequence` DESC LIMIT 1" ;
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentTypeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentTypeList;
	}
    
    @Override
    public List<Map<String, Object>> findAllList() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> paymentTypeList = null;
		try {
			String sql = "SELECT * FROM payment_type";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentTypeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentTypeList;
	}


    @Override
    public void update(Payment_type payment_type) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(payment_type);
        session.flush();
        //session.close();
    }
    
    @Override
    public void delete(Payment_type payment_type) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete( payment_type);
        session.flush();
        //session.close();
    }
    @Override
 	public List<Map<String, Object>> sequense() throws Exception {
 		Session session = this.sessionFactory.getCurrentSession();
 		List<Map<String, Object>> paymenttype_id = null;
 		try {
 			String sql = " SELECT Payment_type_id, CONCAT( Payment_type_id) FROM payment_type  ORDER BY Payment_type_id ASC  ";
 			SQLQuery query = session.createSQLQuery(sql);
 			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
 			paymenttype_id = query.list();
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return paymenttype_id;
 	}
    
	@Override
	public List<Payment_type> findByPaymentTypeId(String paymentTypeId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        List<Payment_type> list = null;
        try {
            
            Criteria cr = session.createCriteria(Payment_type.class);
            cr.add(Restrictions.eq("paymentTypeId", paymentTypeId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}
	
	 @Override
	    public Payment_type findById(String  Payment_type_id) throws Exception {
	        Session session = this.sessionFactory.getCurrentSession();
	        Payment_type payment_type = null;
	        try {
	        	payment_type = (Payment_type) session.get(Payment_type.class, Payment_type_id);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //session.close();
	        }        
	        return payment_type;
	    }
	 
	    @Override
		public List<Payment_type> search(String paymentTypeId) throws Exception {
			Session session = this.sessionFactory.getCurrentSession();
	        List<Payment_type> list = null;
	        try {
	            
	            Criteria cr = session.createCriteria(Payment_type.class);
	            cr.add(Restrictions.eq("paymentTypeId", paymentTypeId));
	            
	            list = cr.list();
	  
	        } catch (Exception e) {
	        	e.printStackTrace();
	        	return null;

	        } finally {

	        }
	        return list;
		}    

}