package com.ecommerce.entity;

import java.math.BigInteger;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.ecommerce.enums.CategoryStatus;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
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
	@ManyToOne
	@JoinColumn(name="brandId")
	private Brand brand;
	private int createBy;
	private Date createTime;
	private int updateBy;
	private Date updateTime;
	@Enumerated(EnumType.STRING)
	private CategoryStatus status;
	
	@ManyToMany(mappedBy = "categories", fetch = FetchType.EAGER)
	private Collection<Need> needs;
	
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
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Collection<Need> getneeds() {
		return needs;
	}
	public void setneeds(Collection<Need> needs) {
		this.needs = needs;
	}
	public BigInteger getPromotionPrice() {
		return promotionPrice;
	}
	public void setPromotionPrice(BigInteger promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	public int getCreateBy() {
		return createBy;
	}
	public void setCreateBy(int createBy) {
		this.createBy = createBy;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public CategoryStatus getStatus() {
		return status;
	}
	public void setStatus(CategoryStatus status) {
		this.status = status;
	}
	public Collection<Need> getNeeds() {
		return needs;
	}
	public void setNeeds(Collection<Need> needs) {
		this.needs = needs;
	}
}
