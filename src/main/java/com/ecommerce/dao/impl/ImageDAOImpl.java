package com.ecommerce.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.ImageDAO;
import com.ecommerce.entity.Image;

@Transactional
@Repository
public class ImageDAOImpl implements ImageDAO {
	@Autowired
	SessionFactory factory;
	
	@Override
	public void addImage(Image image) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(image);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}
	
}
