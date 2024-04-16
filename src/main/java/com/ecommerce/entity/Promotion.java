package com.ecommerce.entity;

import java.util.Collection;
import java.util.Date;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Promotion {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private short dealPercent;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date startTime;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date endTime;
	private int quantity;
	private String status;
	@ManyToOne
	@JoinColumn(name = "createBy")
	private Employee createBy;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date createTime;
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "Categories_Promotions", joinColumns = @JoinColumn(name = "promotionId"), 
	inverseJoinColumns = @JoinColumn(name = "categoryId"))
	private Collection<Category> categories;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public short getDealPercent() {
		return dealPercent;
	}
	public void setDealPercent(short dealPercent) {
		this.dealPercent = dealPercent;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quatity) {
        this.quantity = quatity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public Employee getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Employee createBy) {
		this.createBy = createBy;
	}
	public Date getCreatedTime() {
		return createTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createTime = createdTime;
	}
	
}
