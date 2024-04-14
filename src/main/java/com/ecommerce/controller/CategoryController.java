package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Category;
import com.ecommerce.entity.Need;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.NeedService;

@Controller
@RequestMapping("categories")
public class CategoryController {
	@Autowired
	CategoryService service;
	@Autowired
	NeedService taskService;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		List<Category> categories = service.fetchAll();
		model.addAttribute("categories", categories);
		return "";
	}
	
	@RequestMapping("/{id}")
	public String find(ModelMap model, @PathVariable("id") int id) {
		Category category = service.findByID(id);
		model.addAttribute("category", category);
		return "category";
	}
	
	@RequestMapping("{id}/tasks")
	public String task(ModelMap model, @PathVariable("id") int id) {
		
		List<Need> tasks = taskService.fetchAllByCategory(id);
		model.addAttribute("tasks", tasks);
		return "category";
	}
}
