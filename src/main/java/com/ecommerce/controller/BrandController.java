package com.ecommerce.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.bean.Company;
import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Orders;
import com.ecommerce.entity.Promotion;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.OrderService;
import com.ecommerce.service.PromotionService;
import com.ecommerce.service.UserService;

@Controller
@RequestMapping("brands")
public class BrandController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	Company company;

	@Autowired
	BrandService brandService;

	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService UserSevice;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	@Autowired
	PromotionService promotionService;
	
	@RequestMapping
	public String index(ModelMap model) {
		List<Brand> brands = brandService.fetchAll();
		model.addAttribute("brands", brands);
		
		List<CategoryNewProduct> categoriesNewProduct = categoryService.getCategoryNewProduct();
		model.addAttribute("categoriesNewProduct", categoriesNewProduct);
		
		Promotion promotion = promotionService.fetchAll().stream()
				.sorted(Comparator.<Promotion, Short>comparing(pro->pro.getDealPercent(), Comparator.reverseOrder()))
				.findFirst().get();
		model.addAttribute("promotion", promotion);
		
		Date endTime = promotion.getEndTime();
		LocalDateTime countDownDate = endTime.toInstant()
			      .atZone(ZoneId.systemDefault())
			      .toLocalDateTime();
		String stringDate = countDownDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")).toString();
		System.out.println(stringDate);
		model.addAttribute("countDownDate", stringDate);
		
		return "home/pages/home";
		
	}
	@RequestMapping("all")
	public String allProducts(ModelMap model) {
		List<Category> categories = categoryService.fetchAllProduct();
		List<Brand> brands = brandService.fetchAll();
		model.addAttribute("brands", brands);
		model.addAttribute("categories", categories);

		return "home/pages/all";
	}
	
	@RequestMapping("all/promotion/{id}")
	public String allProductsHasPromotionId(ModelMap model, @PathVariable("id")int id) {
		Promotion promotion = promotionService.findByID(id);
		List<Category> categories = promotion.getCategories().stream().toList();
		model.addAttribute("categories", categories);

		return "home/pages/all";
	}

	@RequestMapping(value = { "", "all" }, method = RequestMethod.POST)
	public String addToCartinAll(@RequestParam("categoryid") int categoryid, HttpSession session) {

		String referer = request.getHeader("referer");
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return "pages/login";
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		Orders order = new Orders();
		order.setCarts(cart);
		order.setCategories(categoryService.findByID(categoryid));
		List<Orders> orders = cart.getOrders().stream().distinct().collect(Collectors.toList());
		for (Orders o : orders)
			if (o.getCategories().getId() == categoryid) {
				o.setQuantity(o.getQuantity() + 1);
				orderService.updateOrder(o);
				if (referer != null) {
					return "redirect:" + referer;
				}
			}
		order.setQuantity(1);
		orderService.saveOrder(order);
		return "redirect:" + referer;
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchbyCategory(@RequestParam("search") String value, ModelMap model) {
		List<Category> categories = categoryService.fetchAllProduct();
		List<Category> searchCategories = categories.stream()
				.filter(t -> t.getTitle().toLowerCase().contains(value.toLowerCase())).collect(Collectors.toList());
		searchCategories = categoryService.searchCategory(value);
		model.addAttribute("categories", searchCategories);
		return "home/pages/all";
	}
	@RequestMapping(value="all/filterProductsByBrand", method = RequestMethod.GET)
	public String filterProduct(@RequestParam(value = "brandIds", required = false) List<Long> brandIds, ModelMap model) {
        if (brandIds == null) {
            brandIds = new ArrayList<>();
        };
        List<Category> categories = new ArrayList<>();
		for (Long brandId : brandIds) {
			categories.addAll(categoryService.findCategoryByBrandId(brandId.intValue()));
		}
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brandService.fetchAll());
		model.addAttribute("selectedBrandIds", brandIds);
		
		return "home/pages/all";
	}

	@ModelAttribute("cateTopSellings")
	public List<CategoryTopSelling> getTopSelling() {
		return categoryService.getTopSelling();
	}

	@ModelAttribute("company")
	public Company getCompany() {
		return company;
	}

	@ModelAttribute("orders")
	public List<Orders> getOrder(HttpSession session) {
		// Lấy user từ session
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return null;
		}

		// Tìm cart theo userId
		Cart cart = cartService.findCartByUserId(user.getId());
		if (cart == null) {
			// Nếu không có cart hiện tại, tạo một cart mới
			Cart newCart = new Cart();
			newCart.setUser(user);
			newCart.setStatus(false); // Giỏ hàng còn hoạt động
			newCart.setCreateTime(java.sql.Date.valueOf(LocalDate.now()));
			cartService.saveCart(newCart);
			cart = newCart;

			// Trả về đơn hàng của giỏ hàng mới
			List<Orders> orders = orderService.getOrdersByCartId(newCart.getId());
			return orders;
		}


		// Nếu cart hiện tại đã hoàn thành (status = true), tạo một cart mới
		if (cart.isStatus() == true) {
			Cart newCart = new Cart();
			newCart.setUser(user);
			newCart.setStatus(false); // Giỏ hàng còn hoạt động
			newCart.setCreateTime(java.sql.Date.valueOf(LocalDate.now()));
			cartService.saveCart(newCart);

			// Trả về đơn hàng của giỏ hàng mới
			List<Orders> orders = orderService.getOrdersByCartId(newCart.getId());
			return orders;
		}

		// Trả về đơn hàng của giỏ hàng hiện tại (status = false)
		List<Orders> orders = orderService.getOrdersByCartId(cart.getId());
		return orders;
	}

	@ModelAttribute("totalItem")
	public int getTotalItem(HttpSession session) {
		// THêm vào giỏ hàng
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return 0;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		if (cart == null) {
			cart = new Cart(user, false, java.sql.Date.valueOf(LocalDate.now()));
			cartService.saveCart(cart);
		}
		List<Orders> orders = orderService.getOrdersByCartId(cart.getId());
		return orders.size();
	}

	@ModelAttribute("total")
	public BigDecimal getTotal(HttpSession session) {
		BigDecimal total = BigDecimal.ZERO;
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return BigDecimal.ZERO;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		if (cart == null) {
			cart = new Cart(user, false, java.sql.Date.valueOf(LocalDate.now()));
			cartService.saveCart(cart);
		}
		List<Orders> orders = orderService.getOrdersByCartId(cart.getId());

		for (Orders order : orders) {
			Short totaldealPercent = 0;
			if (order.getCategories().getPromotion() != null) {
				Date now = new Date();
				totaldealPercent = order.getCategories().getPromotion().stream().distinct()
						.filter(p -> p.getStartTime().before(now) && p.getEndTime().after(now))
						.map(p -> p.getDealPercent()).reduce((short) 0, (a, b) -> (short) (a + b));
			}

			BigDecimal percent = new BigDecimal(100 - totaldealPercent).divide(new BigDecimal(100));
			if (order.getCategories().getPromotionPrice() != null) {
				total = total.add(new BigDecimal(
						order.getCategories().getPromotionPrice().multiply(new BigInteger(order.getQuantity() + "")))
						.multiply(percent));
			} else {
				total = total.add(new BigDecimal(
						order.getCategories().getPrice().multiply(new BigInteger(order.getQuantity() + "")))
						.multiply(percent));
			}
		}
		return total;
	}

	/*
	 * @RequestMapping(method = RequestMethod.POST) public String
	 * deleteOrder(@RequestParam("id") int orderId, HttpSession session) { EcoUser
	 * user = (EcoUser) session.getAttribute("user"); if
	 * (session.getAttribute("user") == null) { return "Error here "; } Orders order
	 * = orderService.findByID(orderId); orderService.deleteOrder(order); return
	 * "redirect:/product.htm"; }
	 */

}
