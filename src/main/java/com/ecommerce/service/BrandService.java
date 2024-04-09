package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Brand;

public interface BrandService {
	public List<Brand> fetchAll();
	public Brand findByID(int id);
}
