package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Category;
import com.ecommerce.entity.Task;

public interface CategoryDAO {
	public List<Category> fetchAll();
	public Category findByID(int id);
	public List<String> fetchAllCPU();
	public List<Task> getAllTask(int id);
	public List<Category> getAllByCPU(String cpu);
}
