package com.ecommerce.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.entity.Category;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addProduct(Category Category) {
        Session session = sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        session.save(Category);
        tx.commit();
    }

    @Override
    public void updateProduct(Category category) {
        Session session = sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        String hql = "UPDATE Category SET name = :name, description = :description WHERE id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("name", category.getTitle());
        query.setParameter("description", category.getDescription());
        query.setParameter("id", category.getId());
        int result = query.executeUpdate();
        tx.commit();
    }

    @Override
    public void deleteProduct(int id) {
        Session session = sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        String hql = "DELETE FROM Category WHERE id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        int result = query.executeUpdate();
        tx.commit();
    }

    @Override
    public Category getProductById(int id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "FROM Category WHERE id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        Category category = (Category) query.uniqueResult();
        return category;
    }

    @Override
    public List<Category> getAllProducts() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "FROM Category";
        Query query = session.createQuery(hql);
        return query.list();
    }
    
}