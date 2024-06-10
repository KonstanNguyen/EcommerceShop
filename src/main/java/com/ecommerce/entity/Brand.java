package com.ecommerce.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Check;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Check(constraints = "name IS NOT NULL" )
public class Brand {
	@Id
	@GeneratedValue
	private int id;
	@NotNull(message = "Khong duoc de trong")
	@NotBlank(message = "khong duoc de trong")
	@NotEmpty(message = "Khong duoc de trong")
	private String name;
	@OneToMany(mappedBy = "brand", fetch = FetchType.EAGER)
	private Collection<Category> categories;
		
	public Brand() {}
		
	public Brand(String name) {
		super();
		this.name = name;
	}

	public Brand(int id, String name, Collection<Category> categories) {
		super();
		this.id = id;
		this.name = name;
		this.categories = categories;
	}
	public int getid() {
		return id;
	}
	public void setid(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Collection<Category> getCategories() {
		return categories;
	}
	public void setCategories(Collection<Category> categories) {
		this.categories = categories;
	}
}
