package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Need;

public interface NeedDAO {
	public List<Need> fetchAll();
	public Need findById(int id);
	public List<Need> listCategory();
	List<Need> fetchAllByCategory(int id);
}
