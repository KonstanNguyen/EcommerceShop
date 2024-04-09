package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.BrandDAO;
import com.ecommerce.entity.Brand;
import com.ecommerce.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	BrandDAO dao;
	
	@Override
	public List<Brand> fetchAll() {
		return dao.fetchAll();
	}

	@Override
	public Brand findByID(int id) {
		Brand brand = dao.findByID(id);
		if (brand == null) {
			System.out.println("Brand is not found");
		}
		return brand;
	}

}
