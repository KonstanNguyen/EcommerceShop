package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.dto.response.PageResponse;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Need;

public interface CategoryDAO {
	public List<Category> fetchAll();
	public Category findByID(int id);
	public List<String> fetchAllCPU();
	public List<Need> getAllNeed(int id);
	public List<Category> getAllByCPU(String cpu);
	public PageResponse<Category> fetchPageTopSelling(int pageNo, int pageSize);
}
