package com.web.ecommerce.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.ecommerce.dao.BrandDao;
import com.web.ecommerce.entities.Brand;

@Repository
public class BrandDaoImpl implements BrandDao {

	@Override
	public List<Brand> fetchAll() {
		List<Brand> brands = new ArrayList<>();
		
		brands.add(new Brand(123, "Accer"));
		brands.add(new Brand(321, "Dell"));
		brands.add(new Brand(245, "LG"));
		brands.add(new Brand(233, "Thinkpad"));
		brands.add(new Brand(134, "HP"));
		brands.add(new Brand(578, "Mac"));
		
		return brands;
	}

	@Override
	public Brand find(int ID) {
		// TODO Auto-generated method stub
		return null;
	}

}
