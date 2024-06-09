package com.ecommerce.service;

public interface MailerService {
	public void send(String from, String to, String subject, String body);
}
