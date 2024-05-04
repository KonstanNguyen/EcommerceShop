package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.CategoryDAO;
import com.ecommerce.dto.response.PageResponse;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Need;
import com.ecommerce.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryDAO dao;
	
	@Override
	public List<Category> fetchAll() {
		return dao.fetchAll();
	}

	@Override
	public Category findByID(int id) {
		return dao.findByID(id);
	}

	@Override
	public List<String> fetchAllCPU() {
		return dao.fetchAllCPU();
	}

	@Override
	public List<Need> getAllNeed(int id) {
//		Category category = dao.findByID(id);
//		List<Task> tasks = new ArrayList<>(category.getTasks());
//		return tasks;
		return dao.getAllNeed(id);
	}

	public PageResponse<Category> fetchPageTopSelling(int pageNo, int pageSize){
		return dao.fetchPageTopSelling(pageNo, pageSize);
	}
}
