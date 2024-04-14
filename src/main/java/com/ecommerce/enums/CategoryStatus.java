package com.ecommerce.enums;

public enum CategoryStatus {
	AVAILABLE("AVAILABLE"),
	DELETED("DELETED");
	
	public String value;
	
	CategoryStatus(String value){
		this.value = value;
	}
}
