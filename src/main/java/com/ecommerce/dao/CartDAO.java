package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Cart;

public interface CartDAO {
	public List<Cart> fetchAll();
	public Cart find(int id);
}
