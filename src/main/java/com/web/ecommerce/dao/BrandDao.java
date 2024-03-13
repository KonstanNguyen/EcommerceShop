package com.web.ecommerce.dao;

import java.util.List;

import com.web.ecommerce.entities.Brand;

public interface BrandDao {
	public List<Brand> fetchAll();
	
	public Brand find(int ID);
}
