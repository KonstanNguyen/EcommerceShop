package com.ecommerce.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Cart {
	@Id
	private String id;
	@ManyToOne
	@JoinColumn(name = "userId")
	private EcoUser user;
	private boolean status;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
	private Date createTime;

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private Collection<Orders> orders;


	public EcoUser getUsername() {
		return user;
	}

	public void setUsername(EcoUser user) {
		this.user = user;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Collection<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Orders> orders) {
		this.orders = orders;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public EcoUser getUser() {
		return user;
	}

	public void setUser(EcoUser user) {
		this.user = user;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
