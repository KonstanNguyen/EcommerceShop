package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.OrderDAO;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Orders;

@Transactional
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Orders> getOrdersByCartId(int id) {
		Session session = factory.getCurrentSession();
		String hql = "From Orders where cart.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return query.list();
	}

	@Override
	public Orders findByID(int orderId) {
		Session session = factory.getCurrentSession();
		String hql = "From Orders where id=:orderId";
		Query query = session.createQuery(hql);
		query.setParameter("orderId", orderId);
		return (Orders) query.uniqueResult();
	};

	@Override
	public void saveOrder(Orders order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(order);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void updateOrder(Orders order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(order);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteOrder(Orders order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if (order.getInvoiceId() == null) {
				session.delete(order);
				t.commit();
			}
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}
}
