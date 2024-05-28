package com.ecommerce.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
class OrderId implements Serializable {
	private static final long serialVersionUID = 1184490793704427286L;
	
	@ManyToOne
	@JoinColumn(name = "cart_id")
	private Cart cart;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
