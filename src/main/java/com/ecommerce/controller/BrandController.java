package com.ecommerce.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CategoryService;

@Controller
@RequestMapping("brands")
public class BrandController {

	@Autowired
	BrandService service;

	@Autowired
	CategoryService categoryService;

	@RequestMapping
	public String index(ModelMap model) {
		List<Brand> brands = service.fetchAll();
		List<Category> categories = categoryService.fetchAll();
		model.addAttribute("brands", brands);
		model.addAttribute("categories", categories);
		return "home/pages/home";
//		return "pages/login";
	}
}
