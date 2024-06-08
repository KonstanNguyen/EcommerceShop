package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.PromotionDAO;
import com.ecommerce.entity.Promotion;
import com.ecommerce.service.PromotionService;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	PromotionDAO dao;
	
	@Override
	public List<Promotion> fetchAll() {
		// TODO Auto-generated method stub
		return dao.fetchAll();
	}
	
}
