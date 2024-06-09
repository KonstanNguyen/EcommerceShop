package com.ecommerce.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Transaction;

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
	public void saveCart(Cart cart) {
		Session session =factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(cart);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		
	}
	@Override
	public Cart findCartByUserId(int userId) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM " + Cart.class.getName() + " WHERE user.id = :userId and status=false";
	    Query query = session.createQuery(hql);
	    query.setParameter("userId", userId);
	    // Kiểm tra nếu không có cart nào
	    Cart cart = (Cart) query.uniqueResult();
		if (cart == null) {
			return null;
		}
	    return cart;
	}
	
	@Override
	public Cart findCartUnpurchased(int userId) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM " + Cart.class.getName() + " WHERE user.id = :userId and status=false";
	    Query query = session.createQuery(hql);
	    query.setParameter("userId", userId);
	    Cart cart = (Cart) query.uniqueResult();
		if (cart == null) {
			return null;
		}
	    return cart;
	}
	
	@Override
	public boolean updateCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(cart);
			t.commit();
		}
		catch(Exception e) {
			t.rollback();
			return false;
		}
		finally {
			session.close();
		}
		return true;
	}
}