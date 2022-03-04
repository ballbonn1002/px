package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Borrow;
import com.cubesofttech.model.Equipment;

@Repository
public class BorrowDAOImpl implements BorrowDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Borrow borrow) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(borrow);
		session.flush();
		// session.close();
	}

	@Override
	public List<Borrow> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> borRowList = null;
		try {
			borRowList = session.createCriteria(Borrow.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return borRowList;
	}
	@Override
	public List<Map<String, Object>> findAll_1() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> borRowList = null;
		try {
			String sql = " SELECT * "
					+ "FROM borrow " 
				
					+ "where status = 'B' ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			borRowList = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return borRowList;
	}

	@Override
	public Borrow findById(int id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Borrow borrow = null;
		try {
			borrow = (Borrow) session.get(Borrow.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return borrow;
	}

	@Override
	public void update(Borrow Borrow) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(Borrow);
		session.flush();
		// session.close();
	}

	@Override
	public void delete(Borrow borrow) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(borrow);
		session.flush();
		// session.close();
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> list = null;
		Integer maxId;

		try {

			Criteria criteria = session.createCriteria(Borrow.class).setProjection(Projections.max("borrowId"));
			maxId = (Integer) criteria.uniqueResult();
			
			if(maxId == null){
				maxId = 0;	
			}
			else{
				return maxId;	
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else{
			return new Integer(0);
		}
	}

	@Override
	public List<Borrow> findByStatusId(String statusid) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> status = null;
		try {
			status = (List<Borrow>) session.get(Borrow.class, statusid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return status;
	}

	public List<Map<String, Object>> Borrowinglist() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		try {

			String sql = " SELECT equipment.item_no ,equipment.image ,equipment.ram ,equipment.process ,equipment.status ,equipment.name ,borrow.user_borrowid ,borrow.borrow_id ,equipment.equipment_id,borrow.status AS statusborrow ,borrow.reasona ,equipment.type ,equipment.amount,equipment.serial_no "
					+ "FROM borrow " + "LEFT JOIN equipment ON borrow.equipment_id = equipment.equipment_id "
				
					+ "ORDER BY equipment.item_no ASC ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String, Object>> Borrowcheck() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> selectchect = null;
		try {

			String sql = " SELECT borrow.equipment_id AS borrowcheck ,equipment.item_no ,equipment.image ,equipment.ram ,equipment.process ,equipment.status ,equipment.name ,borrow.user_borrowid ,borrow.borrow_id ,equipment.equipment_id ,equipment.battery ,equipment.hdd ,equipment.windows ,equipment.location ,equipment.amount ,equipment.time_create ,equipment.type ,equipment.serial_no ,borrow.status AS statusborrow "
					+ "FROM equipment " + "LEFT JOIN borrow ON equipment.equipment_id = borrow.equipment_id ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectchect = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectchect;
	}

	public List<Map<String, Object>> Borrowchecked() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> selectchect = null;
		try {

			String sql = " SELECT borrow.equipment_id AS borrowcheck ,equipment.item_no ,equipment.image ,equipment.ram ,equipment.process ,equipment.status ,equipment.name ,borrow.user_borrowid ,borrow.borrow_id ,equipment.equipment_id ,equipment.battery ,equipment.hdd ,equipment.windows ,equipment.location ,equipment.amount ,equipment.time_create ,equipment.type ,equipment.serial_no ,borrow.status AS statusborrow "
					+ "FROM equipment " + "LEFT JOIN borrow ON equipment.equipment_id = borrow.equipment_id ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectchect = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectchect;
	}

	public List<Map<String, Object>> Borrowlistnirobon() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> selectnirobon = null;
		try {

			String sql = " SELECT borrow.equipment_id ,borrow.borrow_id,borrow.status " + "FROM borrow "
					+ "ORDER BY borrow_id ASC ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectnirobon = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectnirobon;
	}

	public List<Map<String, Object>> check() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> select = null;
		try {

			String sql = " SELECT * FROM equipment where status = 'A' "
				    + "ORDER BY item_no ASC ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			select = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return select;
	}

	public List<Map<String, Object>> Showdetail() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> Showdetail = null;
		try {

			String sql = " SELECT equipment.equipment_id ,equipment.name ,equipment.amount ,equipment.status ,equipment.item_no ,equipment.serial_no ,equipment.process ,equipment.battery ,equipment.hdd ,equipment.windows ,equipment.ram ,equipment.location ,equipment.amount ,equipment.image ,equipment.time_create,type ,borrow.status AS statusborrow ,equipment.detail ,borrow.borrow_id "
					+ " FROM equipment" + " LEFT JOIN borrow ON equipment.equipment_id = borrow.equipment_id  ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Showdetail = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Showdetail;
	}

	@Override
	public Borrow Borrowchecked(String string) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Map<String, Object>> Borrowlistnirobonxx(int borrowID) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> selectnirobon = null;
		try {

			String sql = "SELECT equipment.item_no "
					+ ",equipment.image "
					+ ",equipment.ram "
					+ ",equipment.process "
					+ ",equipment.status "
					+ ",equipment.name "
					+ ",borrow.user_borrowid "
					+ ",borrow.borrow_id"
					+ ",equipment.equipment_id "
					+ ",borrow.status AS statusborrow "
					+ ",borrow.reasona ,date_format(borrow.date_start, '%d-%m-%Y') as date_start "
					+ ",date_format(borrow.date_end, '%d-%m-%Y') as date_end "
					+ ",equipment.equipment_id AS equipmentid "
					+ ",borrow.location "
					+ ",borrow.contact_addr ,borrow.reason ,borrow.remark ,equipment.type ,equipment.amount " 
					+ " FROM borrow " 					
					+ " LEFT JOIN equipment ON borrow.equipment_id = equipment.equipment_id "
					+ "Where borrow.borrow_id =:borrowID ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("borrowID", borrowID);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectnirobon = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectnirobon;
	}

	@Override
	public int findByIdx(Integer valueOf) throws Exception {
//			Session session = this.sessionFactory.getCurrentSession();
//			int borrow = (Integer) null;
//			try {
//				borrow = (int) session.get(Borrow.class, valueOf);
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				// session.close();
//			}
//			return borrow;
		
		return 0;
	}

	@Override
	public List<Borrow> find_History(String equipmentId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> selectnirobon = null;
		try {

			String sql = "SELECT * "
					+ " FROM borrow " 					
					+ "Where equipment_id =:equipmentId  order by time(borrow.time_create) asc ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("equipmentId", equipmentId);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			selectnirobon = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectnirobon;
	}

	@Override
	public List<Map<String, Object>> search_borrow(String user) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		try {

			String sql = " SELECT equipment.item_no ,equipment.image ,equipment.ram ,equipment.process ,equipment.status ,equipment.name ,borrow.user_borrowid ,borrow.borrow_id ,equipment.equipment_id,borrow.status AS statusborrow ,borrow.reasona ,equipment.type ,equipment.amount,equipment.serial_no,borrow.date_start,borrow.date_end,borrow.location,borrow.time_create "
					+ "FROM borrow " + "LEFT JOIN equipment ON borrow.equipment_id = equipment.equipment_id "
				    + "Where borrow.user_borrowid = '"+user+"'"
					+ "ORDER BY equipment.item_no ASC ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> findHistoryByUser(String user) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		try {

			String sql = " SELECT equipment.item_no ,equipment.image ,equipment.ram ,equipment.process ,equipment.status ,equipment.name ,borrow.user_borrowid ,borrow.borrow_id ,equipment.equipment_id,borrow.status AS statusborrow ,borrow.reasona ,equipment.type ,equipment.amount,equipment.serial_no,borrow.date_start,borrow.date_end,borrow.location,borrow.time_create "
					+ "FROM borrow " + "LEFT JOIN equipment ON borrow.equipment_id = equipment.equipment_id "
				    + "Where borrow.user_borrowid = '"+user+"'"
					+ "ORDER BY borrow.date_start DESC  ";
			// edit on 28/04/20
			// old is// + "ORDER BY time(borrow.time_create) DESC  ";
			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Map<String, Object>> findBorrowAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> list = null;
		try {

			String sql = " SELECT * " + " FROM equipment ";

			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Borrow> findBorrowByEquipmentId(String eId){
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> list = null;
		try {
			String hql = "from Borrow where equipmentId = :eId"+" ORDER BY date_start DESC";
			//edit on 23/04/20
			// old is //+" ORDER BY date_start DESC";
			Query query = session.createQuery(hql);
			query.setParameter("eId", eId);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Borrow> findBorrowByEquipmentIdAndStatus(String eId, String bStatus){
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> list = null;
		try {
			String hql = "from Borrow where equipmentId = :eId and status = :bStatus";
			Query query = session.createQuery(hql);
			query.setParameter("eId", eId);
			query.setParameter("bStatus", bStatus);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Borrow> findBorrowByUser(String id){
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> list = null;
		try {
			String hql = "from Borrow where userBorrowid = :userBorrowid";
			Query query = session.createQuery(hql);
			query.setParameter("userBorrowid", id);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Borrow> findBorrowByStatus(String status){
		Session session = this.sessionFactory.getCurrentSession();
		List<Borrow> list = null;
		try {
			String hql = "from Borrow where status = :status";
			Query query = session.createQuery(hql);
			query.setParameter("status", status);
			list = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	 @Override
	  	public List<Map<String, Object>> borrower(String id) throws Exception {
	  		Session session = this.sessionFactory.getCurrentSession();
	  		List<Map<String, Object>> borrower_id = null;
	  		try {
	  			String sql = " SELECT equipment.item_no, equipment.equipment_id, user_borrowid, date_start, date_end FROM equipment LEFT JOIN borrow ON equipment.equipment_id = borrow.equipment_id WHERE equipment.equipment_id = '"+id+"' ORDER BY date_start DESC";
	  			SQLQuery query = session.createSQLQuery(sql);
	  			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
	  			borrower_id = query.list();
	  		} catch (Exception e) {
	  			e.printStackTrace();
	  		}
	  		return borrower_id;
	  	}
	 
	 //getAll 21/4/2020
	 @Override
		public List<Borrow> getAll(){
			Session session = this.sessionFactory.getCurrentSession();
			List<Borrow> list = null;
			try {
				list = session.createCriteria(Borrow.class).list();
			} catch(HibernateException e) {
				e.printStackTrace();
			}
			return list;
		}
	 
	 @Override
	  	public String findlatestborrowbyequipmentid(Integer id) throws Exception {
	  		Session session = this.sessionFactory.getCurrentSession();
	  		String borrow = null;
	  		try {
	  			String sql = "SELECT borrow_id FROM `borrow` where equipment_id = "+id+" ORDER BY `borrow`.`date_start` DESC LIMIT 1";
	  			/*SQLQuery query = session.createSQLQuery(sql);
	  			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);*/
	  			SQLQuery query = session.createSQLQuery(sql);

	  			borrow = query.uniqueResult().toString();
	  			//borrow = query.toString();
	  		} catch (Exception e) {
	  			e.printStackTrace();
	  		}
	  		return borrow;
	  	}
}
