package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.PromotionDAO;
import com.ecommerce.entity.Promotion;

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
	
}
