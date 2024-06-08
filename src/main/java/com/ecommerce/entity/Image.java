package com.ecommerce.entity;

import javax.persistence.*;

@Entity
public class Image {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String url;
	@ManyToOne
	@JoinColumn(name="category_Id")
	private Category category;
	
	
	
	@Override
	public String toString() {
		return "Image [id=" + id + ", url=" + url + ", category=" + category + "]";
	}

	public Image() {}
	
	public Image(String url) {
		super();
		this.url = url;
	}
	
	public Image(String url, Category category) {
		super();
		this.url = url;
		this.category = category;
	}

	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return this.url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

	
}
