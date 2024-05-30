package com.ecommerce.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.entity.Image;
import com.ecommerce.dao.ImageDAO;

@Transactional
@Repository
@SuppressWarnings("unchecked")
public class ImageDAOimpl implements ImageDAO{
	@Autowired
	SessionFactory factory;

	public List<Image> fetchAll(int ID) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM " + Image.class.getName() + " WHERE category_Id = :category";
	    Query query = session.createQuery(hql);
	    query.setParameter("categoryId", ID);
	    return query.list();
	}

}
