package com.ecommerce.consts;

public enum CartStatus {
	AVAILABLE("AVAILABLE"),
	DELETED("DELETED");
	
	public String value;
	
	CartStatus(String value){
		this.value = value;
	}
}
