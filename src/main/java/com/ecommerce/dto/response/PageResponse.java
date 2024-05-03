package com.ecommerce.dto.response;

import java.util.List;

public class PageResponse<T> {
	private int pageNo;
	private int pageSize;
	private int totalPage;
	private List<T> items;
	
	public PageResponse(int pageNo, int pageSize, int totalPage, List<T> items) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}
}
