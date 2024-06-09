package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Image;
import com.ecommerce.entity.Need;

public interface CategoryDAO {
	public List<Category> fetchAllProduct();
	public Category findByID(int id);
	public List<String> fetchAllCPU();
	public List<Need> getAllNeed(int id);
	public List<Category> getAllByCPU(String cpu);
	public List<Category> searchCategory(String name);
    public List<Category> findCategoryByBrandId(int brandId);
	public List<CategoryTopSelling> getTopSelling();
	public List<CategoryNewProduct> getCategoryNewProduct();
	
	public Category findByName(String name);
	
	public void addCategory(Category category);
    public void updateCategory(Category category);
    public void deleteCategory(Category category);
}
