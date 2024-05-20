package com.ecommerce.entity;

public class Order {
	private int cartId;
	private int categoryId;
	private int quantity;
	private int shippperId;
	private int invoiceId;
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getShippperId() {
		return shippperId;
	}
	public void setShippperId(int shippperId) {
		this.shippperId = shippperId;
	}
	public int getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}
	
}
