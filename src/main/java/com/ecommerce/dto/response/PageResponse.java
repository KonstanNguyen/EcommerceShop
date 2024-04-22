package com.ecommerce.dto.response;

public class PageResponse<T> {
	private int pageNo;
	private int pageSize;
	private int totalPage;
	private T items;

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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public T getItems() {
		return items;
	}

	public void setItems(T items) {
		this.items = items;
	}
}
