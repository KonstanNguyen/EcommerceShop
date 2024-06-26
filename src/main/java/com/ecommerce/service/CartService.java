package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Cart;

public interface CartService {
	public Cart findCartByUserId(int userId);
	public Cart findById(int carId);
	public void saveCart(Cart cart);
	public List<Object[]> getCartDetails();
	public List<Cart> fetchAll();
	public Cart find(int id);
	public Cart findCartUnpurchased(int id); 
	public boolean updateCart(Cart cart);
}
