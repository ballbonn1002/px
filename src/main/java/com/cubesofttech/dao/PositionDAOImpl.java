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

import com.cubesofttech.model.Position;
import com.cubesofttech.model.User;
import com.cubesofttech.model.UserSalary;

@Repository
public class PositionDAOImpl implements PositionDAO {
	
    @Autowired
    private SessionFactory sessionFactory;
    

	@Override
	public void save(Position position) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(position);
        session.flush();
        //session.close();
	}
	
	@Override
	public void saveOrUpdate(Position position) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.saveOrUpdate(position);
        session.flush();
        //session.close();
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> position_id = null;
		try {
			String sql = " SELECT position_id,name, CONCAT(position_id) FROM position  ORDER BY position_id  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			position_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return position_id;

	}

	@Override
	public List<Position> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Position> position = null;
		try {
			position = session.createCriteria(Position.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return position;
		}
	
	@Override
	public List<Position> findAllPosition() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Position> position = null;
		try {
			String sql = " SELECT * FROM position";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			position = query.list();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return position;
	}
	
	@Override
	public List<Map<String, Object>> findPositionId(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List id1 = null;
		try {
			String sql = " SELECT * FROM position WHERE position_id = :id ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("id", id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			id1 = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id1;

	}

	@Override
    public Position findById(String position_id) throws Exception {
        Session session = this.sessionFactory.getCurrentSession();
        Position position = null;
        try {
        	position = (Position) session.get(Position.class, position_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return position;
    }

	@Override
	public void update(Position position) throws Exception {
		 Session session = this.sessionFactory.getCurrentSession();
	        session.clear();
	        session.update(position);
	        session.flush();
	        //session.close();
		
	}

	@Override
	public void delete(Position position) throws Exception {
		   Session session = this.sessionFactory.getCurrentSession();
	        session.delete(position);
	        session.flush();
	        //session.close();
	}

	@Override
	public List<Position> search(String positionId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<Map<String, Object>> positionuser(String currentUserlist) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> positionuser = null;
		try {

			String sql = " SELECT position_id "
						+ " FROM position " 
						+ " WHERE id = :currentUserlist ";

			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter("currentUserlist", currentUserlist);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			positionuser = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return positionuser;
	}

	@Override
	public List<Position> searchByDepartment(String departmentId) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Position> position_id = null;
		try {
			Criteria cr = session.createCriteria(Position.class);
			cr.add(Restrictions.eq("departmentId", departmentId));
			position_id = cr.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return position_id;
	}
	
	
}