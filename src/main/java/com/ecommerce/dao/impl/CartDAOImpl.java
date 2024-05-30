package com.ecommerce.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.entity.Cart;

@Transactional
@Repository
@SuppressWarnings("unchecked")
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Cart> fetchAll(){
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Cart.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Cart find(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Cart.class.getName() + " WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (Cart)query.uniqueResult();
	}

}