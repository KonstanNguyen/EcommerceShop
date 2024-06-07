package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Category;

public interface ProductDAO {
	void addProduct(Category category);
    void updateProduct(Category category);
    void deleteProduct(int id);
    Category getProductById(int id);
    List<Category> getAllProducts();
}
