package com.cubesofttech.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.WorkHours;

@Repository
public class FunctionDAOImpl implements FunctionDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Map<String, Object>> findWorkingList(String userId, String startDate, String endDate) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> workingList = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select :userId as user,date(cdate) as cdate,dayname(cdate) as dayname,cin,cout,\n");
			sql.append("wk_minute,wk_hr,\n");
			sql.append("(select head from holiday h where cdate between start_date and end_date) as holiday,\n");
			sql.append("(select (select leave_type_name from leave_type where leave_type_id =  l.leave_type_id) from leaves l where user_create = :userId and cdate between l.start_date and l.end_date) as leave_type,\n");
			sql.append("(select no_day  from leaves l where user_create = :userId and cdate between l.start_date and l.end_date) as leave_day,\n");
			sql.append("(case when wk_minute is not null then 1 else 0 end) as isWorking,\n");
			sql.append("(case when wk_minute is null and dayname(cdate) not in ('Saturday','Sunday') and\n");
			sql.append("(select head from holiday h where cdate between start_date and end_date) is null and\n");
			sql.append("(select no_day  from leaves l where user_create = :userId and cdate between l.start_date and l.end_date) is null then 1 else 0 end) as isAbsent,\n");
			sql.append("(case when dayname(cdate) not in ('Saturday','Sunday') and (select head from holiday h where cdate between start_date and end_date) is null then 1 else 0 end) as isWorkingDay\n");
			sql.append("from\n");
			sql.append("(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) cdate from\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v\n");
			sql.append("left join\n");
			sql.append("(\n");
			sql.append("select\n");
			sql.append("min(case when work_hours_type = 1 then work_hours_time_work end) cin,\n");
			sql.append("max(case when work_hours_type = 2 then work_hours_time_work end) cout,\n");
			sql.append("sum(workinghours) as wk_minute,\n");
			sql.append("CONCAT(FLOOR(sum(workinghours)/60),'h ',MOD(sum(workinghours),60),'m') as wk_hr\n");
			sql.append("from(\n");
			sql.append("select\n");
			sql.append("t.*,\n");
			sql.append("sum(case when work_hours_type = 2 and lag_type = 1 then 0 else 1 end)\n");
			sql.append("over(partition by user_create order by work_hours_time_work) grp\n");
			sql.append("from (\n");
			sql.append("select\n");
			sql.append("t.*,\n");
			sql.append("lag(work_hours_type) over(partition by user_create order by work_hours_time_work) lag_type\n");
			sql.append("from work_hours t\n");
			sql.append("where user_create = :userId \n");
			sql.append("and work_hours_time_work between :startDate and :endDate \n");
			sql.append(") t\n");
			sql.append(") t\n");
			sql.append("group by grp\n");
			sql.append(") w on (date(cdate) = date(w.cin)) or  (date(cdate) = date(w.cout))\n");
			sql.append("where cdate between :startDate and :endDate \n");
			sql.append("order by cdate asc\n");


			SQLQuery query = session.createSQLQuery(sql.toString());
			query.setParameter("userId", userId);
			query.setParameter("startDate", startDate);
			query.setParameter("endDate", endDate);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			workingList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workingList;
	}

	@Override
	public List<Map<String, Object>> findWorkingSummary(String userId, String startDate, String endDate)
			throws Exception {
		Session session = this.sessionFactory.getCurrentSession();

		List<Map<String, Object>> workingSummary = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select\n");
			sql.append("id,name,payment,term,term_day,\n");
			sql.append("(case when (select e.payment from user u left join employee_type e on e.employee_type_id = u.employee_type_id where id = :userId ) = 0 then\n");
			sql.append("((select e.term_day from user u left join employee_type e on e.employee_type_id = u.employee_type_id where id = :userId )) else sum(isWorking) end) as actual_working_day,\n");
			sql.append("ifnull(sum(isWorkingDay),0) as actual_working_per_month,\n");
			sql.append("sum(isWorking) as sum_emp_working,\n");
			sql.append("sum(isAbsent) as sum_emp_absent,\n");
			sql.append("ifnull(sum(wk_hr),0)  as sum_emp_working_hr,\n");
			sql.append(":startDate as start_date,:endDate as end_date\n");
			sql.append("from\n");
			sql.append("(\n");
			sql.append("select\n");
			sql.append("u.id,e.name,payment,  e.term,e.term_day,\n");
			sql.append("date(cdate) as cdate,\n");
			sql.append("wk_minute,wk_hr,\n");
			sql.append("(case when wk_minute is not null then 1 else 0 end) as isWorking,\n");
			sql.append("(case when wk_minute is null and dayname(cdate) not in ('Saturday','Sunday') and\n");
			sql.append("(select head from holiday h where cdate between start_date and end_date) is null and\n");
			sql.append("(select no_day  from leaves l where user_create = :userId and cdate between l.start_date and l.end_date) is null then 1 else 0 end) as isAbsent,\n");
			sql.append("(case when dayname(cdate) not in ('Saturday','Sunday') and\n");
			sql.append("(select head from holiday h where cdate between start_date and end_date) is null then 1 else 0 end) as isWorkingDay\n");
			sql.append("from\n");
			sql.append("(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) cdate from\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,\n");
			sql.append("(select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v\n");
			sql.append("left join\n");
			sql.append("(\n");
			sql.append("select\n");
			sql.append("min(case when work_hours_type = 1 then work_hours_time_work end) cin,\n");
			sql.append("max(case when work_hours_type = 2 then work_hours_time_work end) cout,\n");
			sql.append("sum(workinghours) as wk_minute,\n");
			sql.append("CONCAT(FLOOR(sum(workinghours)/60),'h ',MOD(sum(workinghours),60),'m') as wk_hr\n");
			sql.append("from(\n");
			sql.append("select\n");
			sql.append("t.*,\n");
			sql.append("date(work_hours_time_work) as grp \n");
			sql.append("from (\n");
			sql.append("select\n");
			sql.append("t.* \n");
			sql.append("from work_hours t\n");
			sql.append("where user_create = :userId \n");
			sql.append("and work_hours_time_work between :startDate and :endDate \n");
			sql.append(") t\n");
			sql.append(") t\n");
			sql.append("group by grp\n");
			sql.append(") w on (date(cdate) = date(w.cin)) or  (date(cdate) = date(w.cout))\n");
			sql.append("left join user u on u.id = :userId \n");
			sql.append("left join employee_type e on e.employee_type_id = u.employee_type_id\n");
			sql.append("where cdate between :startDate and :endDate \n");
			sql.append("order by cdate asc\n");
			sql.append(") c\n");

			SQLQuery query = session.createSQLQuery(sql.toString());
			query.setParameter("userId", userId);
			query.setParameter("startDate", startDate);
			query.setParameter("endDate", endDate);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			workingSummary = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workingSummary;
	}


}
