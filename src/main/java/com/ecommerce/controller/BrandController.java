package com.ecommerce.controller;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Image;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.ImageService;

@Controller
@RequestMapping("brands")
public class BrandController {

	@Autowired
	BrandService service;

	@Autowired
	CategoryService categoryService;
	@Autowired
	ImageService imageService;
	@RequestMapping
	public String index(
//			@RequestParam("page") int page, 
//			@RequestParam("limit") int limit,
			ModelMap model) {
		List<Brand> brands = service.fetchAll();
		List<Category> categories = categoryService.fetchAll();
		List<Image> images=new ArrayList<>();
		model.addAttribute("brands", brands);
		
		model.addAttribute("categories", categories);
		for(Category category : categories) {
			Image image = imageService.findFirstImageByCategoryId(category.getId());
			images.add(image);
        }
		model.addAttribute("images",images);
		List<CategoryTopSelling> cateTopSellings = categoryService.getTopSelling();
		System.out.println(cateTopSellings);
		model.addAttribute("cateTopSellings", cateTopSellings);
		LocalDateTime countDownDate = LocalDateTime.of(2025, Month.JANUARY, 5, 15, 37, 25, 0);
		model.addAttribute("countDownDate", countDownDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss")).toString());
		return "home/pages/all";	
//		return "pages/login";
	}
//	@RequestMapping
//	public String brand(@RequestParam(defaultValue = "1") int id, HttpServletRequest req) {
//		Brand brand = service.findByID(id);
//		req.setAttribute("brand", brand);
//		
//		
//		return "brand";
//	}
}
