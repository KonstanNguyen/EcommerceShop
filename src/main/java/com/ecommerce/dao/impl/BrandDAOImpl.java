package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.BrandDAO;
import com.ecommerce.entity.Brand;

@Transactional
@Repository
public class BrandDAOImpl implements BrandDAO{
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Brand> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Brand";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Brand findByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Brand WHERE id = :brandId";
		Query query = session.createQuery(hql);
		query.setParameter("brandId", id);
		return (Brand)query.uniqueResult();
	}
	
	
}
