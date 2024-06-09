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

	@Override
	public Promotion findByID(int id) {
		// TODO Auto-generated method stub
		return dao.findByID(id);
	}

	@Override
	public void addPromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		dao.addPromotion(promotion);
	}

	@Override
	public void updatePromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		dao.updatePromotion(promotion);
	}

	@Override
	public void deletePromotion(Promotion promotion) {
		// TODO Auto-generated method stub
		dao.deletePromotion(promotion);
	}
	
}
