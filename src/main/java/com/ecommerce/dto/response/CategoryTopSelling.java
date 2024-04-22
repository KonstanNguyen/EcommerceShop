package com.ecommerce.dto.response;

import java.math.BigInteger;

import com.ecommerce.entity.Image;

public class CategoryTopSelling {
	private int id;
	private BigInteger price;
	private BigInteger promotionPrice;
	private String brandName;
	private Image images;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Image getImages() {
		return images;
	}

	public void setImages(Image images) {
		this.images = images;
	}
}
