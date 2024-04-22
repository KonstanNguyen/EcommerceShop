package com.ecommerce.dto.request;

public class RequestDTO<T> {
	
	private T data;
	
	public RequestDTO(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
