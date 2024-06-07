<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard - Orders </title>
    
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
                        <h4>Orders</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Order List</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Customer</th>
                                                <th>Total Amount</th>
                                                <th>Order Date</th>
                                                <th>Details</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>John Smith</td>
                                                <td>$8500</td>
                                                <td>2024-05-27</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Jane Doe</td>
                                                <td>$7800</td>
                                                <td>2024-05-26</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Lew Shawon</td>
                                                <td>$500</td>
                                                <td>2024-05-25</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Louis</td>
                                                <td>$1500</td>
                                                <td>2024-05-30</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Leomord Harley</td>
                                                <td>$2300</td>
                                                <td>2024-06-07</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Layla Sodie</td>
                                                <td>$230</td>
                                                <td>2024-05-12</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>Parile Thomas</td>
                                                <td>$1200</td>
                                                <td>2024-05-30</td>
                                                <td><button class="btn btn-primary" onclick="viewDetails()">Details</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
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
        function viewDetails() {
            window.location.href = '${pageContext.request.contextPath}/admin/orderDetails.htm';
        }
    </script>

</body>

</html>