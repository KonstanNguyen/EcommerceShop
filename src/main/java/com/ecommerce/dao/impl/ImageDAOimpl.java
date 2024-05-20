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
public class ImageDAOimpl implements ImageDAO{
	@Autowired
	SessionFactory factory;
	public Image findFirstImageByCategoryId(int ID) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM Image WHERE category_Id= :category";
	    Query query = session.createQuery(hql);
	    query.setParameter("category", ID);
	    query.setMaxResults(1);
	    List<Image> result = query.list();
	    if (result != null && !result.isEmpty()) {
	        return result.get(0);
	    } else {
	        return null;
	    }
	}


	public List<Image> fetchAll(int ID) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM Image WHERE category_Id = :category";
	    Query query = session.createQuery(hql);
	    query.setParameter("categoryId", ID);
	    return query.list();
	}

}
