<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
 
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
                                <h4 class="card-title">Order ID: 12345</h4>
                                <p>Customer: Nguyễn Văn A</p>
                                <p>Order Date: 2024-05-27</p>
                                <p>Total Amount: 8,500,000 VND</p>
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
                                            <tr>
                                                <td>Điện thoại Samsung Galaxy S21</td>
                                                <td>1</td>
                                                <td>20,000,000 VND</td>
                                            </tr>
                                            <tr>
                                                <td>Tai nghe Bluetooth Sony</td>
                                                <td>2</td>
                                                <td>3,500,000 VND</td>
                                            </tr>
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