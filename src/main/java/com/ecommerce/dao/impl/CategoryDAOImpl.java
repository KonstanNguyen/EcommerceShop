package com.ecommerce.dao.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Image;
import com.ecommerce.entity.Need;
import com.ecommerce.entity.Orders;

@SuppressWarnings("unchecked")
@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	SessionFactory factory;

	private List<Category> fetchAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Category.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public List<Category> fetchAllProduct() {
		return fetchAll();
	}

	@Override
	public Category findByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Category.class.getName() + " WHERE id = :categoryId";
		Query query = session.createQuery(hql);
		query.setParameter("categoryId", id);
		return (Category) query.uniqueResult();
	}

	@Override
	public List<String> fetchAllCPU() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT CPU FROM " + Category.class.getName();
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public List<Category> getAllByCPU(String cpu) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Category.class.getName() + " WHERE Category.cpu = :cpu";
		Query query = session.createQuery(hql);
		query.setParameter("cpu", cpu);
		return query.list();
	}

	@Override
	public List<Need> getAllNeed(int id) {
		Category category = findByID(id);
		return category.getNeeds().stream().distinct().collect(Collectors.toList());
	}

	@Override
	public List<CategoryTopSelling> getTopSelling() {
		List<Category> categories = fetchAll();
		List<CategoryTopSelling> topSellings = categories.stream().filter(t -> t.isHot()).map(category -> {
			CategoryTopSelling topSelling = new CategoryTopSelling();
			topSelling.setId(category.getId());
			topSelling.setTitle(category.getTitle());
			topSelling.setPrice(category.getPrice());
			topSelling.setPromotionPrice(category.getPromotionPrice());
			topSelling.setBrandName(category.getBrand().getName());
			topSelling.setImage(category.getImages().stream().findFirst().get());
			return topSelling;
		}).collect(Collectors.toList());
		return topSellings;
	}

	@Override
	public List<CategoryNewProduct> getCategoryNewProduct() {
		List<Category> categories = fetchAll();
		List<CategoryNewProduct> CategoryNewProducts = categories.stream().map(category -> {
			CategoryNewProduct categoryDTO = new CategoryNewProduct();
			categoryDTO.setId(category.getId());
			categoryDTO.setTitle(category.getTitle());
			categoryDTO.setPrice(category.getPrice());
			categoryDTO.setPromotionPrice(category.getPromotionPrice());
			categoryDTO.setImage(category.getImages().stream().findFirst().get());
			return categoryDTO;
		}).collect(Collectors.toList());
		return CategoryNewProducts;
	}

	@Override
	public void addCategory(Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(category);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void updateCategory(Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(category);
			System.out.println("Update");
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteCategory(Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.delete(category);
			t.commit();

		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
	}

	public List<Category> findCategoryByBrandId(int brandId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Category.class.getName() + " WHERE brand.id = :brandId";
		Query query = session.createQuery(hql);
		query.setParameter("brandId", brandId);
		return query.list();
	}

	@Override
	public Category findByName(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Category.class.getName() + " WHERE title = :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", name);
		return (Category) query.uniqueResult();
	}

	@Override
	public List<Category> searchCategory(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + Category.class.getName()
				+ " WHERE CONCAT(title, ' ', RAM, ' ', OS,' ', CPU,' ',HARDWARE,' ',SCREEN) LIKE :name";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + name + "%");
		return query.list();
	}

}
