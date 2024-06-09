package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.OrderDAO;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;

	@Override
	public List<Orders> getOrdersByCartId(int id) {
		return dao.getOrdersByCartId(id);
	}

	@Override
	public Orders findByID(int orderId) {
		return dao.findByID(orderId);
	}

	@Override
	public void deleteOrder(Orders order) {
		dao.deleteOrder(order);
	}

	@Override
	public void updateOrder(Orders order) {
		dao.updateOrder(order);
	}

	@Override
	public void saveOrder(Orders order) {
		dao.saveOrder(order);
	}
	@Override
	public void updateQuantity(int orderID, int quantity) {
		dao.updateQuantity(orderID, quantity);
	}
}
