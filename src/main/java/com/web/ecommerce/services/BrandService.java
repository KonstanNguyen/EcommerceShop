package com.web.ecommerce.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.ecommerce.entities.Brand;

public interface BrandService {
	public List<Brand> fetchAll();
	
	public Brand find(int ID);
}
