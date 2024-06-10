package com.ecommerce.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.entity.EcoUser;

@Repository
@Transactional
@SuppressWarnings("unchecked")
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory factory;
	
	@Override
	public List<EcoUser> fetchAll(){
		Session session = factory.getCurrentSession();
		String hql = "FROM " + EcoUser.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}
	
	@Override
	public boolean save(EcoUser user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	@Override
	public boolean update(EcoUser user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	@Override
	public EcoUser findByUsername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + EcoUser.class.getName() + " WHERE username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		return (EcoUser)query.uniqueResult();
	}
	
	@Override
	public EcoUser findByUsernameAndPassword(String username, String password) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + EcoUser.class.getName() + " WHERE username = :username AND password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		return (EcoUser)query.uniqueResult();
	}

	@Override
	public EcoUser findByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + EcoUser.class.getName() + " WHERE name = :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", name);
		return (EcoUser)query.uniqueResult();
	}
}
