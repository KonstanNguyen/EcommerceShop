package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Cart;

public interface CartService {
	public List<Cart> fetchAll();
	public Cart find(int id);
	public Cart findCartUnpurchased(int id); 
	public boolean updateCart(Cart cart);
}
