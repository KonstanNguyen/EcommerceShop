package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Category;
import com.ecommerce.entity.Task;

public interface CategoryService {
	public List<Category> fetchAll();
	public Category findByID(int id);
	public List<String> fetchAllCPU();
	public List<Task> getAllTask(int id);
}
