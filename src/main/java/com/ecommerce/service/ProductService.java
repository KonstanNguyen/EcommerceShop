package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Category;

public interface ProductService {
	void addProduct(Category category);
    void updateProduct(Category category);
    void deleteProduct(int id);
    Category getProductById(int id);
    static List<Category> getAllProducts() {
		// TODO Auto-generated method stub
		return null;
	}
}
