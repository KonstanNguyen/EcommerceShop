package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.TaskDAO;
import com.ecommerce.entity.Task;
import com.ecommerce.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	TaskDAO dao;
	
	@Override
	public List<Task> fetchAll() {
		return dao.fetchAll();
	}

	@Override
	public Task findById(int id) {
		return dao.findById(id);
	}

	@Override
	public List<Task> fetchAllByCategory(int id) {
		return dao.fetchAllByCategory(id);
	}
}
