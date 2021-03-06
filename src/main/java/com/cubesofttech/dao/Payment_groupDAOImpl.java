package com.cubesofttech.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.action.PaymentTypeAction;
import com.cubesofttech.model.Payment_group;

@Repository
public class Payment_groupDAOImpl implements Payment_groupDAO{
	private static final Logger log = Logger.getLogger(PaymentTypeAction.class);
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
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Payment_group.class).setProjection(Projections.max("id"));
			maxId = (Integer) criteria.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			return new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else {
			return new Integer(0);
		}
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
	public List<Map<String, Object>> findAndSumBonusByYear(String userId,String Year) throws Exception {
		List<Map<String, Object>> query_listMap = null;
		Session session =  this.sessionFactory.getCurrentSession();
		try {
			String sql = "SELECT payment.user_id , payment_detail.payment_type_id , EXTRACT(MONTH FROM payment_group.payment_date) AS payment_month , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year,payment_detail.amount FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id";
			String sum_sql = " UNION SELECT payment.user_id , 'SUM0' AS payment_type_id , EXTRACT(MONTH FROM payment_group.payment_date) AS payment_month , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year, SUM(payment_detail.amount) AS amount"
							+ " FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"
							+ " AND payment_detail.payment_type_id IN ('OT1','OT2','OT3','VA','TRAVEL','BONUS','EQUIPMENT')"
							+ " GROUP BY payment_month"
							+ " UNION"
							+ " SELECT payment.user_id ,'SUM1' AS payment_type_id  , EXTRACT(MONTH FROM payment_group.payment_date) AS payment_month , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year, SUM(payment_detail.amount) AS amount"
							+ " FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"
							+ " AND payment_detail.payment_type_id IN ('SSI','TAX','TISCO','LATE','ABSENT','ABSENCE','StudentLoan')"
							+ " GROUP BY payment_month";
			sql = sql + sum_sql;

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
	public List<Map<String, Object>> findAndSumBonusByMultipleYear(String userId,List<String> listOfYear) throws Exception {
		List<Map<String, Object>> query_listMap = null;
		Session session =  this.sessionFactory.getCurrentSession();
		try {
			String sql = "";
	        for (int i = 0 ; i < listOfYear.size() ; i++) {
	        	sql += "SELECT payment.user_id , payment_detail.payment_type_id , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year , SUM(payment_detail.amount ) AS amount FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+listOfYear.get(i)+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id  GROUP BY payment_type_id";
	        	String sum_sql = " UNION SELECT payment.user_id , 'SUM0' AS payment_type_id , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year, SUM(payment_detail.amount) AS amount"
			        			+ " FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+listOfYear.get(i)+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"
			        			+ " AND payment_detail.payment_type_id IN ('OT1','OT2','OT3','VA','TRAVEL','BONUS','EQUIPMENT')"
			        			+ " GROUP BY payment_year"
			        			+ " UNION"
			        			+ " SELECT payment.user_id ,'SUM1' AS payment_type_id , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year, SUM(payment_detail.amount) AS amount"
			        			+ " FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+listOfYear.get(i)+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"
			        			+ " AND payment_detail.payment_type_id IN ('SSI','TAX','TISCO','LATE','ABSENT','ABSENCE','StudentLoan')"
			        			+ " GROUP BY payment_year ";
	        	sql = sql + sum_sql;

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


//	@Override
//	public List<Map<String, Object>> findSumBonusByYear(String userId,String Year) throws Exception {
//		List<Map<String, Object>> query_listMap = null;
//		Session session =  this.sessionFactory.getCurrentSession();
//		try {
//			String sql = "SELECT payment.user_id , 'SUM0' AS payment_type_id ,'Bouns' AS payment_type_name , EXTRACT(MONTH FROM payment_group.payment_date) AS payment_month , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year, SUM(payment_detail.amount) AS amount"
//					+ " FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"
//					+ " AND payment_detail.payment_type_id IN ('OT1','OT2','OT3','VA','TRAVEL','BONUS','EQUIPMENT')"
//					+ " GROUP BY payment_month"
//					+ " UNION"
//					+ " SELECT payment.user_id ,'SUM1' AS payment_type_id ,'Charge' AS payment_type_name , EXTRACT(MONTH FROM payment_group.payment_date) AS payment_month , EXTRACT(YEAR FROM payment_group.payment_date) AS payment_year, SUM(payment_detail.amount) AS amount"
//					+ " FROM payment JOIN payment_group ON payment.user_id = '"+userId+"' AND payment_group.payment_group_id = payment.payment_group_id AND payment_group.payment_date LIKE '"+Year+"%' JOIN payment_detail ON payment.payment_id = payment_detail.payment_id"
//					+ " AND payment_detail.payment_type_id IN ('SSI','TAX','TISCO','LATE','ABSENT','ABSENCE','StudentLoan')"
//					+ " GROUP BY payment_month";
//			SQLQuery query = session.createSQLQuery(sql);
//			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
//			query_listMap = query.list();
//			Log.debug(query_listMap);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return query_listMap;
//	}
//
//	@Override
//	public List<Map<String, Object>> findSumBonusByMultipleYear(String userId, List<String> listOfYear)
//			throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}

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
	public List<Map<String, Object>> multiSalaryMonth(String mYear, String mDepart) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> multiSelectMonth = null;
		try {
			String[] strArray = null;
			strArray = mDepart.split(",");

			String salary = "SELECT payment_group.payment_group_id, payment_group.name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, EXTRACT(MONTH FROM payment_group.payment_date) AS month, SUM(payment.total_pay) AS sum_total_pay, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"' LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArray[0]+"'";
			for (int i = 0; i< strArray.length; i++){
				salary += " OR department.department_id = '"+strArray[i]+"'";
			}
			salary += "GROUP BY month, year, user.department_id";

			String sum = " UNION ";
			sum += "SELECT payment_group.payment_group_id, 'sum_depart' AS name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, '13' AS month, SUM(payment.total_pay) AS sum_total_pay, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"' LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArray[0]+"'";
			for (int i = 0; i< strArray.length; i++){
				sum += " OR department.department_id = '"+strArray[i]+"'";
			}
			sum += "GROUP BY user.department_id";

			String sumAll = " UNION ";
			sumAll += "SELECT 'sumAll' AS payment_group_id, 'sum_all' AS name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, '13' AS month, SUM(payment.total_pay) AS sum_total_pay, 'sum' AS department_id\r\n"
					+ "FROM payment_group"
					+ " LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"'"
					+ "LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArray[0]+"'";
			for (int i = 0; i< strArray.length; i++){
				sumAll += " OR department.department_id = '"+strArray[i]+"'";
			}
			sumAll += "GROUP BY payment_group_id";

			String sumMonth = " UNION ";
			sumMonth += "SELECT payment_group.payment_group_id, 'Month' AS name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, EXTRACT(MONTH FROM payment_group.payment_date) AS month, SUM(payment.total_pay) AS sum_total_pay, 'sum' AS department_id \r\n"
					+ "FROM payment_group"
					+ " LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"'"
					+ "LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArray[0]+"'";
			for (int i = 0; i< strArray.length; i++){
				sumMonth += " OR department.department_id = '"+strArray[i]+"'";
			}
			sumMonth += "GROUP BY year, month";

			String sql = salary + sum + sumAll + sumMonth;
			//System.out.println(sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			multiSelectMonth = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return multiSelectMonth;
	}

	@Override
	public List<Map<String, Object>> multiSalaryYear(String mYear, String mDepart) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> multiSelectYear = null;
		try {
			String[] strArrayDepart = null;
			String[] strArrayYear = null;
			strArrayDepart = mDepart.split(",");
			strArrayYear = mYear.split(",");
			String sql = "";

			for(int i = 0; i < strArrayYear.length; i++) {
				String salary = "SELECT payment_group.payment_group_id, 'sum_depart' AS name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, 'sum_year' AS month, SUM(payment.total_pay) AS sum_total_pay, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+strArrayYear[i]+"' LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArrayDepart[0]+"'";
				for (int j = 0; j< strArrayDepart.length; j++){
					salary += " OR department.department_id = '"+strArrayDepart[j]+"'";
				}
				salary += "GROUP BY user.department_id UNION ";
				sql += salary;

			}
			for(int i = 0; i < strArrayYear.length; i++) {
				String sum = "SELECT 'sumAll' AS payment_group_id, 'sum_all' AS name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, 'sumAllDepartAndYear' AS month, SUM(payment.total_pay) AS sum_total_pay, 'sum' AS department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+strArrayYear[i]+"'  LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArrayDepart[0]+"'";
				for (int j = 0; j< strArrayDepart.length; j++){
					sum += " OR department.department_id = '"+strArrayDepart[j]+"'";
				}
				sum += "GROUP BY payment_group_id UNION ";
				sql += sum;

			}

			String sumAllYear = "SELECT table1.payment_group_id as payment_group_id, table1.name as name, table1.year as year, table1.month as month, SUM(table1.sum_total_pay) AS sum_total_pay, table1.department_id AS department_id FROM (";
			for(int i = 0; i < strArrayYear.length; i++) {
				sumAllYear += "SELECT 'sumAllYear' AS payment_group_id, 'sum_all_year' AS name, '9999' AS year, 'sumAllYear' AS month, SUM(payment.total_pay) AS sum_total_pay, user.department_id FROM payment_group INNER JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+strArrayYear[i]+"' INNER JOIN user ON payment.user_id = user.id INNER JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArrayDepart[0]+"'";
				for (int j = 0; j< strArrayDepart.length; j++){
					sumAllYear += " OR department.department_id = '"+strArrayDepart[j]+"'";
				}
				sumAllYear += "GROUP BY department.department_id UNION ";
			}
			sumAllYear = sumAllYear.substring(0,sumAllYear.length()-7);
			sumAllYear += ") AS table1 GROUP BY table1.department_id UNION ";


			String sumAll = "SELECT table1.payment_group_id as payment_group_id, table1.name as name, table1.year as year, table1.month as month, SUM(table1.sum_total_pay) AS sum_total_pay, table1.department_id AS department_id FROM (";
			for(int i = 0; i < strArrayYear.length; i++) {
				sumAll += "SELECT 'sumAll' AS payment_group_id, 'sum_all' AS name, '9999' AS year, 'sumAllDepartAndYear' AS month, SUM(payment.total_pay) AS sum_total_pay, 'sum' AS department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+strArrayYear[i]+"' LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArrayDepart[0]+"'";

				for (int j = 0; j< strArrayDepart.length; j++){
					sumAll += " OR department.department_id = '"+strArrayDepart[j]+"'";
				}
				sumAll += " UNION ";
			}
			sumAll = sumAll.substring(0,sumAll.length()-7);
			sumAll += ") AS table1 GROUP BY table1.department_id";
			//sumAll += "GROUP BY payment_group_id UNION ";


			sql = sql + sumAllYear + sumAll;

			//sql = sql.substring(0,sql.length()-6);
			//System.out.println(sql);
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			multiSelectYear = query.list();
			//System.out.println(query.list());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return multiSelectYear;
	}

	@Override
	public List<Map<String, Object>> getMonthStatic(String mYear, String mDepart) throws Exception {
		Session session =  this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> findMonthStatic = null;

		try {
			String[] strArray = null;
			strArray = mDepart.split(",");

			String sql = "SELECT payment_group.payment_group_id, payment_group.name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, EXTRACT(MONTH FROM payment_group.payment_date) AS month, SUM(payment.total_pay) AS sum_total_pay, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"' LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = '"+strArray[0]+"'";
			for (int i = 0; i< strArray.length; i++){
				sql += " OR department.department_id = '"+strArray[i]+"'";
			}
			sql += "GROUP BY month, year, user.department_id";

			//String sql = "SELECT payment_group.payment_group_id, payment_group.name, EXTRACT(YEAR FROM payment_group.payment_date) AS year, EXTRACT(MONTH FROM payment_group.payment_date) AS month, SUM(payment.total_pay) AS sum_total_pay, user.department_id FROM payment_group LEFT JOIN payment ON payment_group.payment_group_id = payment.payment_group_id AND EXTRACT(YEAR FROM payment_group.payment_date) = '"+mYear+"' LEFT JOIN user ON payment.user_id = user.id LEFT JOIN department ON department.department_id = user.department_id WHERE department.department_id = 'AE' OR department.department_id = 'AE' OR department.department_id = 'GP' OR department.department_id = 'HR' OR department.department_id = 'IN' OR department.department_id = 'IT' OR department.department_id = 'MA' OR department.department_id = 'MM' OR department.department_id = 'MS' OR department.department_id = 'OP' GROUP BY month, year, user.department_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			findMonthStatic = query.list();

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return findMonthStatic;
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

	@Override
	public JSONArray paymentStatistics(String year) throws Exception {
		List<String> List = new ArrayList<String>();
		List<Map<String, Object>>  query_listMap = null;
		JSONArray json_array = new JSONArray();
		Session session =  this.sessionFactory.getCurrentSession();
		try {
			if(year != "") {
			String sql = "select \r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '01' THEN payment.total_pay else 0 end),0) as 'Jan',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '02'  THEN payment.total_pay else 0 end),0) as 'Feb',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '03' THEN payment.total_pay else 0 end),0) as 'Mar',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '04' THEN payment.total_pay else 0 end),0) as 'Apr',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '05' THEN payment.total_pay else 0 end),0) as 'May',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '06' THEN payment.total_pay else 0 end),0) as 'Jun',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '07' THEN payment.total_pay else 0 end),0) as 'Jul',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '08' THEN payment.total_pay else 0 end),0) as 'Aug',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '09' THEN payment.total_pay else 0 end),0) as 'Sep',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '10' THEN payment.total_pay else 0 end),0) as 'Oct',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '11' THEN payment.total_pay else 0 end),0) as 'Nov',\r\n"
					+ "COALESCE(SUM(CASE WHEN month(payment_group.payment_date) = '12' THEN payment.total_pay else 0 end),0) as 'Dec'\r\n"
					+ "\r\n"
					+ "FROM payment_group \r\n"
					+ "JOIN payment on payment.payment_group_id = payment_group.payment_group_id \r\n"
					+ "WHERE year(payment_group.payment_date)='"+year+"';";	
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query_listMap = query.list();
			if(query_listMap == null || query_listMap.isEmpty()) {
			   for(int i = 0;i<12;i++) {
				   JSONArray array_cell = new JSONArray();
				   int set = 0;
				   array_cell.put(set);
				   json_array.put(array_cell);
			   }
			}else {
				Iterator itr = query_listMap.iterator();
				while(itr.hasNext()){
					List<String> monthList = Arrays.asList("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
					Map<String, Object> map  = (Map<String, Object>) itr.next();
					for(int i=0;i<monthList.size();i++) {
						JSONArray array_cell = new JSONArray();
						String smonth = monthList.get(i);
						Object value = map.get(smonth);
						array_cell.put(smonth);
					    array_cell.put(value);
					    json_array.put(array_cell);
					}
					
					}
			}
			}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return json_array;

	}

	@Override
	public List<BigDecimal> paymentchartIn(String year) throws Exception {
        List<String>  query_listMap = null;
        Session session =  this.sessionFactory.getCurrentSession(); 
        List<BigDecimal> List = new ArrayList<BigDecimal>();
        try {
        	List<String> monthList = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
            	for(int i=0; i<monthList.size(); i++) {
                String sql = "SELECT COALESCE(sum(payment.income_net),null) as income FROM payment_group "
                		+ "JOIN payment on payment.payment_group_id = payment_group.payment_group_id "
                		+ "WHERE month(payment_group.payment_date) = '"+monthList.get(i)+"' and year(payment_group.payment_date) = '"+year+"'";
                SQLQuery query = session.createSQLQuery(sql);
                query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
                query_listMap = query.list();
 
                    Iterator itr = query_listMap.iterator();
                    int j = 0;
                    while(itr.hasNext()){
                        Map<String, Object> map  = (Map<String, Object>) itr.next();
                        List.add((BigDecimal) map.get("income"));
                      j++;
                  }
           }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return List;
    }

	@Override
	public List<BigDecimal> paymentchartEx(String year) throws Exception {
        List<String>  query_listMap = null;
        Session session =  this.sessionFactory.getCurrentSession(); 
        List<BigDecimal> List = new ArrayList<BigDecimal>();
        try {
        	List<String> monthList = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
        	for(int i=0; i<monthList.size(); i++) {
        	String sql = "SELECT COALESCE(sum(payment.expend_net),null) as expend FROM payment_group "
            		+ "JOIN payment on payment.payment_group_id = payment_group.payment_group_id "
            		+ "WHERE month(payment_group.payment_date) = '"+monthList.get(i)+"' and year(payment_group.payment_date) = '"+year+"'";
                SQLQuery query = session.createSQLQuery(sql);
                query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
                query_listMap = query.list(); 
                
                    Iterator itr = query_listMap.iterator();
                    int j = 0;
                    while(itr.hasNext()){
                         Map<String, Object> map  = (Map<String, Object>) itr.next();
                          List.add((BigDecimal) map.get("expend"));
                        j++;
                   }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return List;
}

	@Override
	public JSONArray inDrilldowns(String year) throws Exception {
		List<Map<String, Object>>  query_listMap = null;
		JSONArray json_array = new JSONArray();
		JSONArray json_array1 = new JSONArray();
		Session session =  this.sessionFactory.getCurrentSession(); 
		try {
			List<String> monthList = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
			for(int i=0; i<monthList.size(); i++) {
			 String  sql = "select \r\n"
					+ "SUM(CASE WHEN payment_detail.payment_type_id = 'OT1' THEN payment_detail.amount else 0 end) as 'OT1'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'OT2' THEN payment_detail.amount else 0 end) as 'OT2'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'OT3' THEN payment_detail.amount else 0 end) as 'OT3'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'VA' THEN payment_detail.amount else 0 end) as 'VA'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'TRAVEL' THEN payment_detail.amount else 0 end) as 'TRAVEL'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'BONUS' THEN payment_detail.amount else 0 end) as 'BONUS'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'EQUIPMENT' THEN payment_detail.amount else 0 end) as 'EQUIPMENT'\r\n"
					+ "FROM payment_detail\r\n"
					+ "join payment on payment_detail.payment_id = payment.payment_id \r\n"
					+ "join payment_group  on payment.payment_group_id = payment_group.payment_group_id\r\n"
					+ "join payment_type  on payment_type.payment_type_id = payment_detail.payment_type_id "
			 		+ "WHERE month(payment_group.payment_date) = '"+monthList.get(i)+"'"
			 		+  "AND year(payment_group.payment_date) = '"+year+"'";
			 
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
				query_listMap = query.list();
				
				Iterator itr = query_listMap.iterator();
	            while(itr.hasNext()){
	            	json_array = new JSONArray(new ArrayList<String>());
	                List<String> idList = Arrays.asList("OT1","OT2","OT3","VA","TRAVEL","BONUS","EQUIPMENT");
	                Map<String, Object> map  = (Map<String, Object>) itr.next();
	                for(int j=0;j<idList.size();j++) {
	                    JSONArray array_cell = new JSONArray();
	                    String smonth = idList.get(j);
	                    Object value = map.get(smonth);
	                    array_cell.put(smonth);
	                    array_cell.put(value);
	                    json_array.put(array_cell);
	                }
	                json_array1.put(json_array);
                } 
			}
	} catch (Exception e) {
		e.printStackTrace();
	}	
	return json_array1;
	}

	@Override
	public JSONArray exDrilldowns(String year) throws Exception {
		List<Map<String, Object>>  query_listMap = null;
		JSONArray json_array = new JSONArray();
		JSONArray json_array1 = new JSONArray();
		Session session =  this.sessionFactory.getCurrentSession(); 
		try {
			List<String> monthList = Arrays.asList("01","02","03","04","05","06","07","08","09","10","11","12");
			for(int i=0; i<monthList.size(); i++) {
			 String  sql = "select \r\n"
					+ "SUM(CASE WHEN payment_detail.payment_type_id = 'SSI' THEN payment_detail.amount else 0 end) as 'SSI'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'TAX' THEN payment_detail.amount else 0 end) as 'TAX'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'TISCO' THEN payment_detail.amount else 0 end) as 'TISCO'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'LATE' THEN payment_detail.amount else 0 end) as 'LATE'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'ABSENT' THEN payment_detail.amount else 0 end) as 'ABSENT'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'ABSENCE' THEN payment_detail.amount else 0 end) as 'ABSENCE'\r\n"
					+ ",SUM(CASE WHEN payment_detail.payment_type_id = 'StudentLoan' THEN payment_detail.amount else 0 end) as 'StudentLoan'\r\n"
					+ "FROM payment_detail\r\n"
					+ "join payment on payment_detail.payment_id = payment.payment_id \r\n"
					+ "join payment_group  on payment.payment_group_id = payment_group.payment_group_id\r\n"
					+ "join payment_type  on payment_type.payment_type_id = payment_detail.payment_type_id "
			 		+ "WHERE month(payment_group.payment_date) = '"+monthList.get(i)+"'"
			 		+  "AND year(payment_group.payment_date) = '"+year+"'";
			 
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
				query_listMap = query.list();
				
				Iterator itr = query_listMap.iterator();
	            while(itr.hasNext()){
	            	json_array = new JSONArray(new ArrayList<String>());

	            	  List<String> idList = Arrays.asList("SSI","TAX","TISCO","LATE","ABSENT","ABSENCE","StudentLoan");
	                Map<String, Object> map  = (Map<String, Object>) itr.next();
	                for(int j=0;j<idList.size();j++) {
	                    JSONArray array_cell = new JSONArray();
	                    String smonth = idList.get(j);
	                    Object value = map.get(smonth);
	                    array_cell.put(smonth);
	                    array_cell.put(value);
	                    json_array.put(array_cell);
	                }
	                json_array1.put(json_array);
                } 
	}
	} catch (Exception e) {
		e.printStackTrace();
	}	
	return json_array1;
	}

	@Override
	public Map<String, Object> getMonthYearByIdnUserId(Integer payment_group_id, String userId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Map<String, Object> paymentGroupList = null;
		try {
			String sql = "SELECT month(pg.end_date) as month , year(pg.end_date) as year FROM payment p"
					+ "	inner join payment_group pg on p.payment_group_id = pg.payment_group_id"
					+ "	where p.payment_group_id = :pId and user_id = :userId";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("pId", payment_group_id);
			query.setParameter("userId", userId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			paymentGroupList = (Map<String, Object>) query.list().get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return paymentGroupList;
	}
}

