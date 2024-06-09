package com.ecommerce.bean;

import java.util.List;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Invoice;
import com.ecommerce.entity.Orders;

public class Mailer {
	private String title;
	private String body;
	
	public Mailer(Cart cart, Invoice invoice) {
		this.title = null;
		this.body = generateOrderSummaryHtml(cart, invoice);
	}
	
	private String generateOrderSummaryHtml(Cart cart, Invoice invoice) {
        // Tạo nội dung email dựa trên thông tin trong giỏ hàng
        StringBuilder html = new StringBuilder();
        html.append("<h2>Thank you for your order!</h2>");
        html.append("<h3>Your order information:</h3>");
        html.append("<p>Order code:#<p/>").append(cart.getId());
        html.append("<p>Product information<p/>");
        html.append("<table>");
        html.append("<tr><th>Product</th><th>Quantity</th><th>Promotion</th><th>Price</th></tr>");
        for (Orders item : cart.getOrders()) {
            html.append("<tr>");
            html.append("<td>").append(item.getCategory().getTitle()).append("</td>");
            html.append("<td>").append(item.getQuantity()).append("</td>");
            html.append("<td>").append(item.getTotalPromotion()).append("</td>");
            html.append("<td>").append(item.getCategory().getPromotionPrice()).append("</td>");
            html.append("</tr>");
        }
        html.append("</table>");
		html.append("<p>Total: ").append(invoice.getTotalAmount()).append("</p>"); 
        return html.toString();
    }
	
	public String getBody() {
		return body;
	}
}
