package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Payment_group;

@Repository
public class Payment_groupDAOImpl implements Payment_groupDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
    public void save(Payment_group payment_group) throws Exception{
        Session session = this.sessionFactory.getCurrentSession();
        session.save(payment_group);
        session.flush();
        //session.close();
    }
	
	@Override
    public void update(Payment_group payment_group) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(payment_group);
        session.flush();
        //session.close();
    }
	
	@Override
    public void delete(Payment_group payment_group) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete( payment_group);
        session.flush();
        //session.close();
    }
	
	@Override
    public List<Payment_group> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_group> list = null;
		try {
			String sql = "SELECT * FROM payment_group";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
    

    @Override
    public Payment_group findById(Integer  Payment_group_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Payment_group payment_group = null;
        try {
        	payment_group = (Payment_group) session.get(Payment_group.class, Payment_group_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return payment_group;
    }

	@Override
	public List<Payment_group> listForReport() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_group> paymentGroupList = null;
		try {
			String sql = "SELECT payment_group.*,SUM(payment.total_pay) AS total_pay FROM payment_group JOIN payment ON\r\n"
					+ "payment_group.payment_group_id = payment.payment_group_id\r\n"
					+ "GROUP BY payment_group.payment_group_id;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentGroupList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentGroupList;
	}
	
	@Override
	public List<Map<String, Object>> findBonusByYear(String userId,String Year) throws Exception {
		List<Map<String, Object>> query_listMap = null;
		Session session =  this.sessionFactory.getCurrentSession(); 
		try {
			String sql = "SELECT payment.user_id , payment_detail.payment_type_id , EXTRACT(MONTH FROM payment_group.payment_date) AS payment_month , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year,payment_detail.amount FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query_listMap = query.list();
			Log.debug(query_listMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return query_listMap;
	}
	
	@Override
	public List<Map<String, Object>> findBonusByMultipleYear(String userId,List<String> listOfYear) throws Exception {
		List<Map<String, Object>> query_listMap = null;
		Session session =  this.sessionFactory.getCurrentSession(); 
		try {
			String sql = " "; 
	        for (int i = 0 ; i < listOfYear.size() ; i++) {
	        	sql += "SELECT payment.user_id , payment_detail.payment_type_id , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year , SUM(payment_detail.amount ) AS amount FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+listOfYear.get(i)+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id  GROUP BY payment_type_id ";
	        	if (i < listOfYear.size()-1 ) {
	        		sql += "UNION ";
	        	}
	        }
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query_listMap = query.list();
			Log.debug(query_listMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return query_listMap;
	}
	
	@Override
	public List<Map<String, Object>> findYear() throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> findYearSalary = null;
		try {
			String sql = "SELECT EXTRACT(YEAR FROM payment_group.payment_date) AS year FROM payment_group GROUP BY EXTRACT(YEAR FROM payment_group.payment_date)";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findYearSalary = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findYearSalary; 
	}
	
	@Override
	public List<Map<String, Object>> monthSalary(String mYear, String mDepart) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Map<String, Object>> findMonth = null;
		try {
			String sql = "SELECT payment_group.payment_group_id, payment_group.name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, EXTRACT(MONTH FROM payment_group.payment_date) AS month, SUM(payment.total_pay) AS sum_total_pay, user.position_id, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+mDepart+"' AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"' GROUP BY payment.payment_group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findMonth = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findMonth; 
	}

	@Override
	public List<Payment_group> testList(Integer payment_group_id) throws Exception {
		// TODO Auto-generated method stub
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Payment_group> findList = null;
		try {
			String sql = "SELECT payment_group.payment_group_id, payment_detail.* FROM `payment_detail` JOIN payment ON payment.payment_id = payment_detail.payment_id JOIN payment_group ON payment_group.payment_group_id = payment.payment_group_id WHERE payment.user_id ='test.data1' AND payment_group.payment_group_id="+payment_group_id+"";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findList; 
	}

	@Override
	public List<Payment_group> listConvert(Integer payment_group_id) throws Exception {
		// TODO Auto-generated method stub
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Payment_group> findList = null;
		try {
			String sql = "SELECT payment_detail.user_id, \r\n"
					+ "\r\n"
					+ " max(case when payment_detail.payment_type_id = 'SL'   then payment_detail.amount end) AS `SL`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'OT1'   then payment_detail.amount end) AS `OT1`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'OT2' then payment_detail.amount end) AS `OT2`,\r\n"
					+ "     max(case when payment_detail.payment_type_id = 'OT3'   then payment_detail.amount end) AS `OT3`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'VA'   then payment_detail.amount end) AS `VA`,\r\n"
					+ "     max(case when payment_detail.payment_type_id = 'TRAVEL'   then payment_detail.amount end) AS `TRAVEL`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'BONUS'   then payment_detail.amount end) AS `BONUS`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'EQUIPMENT' then payment_detail.amount end) AS `EQUIPMENT`,\r\n"
					+ "     max(case when payment_detail.payment_type_id = 'SSI'   then payment_detail.amount end) AS `SSI`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'TAX'   then payment_detail.amount end) AS `TAX`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'TISCO'   then payment_detail.amount end) AS `TISCO`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'LATE' then payment_detail.amount end) AS `LATE`,\r\n"
					+ "     max(case when payment_detail.payment_type_id = 'ABSENT'   then payment_detail.amount end) AS `ABSENT`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'ABSENCE'   then payment_detail.amount end) AS `ABSENCE`,\r\n"
					+ "    max(case when payment_detail.payment_type_id = 'StudentLoan'   then payment_detail.amount end) AS `StudentLoan`, "
					+ "    payment.income_net,\r\n"
					+ "    payment.expend_net,\r\n"
					+ "    payment.total_pay\r\n"
					+ "\r\n"
					+ "FROM payment_group \r\n"
					+ "LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id \r\n"
					+ "LEFT JOIN payment_detail ON payment_detail.payment_id = payment.payment_id \r\n"
					+ "LEFT JOIN payment_type ON payment_type.payment_type_id = payment_detail.payment_type_id \r\n"
					+ "WHERE payment_group.payment_group_id="+payment_group_id+"\r\n"
					+ "GROUP BY payment_detail.user_id;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findList; 
	}

	@Override
	public List<Payment_group> searchByDate(String startDate, String endDate) throws Exception {
		// TODO Auto-generated method stub
		Session session =  this.sessionFactory.getCurrentSession(); 
		List<Payment_group> findList = null;
		try {
			String sql = "SELECT * FROM `payment_group`WHERE start_date >= '"+startDate+"' AND end_date <= '"+endDate+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findList; 
	}

	@Override
	public List<Payment_group> listForReportById(Integer payment_group_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Payment_group> paymentGroupList = null;
		try {
			String sql = "SELECT payment_group.*,SUM(payment.total_pay) AS total_pay FROM payment_group \r\n"
					+ "JOIN payment ON payment_group.payment_group_id = payment.payment_group_id\r\n"
					+ "WHERE payment_group.payment_group_id="+payment_group_id+"\r\n"
					+ "GROUP BY payment_group.payment_group_id;	\r\n";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentGroupList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentGroupList;
	}

}
