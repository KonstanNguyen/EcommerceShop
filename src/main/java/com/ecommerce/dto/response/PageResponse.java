package com.ecommerce.dto.response;

import java.util.Collection;

public class PageResponse<T> {
	private int pageNo;
	private int pageSize;
	private Collection<T> items;
	
	public PageResponse() {}
	
	public PageResponse(int pageNo, int pageSize) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	
	public PageResponse(int pageNo, int pageSize, Collection<T> items) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.items = items;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Collection<T> getItems() {
		return items;
	}

	public void setItems(Collection<T> items) {
		this.items = items;
	}
}
