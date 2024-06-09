package com.ecommerce.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Category;
import com.ecommerce.entity.Promotion;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.PromotionService;

@Controller
@RequestMapping("/admin/promotions")
public class AdminPromotionController {
	@Autowired
	PromotionService promotionService;

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/addPromotion")
    public String addPromotion(HttpServletRequest request) {
		short percent = Short.valueOf(request.getParameter("percent"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		Promotion p = new Promotion(percent, 0, true);
		try {
			Date startTime = formatter.parse(request.getParameter("startTime"));
			Date endTime = formatter.parse(request.getParameter("endTime"));
			p.setStartTime(startTime);
			p.setEndTime(endTime);
			Date now = new Date();
			p.setCreatedTime(now);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		promotionService.addPromotion(p);
        return "redirect:/admin/promotions.htm";
    }

	@RequestMapping("/addProductPromotion")
    public String addProductPromotion(HttpServletRequest request) {
		Promotion promotion = promotionService.findByID(Integer.valueOf(request.getParameter("promotionId")));
		Category c = categoryService.findByID(Integer.valueOf(request.getParameter("productName")));
		Collection<Category> categories = promotion.getCategories();
		categories.add(c);
		promotion.setCategories(categories);
		
		promotionService.updatePromotion(promotion);
		
        return "redirect:/admin/promotions.htm";
    }

	@RequestMapping(value = "/edit/{id}")
	public String updatePromotion(@PathVariable("id") int promotionId, HttpServletRequest request) {
		Promotion p = promotionService.findByID(promotionId);
		p.setDealPercent(Short.valueOf(request.getParameter("percent")));

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		try {
			Date startTime = formatter.parse(request.getParameter("startTime"));
			p.setStartTime(startTime);

			Date endTime = formatter.parse(request.getParameter("endTime"));
			p.setEndTime(endTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		p.setStatus(Boolean.valueOf(request.getParameter("status")));
		System.out.println("Status: " + p.getStatus());
		p.setQuantity(0);
		System.out.println("Promo: " + p.getCreatedTime());
		promotionService.updatePromotion(p);

		return "redirect:/admin/promotions.htm";
	}

	@RequestMapping("/offPromotion/{id}")
	public String offPromotion(@PathVariable("id") int promotionId, Model model) {
		Promotion p = promotionService.findByID(promotionId);
		p.setStatus(false);
		promotionService.updatePromotion(p);
		return "redirect:/admin/promotions.htm";
	}
	
	@RequestMapping("/delete/{id}")
	public String deletePromotion(@PathVariable("id") int promotionId, Model model) {
		Promotion p = promotionService.findByID(promotionId);
		promotionService.deletePromotion(p);
		return "redirect:/admin/promotions.htm";
	}
}
