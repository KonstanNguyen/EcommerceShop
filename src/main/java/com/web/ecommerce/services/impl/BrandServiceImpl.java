package com.web.ecommerce.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.ecommerce.dao.BrandDao;
import com.web.ecommerce.dao.impl.BrandDaoImpl;
import com.web.ecommerce.entities.Brand;
import com.web.ecommerce.services.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	public BrandDao dao = new BrandDaoImpl();
	
	@Override
	public List<Brand> fetchAll() {
		return dao.fetchAll();
	}

	@Override
	public Brand find(int ID) {
		// TODO Auto-generated method stub
		return null;
	}

}
