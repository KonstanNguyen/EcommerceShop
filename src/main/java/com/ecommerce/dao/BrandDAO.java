package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Brand;

public interface BrandDAO {
	public List<Brand> fetchAll();
	public Brand findByID(int id);
}
