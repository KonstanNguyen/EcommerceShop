package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.InvoiceDAO;
import com.ecommerce.entity.Invoice;

@Repository
@Transactional
@SuppressWarnings("unchecked")
public class InvoiceDAOImpl implements InvoiceDAO {
	
	@Autowired
	SessionFactory factory;

	@Override
	public List<Invoice> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Invoice.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public boolean insertInvoice(Invoice invoice) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(invoice);
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
