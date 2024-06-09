package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.entity.Cart;
import com.ecommerce.service.CartService;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDAO dao;
	@Override
	public Cart findCartByUserId(int userId) {
		return dao.findCartByUserId(userId);
	}
	@Override
	public void saveCart(Cart cart) {
		dao.saveCart(cart);
	}
	@Override
	public List<Object[]> getCartDetails() {
		return dao.getCartDetails();
	}
	@Override
	public Cart findById(int carId) {
		return dao.findById(carId);
	}
	
	@Override
	public List<Cart> fetchAll(){
		return dao.fetchAll();
	}
	
	public Cart findCartUnpurchased(int id) {
		return dao.findCartUnpurchased(id);
	}
	
	public boolean updateCart(Cart cart) {
		return dao.updateCart(cart);
	}
	@Override
	public Cart find(int id) {
		return findById(id);
	}
}
