package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Promotion;

public interface PromotionService {
	public List<Promotion> fetchAll();
	public Promotion findByID(int id);
	
	public void addPromotion(Promotion promotion);
    public void updatePromotion(Promotion promotion);
    public void deletePromotion(Promotion promotion);
}
