package com.ecommerce.dao.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ecommerce.dao.OrdersDAO;
import com.ecommerce.dto.response.OrderDetailsDTO;
import com.ecommerce.entity.Cart;
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
		String hql = "FROM " + Orders.class.getName() + " WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return query.list();
	}
	
	@Override
	public boolean updateInvoiceIdInOrder(Orders order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(order);
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

	@Override
	public List<Orders> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Orders.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public List<OrderDetailsDTO> getOrderDetailsDTO(List<Cart> carts) {
		  List<OrderDetailsDTO> orderDetails = carts.stream().map(c -> {
		  OrderDetailsDTO temp = new OrderDetailsDTO(); 
		  temp.setCartId(c.getId());
		  temp.setCreateTime(c.getCreateTime());
		  temp.setTotal(c.getOrders().stream().findFirst().get().getInvoice().getTotalAmount()); 
		  temp.setOrders(c.getOrders()); 
		  return temp;
		  }).collect(Collectors.toList());
		return orderDetails;
	}
}
