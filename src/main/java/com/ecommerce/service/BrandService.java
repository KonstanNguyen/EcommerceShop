package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Brand;

public interface BrandService {
	public List<Brand> fetchAll();
	public Brand findByID(int id);
	public Brand findByName(String name);
	
	public void addBrand(Brand brand);
    public void updateBrand(Brand brand);
    public void deleteBrand(Brand brand);
}
