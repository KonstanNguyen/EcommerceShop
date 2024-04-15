package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Need;

@SuppressWarnings("unchecked")
@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Category> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Category findByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category WHERE id = :categoryId";
		Query query = session.createQuery(hql);
		query.setParameter("categoryId", id);
		return (Category)query.uniqueResult();
	}

	@Override
	public List<String> fetchAllCPU() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT CPU FROM Category";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public List<Category> getAllByCPU(String cpu) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category WHERE Category.cpu = :cpu";
		Query query = session.createQuery(hql);
		query.setParameter("cpu", cpu);
		return query.list();
	}

	@Override
	public List<Need> getAllNeed(int id) {
		Session session = factory.getCurrentSession();
		//SELECT t.id, t.name FROM Task t INNER JOIN t.categories c WHERE c.id = :categoryId
		String hql = "FROM Need n INNER JOIN n.categories c WHERE c.id=:categoryId";
		Query query = session.createQuery(hql);
		query.setInteger("categoryId", id);
		System.out.println(query.list().get(0));
//		List<Task> list = (List<Task>)query.list();
		return query.list();
	}
}