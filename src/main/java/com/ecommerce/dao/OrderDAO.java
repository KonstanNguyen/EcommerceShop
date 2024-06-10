package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Category;
import com.ecommerce.entity.Orders;

public interface OrderDAO {
	public List<Orders> getOrdersByCartId(int id);
	public Orders findByID(int orderId);
	public void saveOrder(Orders order);
	public void updateOrder(Orders order);
	public void deleteOrder(Orders order);
	public void updateQuantity(int orderID,int quantity);
}
