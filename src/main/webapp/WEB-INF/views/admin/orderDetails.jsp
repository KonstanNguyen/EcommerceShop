<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard - Order Details </title>
    
	<%@ include file="../admin/layout/link.jsp" %>
    
    
</head>

<body>

	<%@ include file="../admin/layout/preloader.jsp" %>

	<div id="main-wrapper">
	
		<%@ include file="../admin/layout/header.jsp" %>
	
	
		<%@ include file="../admin/layout/sidebar.jsp" %>
	    
	    <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col p-0">
                        <h4>Order Details</h4>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Order ID: ${cart.id}</h4>
                                <p>Customer: ${user.name}</p>
                                <p>Order Date: ${cart.createTime}</p>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product Name</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="order" items="${orders}">
	                                            <tr>
	                                                <td>${order.category.title}</td>
	                                                <td>${order.quantity}</td>
	                                                <td>${order.category.promotionPrice}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <button class="btn btn-secondary" onclick="goBack()">Back</button>
                            </div>
                        </div>
                    </div>
                </div>
    
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
	    <%@ include file="../admin/layout/footer.jsp" %>
	    
	    
    </div>


	<%@ include file="../admin/layout/script.jsp" %>
	
	<script type="text/javascript">
        function goBack() {
            window.location.href = '${pageContext.request.contextPath}/admin/orders.htm';
        }
    </script>


</body>

</html>