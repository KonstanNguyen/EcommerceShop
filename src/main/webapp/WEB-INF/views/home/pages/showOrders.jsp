<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="${ pageContext.servletContext.contextPath }/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .order-item {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
        }
        .order-item h5 {
            font-weight: bold;
        }
        .order-item p {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <h1>Your Orders</h1>
        <c:forEach var="orderDetail" items="${orderDetails}">
            <div class="order-item">
                <h5>Order #${orderDetail.cartId}</h5>
                <p>Placed on: ${orderDetail.createTime}</p>
                <p>Total: ${orderDetail.total}</p>
                <h6>Items</h6>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Promotion</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orderDetail.orders}">
                            <tr>
                                <td>${order.category.title}</td>
                                <td>${order.quantity}</td>
                                <td>$${order.category.promotionPrice}</td>
                                <td>${order.totalPromotion }</td>
                                <td>$${ order.quantity*order.category.promotionPrice *(100 - order.totalPromotion)/100 }</td>
                            </tr>
                        </c:forEach>
                        
                    </tbody>
                </table>
            </div>
        </c:forEach>
<%--         <c:forEach var="cart" items="${ orders.cart }"> --%>
<!--         	<div class="order-item"> -->
<!--                 <h5>Order #${cart.id}</h5> -->
<%--                 <p>Placed on: ${cart.createTime}</p> --%>
<!--                 <h6>Items</h6> -->
<!--                 <table class="table table-striped"> -->
<!--                     <thead> -->
<!--                         <tr> -->
<!--                             <th>Product</th> -->
<!--                             <th>Quantity</th> -->
<!--                             <th>Price</th> -->
<!--                             <th>Total</th> -->
<!--                         </tr> -->
<!--                     </thead> -->
<!--                     <tbody> -->
<%--                         <c:forEach var="order" items="${orders}"> --%>
<!--                             <tr> -->
<%--                                 <td>${order.category.title}</td> --%>
<%--                                 <td>${order.quantity}</td> --%>
<!--                                 <td>$${order.category.price}</td> -->
<!--                                 <td>$${order.quantity * order.category.price}</td> -->
<!--                             </tr> -->
<%--                         </c:forEach> --%>
                        
<!--                     </tbody> -->
<!--                 </table> -->
<!--             </div> -->
<%--         </c:forEach> --%>
    </div>
</body>
</html>