package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Need;

public interface NeedService {
	public List<Need> fetchAll();
	public Need findById(int id);
	List<Need> fetchAllByCategory(int id);
}
