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
		return dao.findByID(id);
	}

	@Override
	public void addBrand(Brand brand) {
		// TODO Auto-generated method stub
		dao.addBrand(brand);
	}

	@Override
	public void updateBrand(Brand brand) {
		// TODO Auto-generated method stub
		dao.updateBrand(brand);
	}

	@Override
	public void deleteBrand(Brand brand) {
		// TODO Auto-generated method stub
		dao.deleteBrand(brand);
	}

	@Override
	public Brand findByName(String name) {
		// TODO Auto-generated method stub
		return dao.findByName(name);
	}

}
