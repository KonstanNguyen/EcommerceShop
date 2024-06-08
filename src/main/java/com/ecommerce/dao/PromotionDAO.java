package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Promotion;

public interface PromotionDAO {
	public List<Promotion> fetchAll();
}
