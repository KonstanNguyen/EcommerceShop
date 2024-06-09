package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.PromotionDAO;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Promotion;
import com.ecommerce.error.DetectedException;

@Transactional
@Repository
public class PromotionDAOImpl implements PromotionDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Promotion> fetchAll() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Promotion.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Promotion findByID(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Promotion.class.getName() +" WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return (Promotion)query.uniqueResult();
	}

	@Override
	public void addPromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(promotion);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void updatePromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(promotion);
			t.commit();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			t.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void deletePromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if (promotion.getId() != 0) {
				session.delete(promotion);
				t.commit();
			}
		} catch (Exception e) {
			t.rollback();
			throw new DetectedException("Failed to delete brand with id: " + brand.getid(), e);
		} finally {
			session.close();
		}
	}
	
}
