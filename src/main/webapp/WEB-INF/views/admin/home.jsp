<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>     

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard</title>
    
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
	            <!-- row -->
	            <div class="container-fluid">
	                <div class="row">
	                 
	                    <div class="col-lg-4 col-sm-6">
	                        <div class="card">
	                            <div class="stat-widget-two card-body">
	                                <div class="stat-content">
	                                    <div class="stat-text">Tổng thu nhập</div>
	                                    <div class="stat-digit"> <i class="fa fa-usd"></i>${total_amount}</div>
	                                </div>
	                                <div class="progress">
	                                    <div class="progress-bar progress-bar-success w-100" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
	                        <div class="card">
	                            <div class="stat-widget-two card-body">
	                                <div class="stat-content">
	                                    <div class="stat-text">Tổng hóa đơn</div>
	                                    <div class="stat-digit"> <i class="fa fa-usd"></i>${invoices.size()}</div>
	                                </div>
	                                <div class="progress">
	                                    <div class="progress-bar progress-bar-warning w-100" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
	                        <div class="card">
	                            <div class="stat-widget-two card-body">
	                                <div class="stat-content">
	                                    <div class="stat-text">Người dùng</div>
	                                    <div class="stat-digit"> <i class="fa fa-usd"></i>${users.size()}</div>
	                                </div>
	                                <div class="progress">
	                                    <div class="progress-bar progress-bar-danger w-100" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- /# card -->
	                    </div>
	                    <!-- /# column -->
	                </div>
	                <div class="row">
	                    <div class="col-xl-8 col-lg-8 col-md-8">
	                        <div class="card">
	                            <div class="card-header">
	                                <h4 class="card-title">Sales Overview</h4>
	                            </div>
	                            <div class="card-body">
	                                <div class="row">
	                                    <div class="col-xl-12 col-lg-8">
	                                        <div id="morris-bar-chart"></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-4">
	                        <div class="card">
	                            <div class="card-body text-center">
	                                <div class="m-t-10">
	                                    <h4 class="card-title">Customer Feedback</h4>
	                                    <h2 class="mt-3">385749</h2>
	                                </div>
	                                <div class="widget-card-circle mt-5 mb-5" id="info-circle-card">
	                                    <i class="ti-control-shuffle pa"></i>
	                                </div>
	                                <ul class="widget-line-list m-b-15">
	                                    <li class="border-right">92% <br><span class="text-success"><i
	                                                class="ti-hand-point-up"></i> Positive</span></li>
	                                    <li>8% <br><span class="text-danger"><i
	                                                class="ti-hand-point-down"></i>Negative</span></li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="row">
	                    
	                    <div class="col-lg-6">
	                        <div class="card">
	                            <div class="card-header">
	                                <h4 class="card-title">Product Sold</h4>
	                                <div class="card-action">
	                                    <div class="dropdown custom-dropdown">
	                                        <div data-toggle="dropdown">
	                                            <i class="ti-more-alt"></i>
	                                        </div>
	                                        <div class="dropdown-menu dropdown-menu-right">
	                                            <a class="dropdown-item" href="#">Option 1</a>
	                                            <a class="dropdown-item" href="#">Option 2</a>
	                                            <a class="dropdown-item" href="#">Option 3</a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="card-body">
	                                <div class="chart py-4">
	                                    <canvas id="sold-product"></canvas>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-6">
	                        <div class="card">
	                            <div class="card-header">
	                                <h4 class="card-title">New Orders</h4>
	                            </div>
	                            <div class="card-body">
	                                <div class="table-responsive">
	                                    <table class="table mb-0">
	                                        <thead>
	                                            <tr>
	                                                <th>#</th>
	                                                <th>Name</th>
	                                                <th>Product</th>
	                                                <th>quantity</th>
	                                                <th>Status</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>
	                                                    <div class="round-img">
	                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
	                                                    </div>
	                                                </td>
	                                                <td>Lew Shawon</td>
	                                                <td><span>Dell-985</span></td>
	                                                <td><span>456 pcs</span></td>
	                                                <td><span class="badge badge-success">Done</span></td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <div class="round-img">
	                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
	                                                    </div>
	                                                </td>
	                                                <td>Lew Shawon</td>
	                                                <td><span>Asus-565</span></td>
	                                                <td><span>456 pcs</span></td>
	                                                <td><span class="badge badge-warning">Pending</span></td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <div class="round-img">
	                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
	                                                    </div>
	                                                </td>
	                                                <td>lew Shawon</td>
	                                                <td><span>Dell-985</span></td>
	                                                <td><span>456 pcs</span></td>
	                                                <td><span class="badge badge-success">Done</span></td>
	                                            </tr>
	
	                                            <tr>
	                                                <td>
	                                                    <div class="round-img">
	                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
	                                                    </div>
	                                                </td>
	                                                <td>Lew Shawon</td>
	                                                <td><span>Asus-565</span></td>
	                                                <td><span>456 pcs</span></td>
	                                                <td><span class="badge badge-warning">Pending</span></td>
	                                            </tr>
	                                            <tr>
	                                                <td>
	                                                    <div class="round-img">
	                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
	                                                    </div>
	                                                </td>
	                                                <td>lew Shawon</td>
	                                                <td><span>Dell-985</span></td>
	                                                <td><span>456 pcs</span></td>
	                                                <td><span class="badge badge-success">Done</span></td>
	                                            </tr>
	
	                                            <tr>
	                                                <td>
	                                                    <div class="round-img">
	                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
	                                                    </div>
	                                                </td>
	                                                <td>Lew Shawon</td>
	                                                <td><span>Asus-565</span></td>
	                                                <td><span>456 pcs</span></td>
	                                                <td><span class="badge badge-warning">Pending</span></td>
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
	
	<script src="${pageContext.request.contextPath}/assets/js/dashboard/dashboard-1.js"></script>

</body>

</html>