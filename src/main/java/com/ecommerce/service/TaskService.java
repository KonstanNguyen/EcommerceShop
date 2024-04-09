package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Task;

public interface TaskService {
	public List<Task> fetchAll();
	public Task findById(int id);
	List<Task> fetchAllByCategory(int id);
}
