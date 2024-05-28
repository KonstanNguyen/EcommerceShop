package com.ecommerce.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class Orders {

	@EmbeddedId
	private OrderId id;
	private int quantity;
	private int invoiceId;

	public OrderId getId() {
		return id;
	}

	public void setId(OrderId id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

}
