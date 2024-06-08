package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;

public interface BrandDAO {
	public List<Brand> fetchAll();
	public Brand findByID(int id);
	
	public void addBrand(Brand brand);
    public void updateBrand(Brand brand);
    public void deleteBrand(Brand brand);
	public Brand findByName(String name);
}
