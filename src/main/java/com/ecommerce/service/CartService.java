package com.ecommerce.service;

import com.ecommerce.entity.Cart;

public interface CartService {
	public Cart findCartByUserId(int userId);
	public void saveCart(Cart cart);
}
