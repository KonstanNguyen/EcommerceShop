package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Brand;
import com.ecommerce.service.BrandService;

@Controller
public class BrandController {
	
	@Autowired
	BrandService service;
	
	@RequestMapping("brand")
	public String index(ModelMap model) {
		List<Brand> brands = service.fetchAll();
		model.addAttribute("brands", brands);
		return "brand";
	}
	
	@RequestMapping("brand/{id}")
	public String index(ModelMap model, @PathVariable("id") int id) {
		Brand brand = service.findByID(id);
		model.addAttribute("brand", brand);
		return "brand";
	}
}
