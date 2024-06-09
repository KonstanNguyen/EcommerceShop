package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.BrandDAO;
import com.ecommerce.entity.Brand;
import com.ecommerce.error.DetectedException;

@Transactional
@Repository
@SuppressWarnings("unchecked")
public class BrandDAOImpl implements BrandDAO{
	@Autowired
	SessionFactory factory;

	@Override
	public List<Brand> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Brand.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Brand findByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Brand.class.getName() +" WHERE id = :brandId";
		Query query = session.createQuery(hql);
		query.setParameter("brandId", id);
		return (Brand)query.uniqueResult();
	}
	
	@Override
	public Brand findByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Brand.class.getName() +" WHERE name = :brandName";
		Query query = session.createQuery(hql);
		query.setParameter("brandName", name);
		return (Brand)query.uniqueResult();
	}

	@Override
	public void addBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(brand);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void updateBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(brand);
			t.commit();
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			t.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteBrand(Brand brand) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if (brand.getid() != 0) {
				session.delete(brand);
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
