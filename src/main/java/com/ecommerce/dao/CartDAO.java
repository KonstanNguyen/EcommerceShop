package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Cart;

public interface CartDAO {
	public List<Cart> fetchAll();
	public void saveCart(Cart cart);
	public Cart findCartByUserId(int userId);
	public Cart find(int id);
	public Cart findCartUnpurchased(int id); 
	public boolean updateCart(Cart cart);
}
