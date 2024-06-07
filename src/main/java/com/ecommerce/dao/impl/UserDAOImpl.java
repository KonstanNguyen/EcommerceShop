package com.ecommerce.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	public EcoUser findByUsername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + EcoUser.class.getName() + " WHERE username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		return (EcoUser)query.uniqueResult();
	}
}
