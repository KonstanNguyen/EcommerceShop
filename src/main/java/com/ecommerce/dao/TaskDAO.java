package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Task;

public interface TaskDAO {
	public List<Task> fetchAll();
	public Task findById(int id);
	public List<Task> listCategory();
	List<Task> fetchAllByCategory(int id);
}
