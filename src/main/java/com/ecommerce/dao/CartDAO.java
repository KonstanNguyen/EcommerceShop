package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Cart;

public interface CartDAO {
	public List<Cart> fetchAll();
	public void saveCart(Cart cart);
	public Cart findCartByUserId(int userId);
	public Cart findById(int cartId);
	
	public List<Object[]> getCartDetails();
}
