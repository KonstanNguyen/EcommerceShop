package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Category;
import com.ecommerce.service.CategoryService;

@Controller
@RequestMapping("categories")
public class CategoryController {
	@Autowired
	CategoryService service;

	
	@RequestMapping("index")
	public String index(ModelMap model) {
		List<Category> categories = service.fetchAllProduct();
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
		
		Category category = service.findByID(id);
		model.addAttribute("tasks", category.getNeeds());
		return "category";
	}
}
