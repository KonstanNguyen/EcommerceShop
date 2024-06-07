package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Orders;

public interface OrderService {
	public List<Orders> getOrdersByCartId(int id);

	public Orders findByID(int orderId);
	
	public void saveOrder(Orders order);

	public void updateOrder(Orders order);

	public void deleteOrder(Orders order);
}
