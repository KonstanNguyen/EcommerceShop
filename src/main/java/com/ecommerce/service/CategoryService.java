package com.ecommerce.service;

import java.util.List;

import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Image;
import com.ecommerce.entity.Need;

public interface CategoryService {
	public List<Category> fetchAllProduct();
	public Category findByID(int id);
	public List<String> fetchAllCPU();
	public List<Need> getAllNeed(int id);
	public List<CategoryTopSelling> getTopSelling();
	public List<CategoryNewProduct> getCategoryNewProduct();
	
	public Category findByName(String name);
	
	public void addCategory(Category category);
    public void updateCategory(Category category);
    public void deleteCategory(Category category);
	public List<Category> searchCategory(String name);
}
