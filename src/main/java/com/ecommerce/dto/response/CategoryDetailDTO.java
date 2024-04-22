package com.ecommerce.dto.response;

import java.math.BigInteger;
import java.util.List;

import com.ecommerce.entity.Image;
import com.ecommerce.entity.Need;

public class CategoryDetailDTO {
	private int id;
	private String title;
	private String CPU;
	private String RAM;
	private String HARDWARE;
	private String CARD;
	private String SCREEN;
	private String OS;
	private boolean hot;
	private BigInteger price;
	private BigInteger promotionPrice;
	private int warrantyTime;
	private String description;
	private String brandName;
	private String status;
	private Byte starts;
	private List<Image> images;
	private List<Need> needs;

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

	public String getCPU() {
		return CPU;
	}

	public void setCPU(String cPU) {
		CPU = cPU;
	}

	public String getRAM() {
		return RAM;
	}

	public void setRAM(String rAM) {
		RAM = rAM;
	}

	public String getHARDWARE() {
		return HARDWARE;
	}

	public void setHARDWARE(String hARDWARE) {
		HARDWARE = hARDWARE;
	}

	public String getCARD() {
		return CARD;
	}

	public void setCARD(String cARD) {
		CARD = cARD;
	}

	public String getSCREEN() {
		return SCREEN;
	}

	public void setSCREEN(String sCREEN) {
		SCREEN = sCREEN;
	}

	public String getOS() {
		return OS;
	}

	public void setOS(String oS) {
		OS = oS;
	}

	public boolean isHot() {
		return hot;
	}

	public void setHot(boolean hot) {
		this.hot = hot;
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

	public int getWarrantyTime() {
		return warrantyTime;
	}

	public void setWarrantyTime(int warrantyTime) {
		this.warrantyTime = warrantyTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Byte getStarts() {
		return starts;
	}

	public void setStarts(Byte starts) {
		this.starts = starts;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public List<Need> getNeeds() {
		return needs;
	}

	public void setNeeds(List<Need> needs) {
		this.needs = needs;
	}
}
