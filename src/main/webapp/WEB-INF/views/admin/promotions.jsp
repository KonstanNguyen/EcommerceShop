<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
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
                                <button class="btn btn-success mb-3" onclick="openAddDiscountedProductPopup()">Add New Product Discount</button>
                                <button class="btn btn-success mb-3" onclick="openAddDiscountedPopup()">Add New Discount</button>
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
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="p" items="${promotions}">
                                        		<c:set var="categoryCount" value="${fn:length(p.categories)}" />
	                                            <c:forEach var="category" items="${p.categories}" varStatus="status">
		                                            <tr>
		                                            
		                                                <td>${p.id}</td>
		                                                
			                                            <td>${category.title}</td>
			                                            <td>${p.dealPercent}</td>
			                                            <td>${p.startTime}</td>
			                                            <td>${p.endTime}</td>
			                                            <td>${p.getCreatedTime()}</td>
			                                            <td>
				                                           	<c:choose>
												                <c:when test="${p.status == true}">
												                    Đang áp dụng
												                </c:when>
												                <c:otherwise>
												                    Không áp dụng
												                </c:otherwise>
												            </c:choose>
			                                           	</td>
			                                       		<td>
				                                           <c:choose>
										                        <c:when test="${categoryCount < 2}">
										                            <button class="btn btn-primary" onclick="editDiscountedProduct(${p.id}, ${p.dealPercent}, '${p.startTime}', '${p.endTime}', '${p.status}')">Edit</button>
										                            <button class="btn btn-danger" onclick="deleteDiscountedProduct(${p.id})">Delete</button>
										                        </c:when>
										                        <c:otherwise>
										                        	<c:if test="${status.first}">
										                            	<button class="btn btn-primary" onclick="editDiscountedProduct(${p.id}, ${p.dealPercent}, '${p.startTime}', '${p.endTime}', '${p.status}')">Edit</button>
										                            	<button class="btn btn-danger" onclick="deleteDiscountedProduct(${p.id})">Delete</button>
										                        	</c:if>
										                        </c:otherwise>
										                    </c:choose>
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
                    <h5 class="modal-title" id="addDiscountedProductModalLabel">Add New Discount Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addDiscountedProductForm" action="${pageContext.request.contextPath}/admin/promotions/addProductPromotion.htm" method="post">
                    	<div class="form-group">
                            <label for="promotionId">Promotion</label>
                            <select class="form-control" id="promotionId" name="promotionId" required>
                                <c:forEach var="pro" items="${promotions}">
	                                <option value="${pro.id}">${pro.id}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="productName">Product</label>
                            <select class="form-control" id="productName" name="productName" required>
                                <c:forEach var="c" items="${categories}">
	                                <option value="${c.id}">${c.title}</option>
                                </c:forEach>
                                <!-- Add more products as needed -->
                            </select>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Discounted Modal -->
    <div class="modal fade" id="addDiscountedModal" tabindex="-1" role="dialog" aria-labelledby="addDiscountedProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDiscountedModalLabel">Add New Discount</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addDiscountedForm" action="${pageContext.request.contextPath}/admin/promotions/add.htm" method="post">
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
                    <form id="editDiscountedProductForm" action="" method="post">
                        <input type="hidden" id="editDiscountedProductId" name="discountedProductId">
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
						    <label for="editstatus">Status</label>
						    <select class="form-control" id="editStatus" name="status" required>
						        <option value="true">Đang áp dụng</option>
						        <option value="false">Không áp dụng</option>
						    </select>
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
        
        function openAddDiscountedPopup() {
            $('#addDiscountedModal').modal('show');
        }

        function editDiscountedProduct(id, percent, startTime, endTime, status) {
            $('#editDiscountedProductId').val(id);
            $('#editProductPercent').val(percent);
            $('#editStartTime').val(startTime);
            $('#editEndTime').val(endTime);
            $('#editStatus').val(status);
            $('#editDiscountedProductModal').modal('show');
            
            document.getElementById('editDiscountedProductForm').action = '${pageContext.request.contextPath}/admin/promotions/edit/' + id+'.htm';
        }

        function deleteDiscountedProduct(id) {
            if (confirm('Are you sure you want to delete this discount?')) {
            	window.location.href = '${pageContext.request.contextPath}/admin/promotions/delete/' + id + ".htm";
            }
        }
    </script>

</body>

</html>
