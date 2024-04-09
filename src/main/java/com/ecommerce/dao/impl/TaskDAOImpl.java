package com.ecommerce.dao.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.TaskDAO;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Task;
import com.ecommerce.service.CategoryService;


@SuppressWarnings("unchecked")
@Transactional
@Repository
public class TaskDAOImpl implements TaskDAO {
	@Autowired
	SessionFactory factory;
	@Autowired
	CategoryService cService;
	
	@Override
	public List<Task> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Task";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Task findById(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Task WHERE id = :taskId";
		Query query = session.createQuery(hql);
		query.setParameter("taskId", id);
		return (Task)query.uniqueResult();
	}

	@Override
	public List<Task> fetchAllByCategory(int id) {
		Category category = cService.findByID(id);
		return category
				.getTasks()
				.stream()
				.collect(Collectors.toList());
	}

	@Override
	public List<Task> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}

}
