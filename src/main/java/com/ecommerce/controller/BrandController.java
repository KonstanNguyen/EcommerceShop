package com.ecommerce.controller;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.bean.Company;
import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.OrdersService;

@Controller
@RequestMapping("brands")
public class BrandController {
	
	@Autowired
	Company company;

	@Autowired
	BrandService service;

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	OrdersService ordersService;

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

//		model.addAttribute("pages", pages);
		return "home/pages/home";
//		return "pages/login";
	}

	@RequestMapping("all")
	public String allProducts(ModelMap model) {
		List<Category> categories = categoryService.fetchAllProduct();
		model.addAttribute("categories", categories);

		return "home/pages/all";
	}

	@ModelAttribute("cateTopSellings")
	public List<CategoryTopSelling> getTopSelling() {
		return categoryService.getTopSelling();
	}

	@ModelAttribute("countDownDate")
	public String getCountDownDate() {
		LocalDateTime countDownDate = LocalDateTime.of(2020, Month.JANUARY, 5, 15, 37, 25, 0);
		return countDownDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss")).toString();
	}
	
	@ModelAttribute("company")
	public Company getCompany() {
		return company;
	}
	
	@ModelAttribute("orders")
	public List<Orders> getOrders() {
		return ordersService.getOrdersByCartId(1);
	}
}
