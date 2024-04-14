package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.NeedDAO;
import com.ecommerce.entity.Need;
import com.ecommerce.service.NeedService;

@Service
public class NeedServiceImpl implements NeedService {
	@Autowired
	NeedDAO dao;
	
	@Override
	public List<Need> fetchAll() {
		return dao.fetchAll();
	}

	@Override
	public Need findById(int id) {
		return dao.findById(id);
	}

	@Override
	public List<Need> fetchAllByCategory(int id) {
		return dao.fetchAllByCategory(id);
	}
}
