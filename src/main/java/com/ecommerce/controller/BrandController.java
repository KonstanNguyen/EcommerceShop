package com.ecommerce.controller;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Brand;
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
	public String index(
//			@RequestParam("page") int page, 
//			@RequestParam("limit") int limit, 
			ModelMap model) {
		List<Brand> brands = service.fetchAll();
//		List<Category> categories = categoryService.fetchAll();
//		List<Image> images=new ArrayList<>();
//		List<Category> categories = categoryService.fetchAllProduct();
//		Integer pagesize = 3;
//		Integer pageTotal = (int)Math.ceil((double)categories.size()/pagesize);
//		List<PageResponse<Category>> pages = new ArrayList<PageResponse<Category>>();
//		for(int i = 0; i < pageTotal; i++) {
//			pages.add(categoryService.fetchPageTopSelling(i, i == pageTotal-1 ? categories.size()-(i*pagesize) : pagesize));
//		}
		model.addAttribute("brands", brands);
		List<CategoryNewProduct> categoriesNewProduct = categoryService.getCategoryNewProduct();
		model.addAttribute("categoriesNewProduct", categoriesNewProduct);
//		for(Category category : categories) {
//			Image image = imageService.findFirstImageByCategoryId(category.getId());
//			images.add(image);
//        }
		List<CategoryTopSelling> cateTopSellings = categoryService.getTopSelling();
		System.out.println(cateTopSellings);
		model.addAttribute("cateTopSellings", cateTopSellings);
//		model.addAttribute("pages", pages);
		
		LocalDateTime countDownDate = LocalDateTime.of(2020, Month.JANUARY, 5, 15, 37, 25, 0);
		model.addAttribute("countDownDate", countDownDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss")).toString());
		return "home/pages/home";	
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
