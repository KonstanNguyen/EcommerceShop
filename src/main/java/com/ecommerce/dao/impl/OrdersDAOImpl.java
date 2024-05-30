package com.ecommerce.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ecommerce.dao.OrdersDAO;
import com.ecommerce.entity.Orders;

@Repository
@Transactional
@SuppressWarnings("unchecked")
public class OrdersDAOImpl implements OrdersDAO {
	
	@Autowired
	SessionFactory factory;

	@Override
	public List<Orders> getOrdersByCartId(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Orders.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

}
