package com.ecommerce.consts;

public enum CategoryStatus {
	AVAILABLE("AVAILABLE"),
	DELETED("DELETED");
	
	public String value;
	
	CategoryStatus(String value){
		this.value = value;
	}
}
