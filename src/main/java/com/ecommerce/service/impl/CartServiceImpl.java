package com.ecommerce.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.entity.Cart;
import com.ecommerce.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDAO dao;
	public Cart find(int id) {
		return dao.find(id);
	}
}
