<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard - Discounted Products</title>
    
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
                        <h4>Discounted Products</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Discounted Product List</h4>
                                <button class="btn btn-success mb-3" onclick="openAddDiscountedProductPopup()">Add New Discount</button>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Product</th>
                                                <th>Percent</th>
                                                <th>Start Time</th>
                                                <th>End Time</th>
                                                <th>Create Time</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="p" items="${promotions}">
	                                            <c:forEach var="category" items="${p.categories}">
	                                            <tr>
	                                            
	                                                <td>${p.id}</td>
	                                                
		                                                <td>${category.title}</td>
		                                                <td>${p.dealPercent}</td>
		                                                <td>${p.startTime}</td>
		                                                <td>${p.endTime}</td>
		                                                <td>${p.getCreatedTime()}</td>
		                                           		<td>
			                                                <button class="btn btn-primary" onclick="editDiscountedProduct(${p.id}, '${category.title}', ${p.dealPercent}, '${p.startTime}', '${p.endTime}', '${p.getCreatedTime()}')">Edit</button>
			                                                <button class="btn btn-danger" onclick="deleteDiscountedProduct(${p.id})">Delete</button>
			                                            </td>
	                                            </tr>
		                                            </c:forEach>
                                            </c:forEach>
                                            
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

    <!-- Add Discounted Product Modal -->
    <div class="modal fade" id="addDiscountedProductModal" tabindex="-1" role="dialog" aria-labelledby="addDiscountedProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDiscountedProductModalLabel">Add New Discount</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addDiscountedProductForm">
                        <div class="form-group">
                            <label for="productName">Product</label>
                            <select class="form-control" id="productName" name="productName" required>
                                <option value="Product 1">Product 1</option>
                                <option value="Product 2">Product 2</option>
                                <!-- Add more products as needed -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="percent">Percent</label>
                            <input type="number" class="form-control" id="percent" name="percent" required>
                        </div>
                        <div class="form-group">
                            <label for="startTime">Start Time</label>
                            <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
                        </div>
                        <div class="form-group">
                            <label for="endTime">End Time</label>
                            <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
                        </div>
                        <div class="form-group">
                            <label for="createTime">Create Time</label>
                            <input type="datetime-local" class="form-control" id="createTime" name="createTime" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Discounted Product Modal -->
    <div class="modal fade" id="editDiscountedProductModal" tabindex="-1" role="dialog" aria-labelledby="editDiscountedProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editDiscountedProductModalLabel">Edit Discount</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editDiscountedProductForm">
                        <input type="hidden" id="editDiscountedProductId" name="discountedProductId">
                        <div class="form-group">
                            <label for="editProductName">Product</label>
                            <input type="text" class="form-control" id="editProductName" name="productName" required>
                        </div>
                        <div class="form-group">
                            <label for="editProductPercent">Percent</label>
                            <input type="number" class="form-control" id="editProductPercent" name="percent" required>
                        </div>
                        <div class="form-group">
                            <label for="editStartTime">Start Time</label>
                            <input type="datetime-local" class="form-control" id="editStartTime" name="startTime" required>
                        </div>
                        <div class="form-group">
                            <label for="editEndTime">End Time</label>
                            <input type="datetime-local" class="form-control" id="editEndTime" name="endTime" required>
                        </div>
                        <div class="form-group">
                            <label for="editCreateTime">Create Time</label>
                            <input type="datetime-local" class="form-control" id="editCreateTime" name="createTime" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openAddDiscountedProductPopup() {
            $('#addDiscountedProductModal').modal('show');
        }

        function editDiscountedProduct(id, productName, percent, startTime, endTime, createTime) {
            $('#editDiscountedProductId').val(id);
            $('#editProductName').val(productName);
            $('#editProductPercent').val(percent);
            $('#editStartTime').val(startTime);
            $('#editEndTime').val(endTime);
            $('#editCreateTime').val(createTime);
            $('#editDiscountedProductModal').modal('show');
        }

        function deleteDiscountedProduct(id) {
            if (confirm('Are you sure you want to delete this discount?')) {
                // Perform delete action
                console.log('Discounted Product ' + id + ' deleted');
            }
        }
    </script>

</body>

</html>