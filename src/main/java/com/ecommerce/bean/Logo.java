package com.ecommerce.bean;

public class Logo {
	private String baseUrl;
	private String fileName;
	private String fileExtention;
	
	public Logo() {}
	
	public Logo(String baseUrl, String fileName, String fileExtention) {
		this.baseUrl = baseUrl;
		this.fileName = fileName;
		this.fileExtention = fileExtention;
	}

	public String getBaseUrl() {
		return baseUrl;
	}

	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileExtention() {
		return fileExtention;
	}

	public void setFileExtention(String fileExtention) {
		this.fileExtention = fileExtention;
	}
	
	public String getUrl() {
		return baseUrl + fileName + "." + fileExtention;
	}

	@Override
	public String toString() {
		return "Logo [baseUrl=" + baseUrl + ", fileName=" + fileName + ", fileExtention=" + fileExtention + "]";
	}

}
