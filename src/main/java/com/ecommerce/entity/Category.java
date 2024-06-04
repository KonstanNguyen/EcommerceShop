package com.ecommerce.entity;

import java.math.BigInteger;
import java.util.Collection;
import java.util.Set;

import javax.persistence.Column;
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
import javax.persistence.OneToMany;

import com.ecommerce.consts.CategoryStatus;

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
	@Column(nullable = true)
	private BigInteger promotionPrice;
	private int warrantyTime;
	private String description;
	@ManyToOne
	@JoinColumn(name = "brandId")
	private Brand brand;
	@Enumerated(EnumType.STRING)
	private CategoryStatus status;
	private float starts;
	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private Collection<Image> images;

//	@Column(nullable = true)
//	private int createBy;
//	@Column(nullable = true)
//	private Date createTime;
//	@Column(nullable = true)
//	private int updateBy;
//	@Column(nullable = true)
//	private Date updateTime;

	@ManyToMany(mappedBy = "categories", fetch = FetchType.EAGER)
	private Set<Need> needs;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private Collection<Categories_Suppliers> categories_suppliers;

	@OneToMany(mappedBy = "id.category", fetch = FetchType.LAZY)
	private Collection<Orders> orders;

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

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public CategoryStatus getStatus() {
		return status;
	}

	public void setStatus(CategoryStatus status) {
		this.status = status;
	}

	public Set<Need> getNeeds() {
		return needs;
	}

	public void setNeeds(Set<Need> needs) {
		this.needs = needs;
	}

	public float getStarts() {
		return starts;
	}

	public void setStarts(float starts) {
		this.starts = starts;
	}

	public Collection<Image> getImages() {
		return images;
	}

	public void setImages(Collection<Image> images) {
		this.images = images;
	}

	public Collection<Categories_Suppliers> getCategories_suppliers() {
		return categories_suppliers;
	}

	public void setCategories_suppliers(Collection<Categories_Suppliers> categories_suppliers) {
		this.categories_suppliers = categories_suppliers;
	}

	public Collection<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Orders> orders) {
		this.orders = orders;
	}

}
