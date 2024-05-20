package com.ecommerce.dto.response;

import java.math.BigInteger;

import com.ecommerce.entity.Image;

public class CategoryDTO {
	private int id;
	private String title;
	private BigInteger price;
	private BigInteger promotionPrice;
	private Image image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BigInteger getPrice() {
		return price;
	}
	public void setPrice(BigInteger price) {
		this.price = price;
	}
	public BigInteger getPromotionPrice() {
		return promotionPrice;
	}
	public void setPromotionPrice(BigInteger promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	
}
