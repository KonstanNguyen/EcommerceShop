<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Admin Dashboard - Products</title>

<base href="${ pageContext.servletContext.contextPath }/" />
<%@ include file="../admin/layout/link.jsp"%>

</head>

<body>
	<%@ include file="../admin/layout/preloader.jsp"%>

	<div id="main-wrapper">

		<%@ include file="../admin/layout/header.jsp"%>

		<%@ include file="../admin/layout/sidebar.jsp"%>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row page-titles">
					<div class="col p-0">
						<h4>Products</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Product List</h4>
								<button class="btn btn-success mb-3"
									onclick="openAddProductPopup()">Add New Product</button>
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Image</th>
												<th>Product Name</th>
												<th>Brand</th>
												<th>CPU</th>
												<th>Hot</th>
												<th>Price (VND)</th>
												<th>Promotion Price (VND)</th>
												<th>Warranty Time (months)</th>
												<th>Description</th>
												<th>Status</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${products}">
												<tr>
													<td>${product.id}</td>
													<td><img
														src="${product.getImages().stream().findFirst().get().getUrl()}"
														width="50px"></td>
													<td>${product.title}</td>
													<td>${product.getBrand().getName()}</td>
													<td>${product.CPU}</td>
													<td>${product.hot}</td>
													<td>${product.price}VND</td>
													<td>${product.promotionPrice}VND</td>
													<td>${product.warrantyTime}</td>
													<td>${product.description}</td>
													<td>${product.status}</td>
													<td>
														<button class="btn btn-primary"
															onclick="editProduct(${product.id}, '${fn:replace(fn:replace(product.title, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.getBrand().getName(), "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.CPU, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.RAM, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.HARDWARE, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.CARD, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.SCREEN, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.OS, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.hot, "'", "\\'"), "\"", "&quot;")}', ${product.price}, ${product.promotionPrice}, ${product.warrantyTime}, '${fn:replace(fn:replace(product.description, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.status, "'", "\\'"), "\"", "&quot;")}', '${fn:replace(fn:replace(product.starts, "'", "\\'"), "\"", "&quot;")}')">Edit</button>
														<button class="btn btn-danger"
															onclick="deleteProduct(${product.id})">Delete</button>
													</td>
													<!--                                                     <td>
	                                                    <button class="btn btn-primary" onclick="editProduct(1, 'Product 1', 'Apple', 'Intel i7', '16GB', '512GB SSD', 'NVIDIA GTX 1650', '15.6\'\' Retina', 'MacOS', 'true', 50000000, 45000000, 24, 'High-end laptop', 'In Stock', ['product01.png'])">Edit</button>
	                                                    <button class="btn btn-danger" onclick="deleteProduct(1)">Delete</button>
                                                	</td> -->
												</tr>
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

		<%@ include file="../admin/layout/footer.jsp"%>

	</div>

	<%@ include file="../admin/layout/script.jsp"%>

	<!-- Add Product Modal -->
	<div class="modal fade" id="addProductModal" tabindex="-1"
		role="dialog" aria-labelledby="addProductModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addProductModalLabel">Add New
						Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addProductForm"
						action="${pageContext.request.contextPath}/admin/products/add.htm"
						method="post">
						<!-- Add form fields for product details -->
						<div class="form-group">
							<label for="productName">Product Name</label> <input type="text"
								class="form-control" id="productName" name="productName"
								required>
						</div>
						<div class="form-group">
							<label for="brand">Brand</label> <select class="form-control"
								id="brand" name="brand" required>
								<c:forEach var="brand" items="${brands}">
									<option value="${brand.getName()}">${brand.getName()}</option>
								</c:forEach>
								<!-- Add more brands as needed -->
							</select>
						</div>
						<div class="form-group">
							<label for="cpu">CPU</label> <input type="text"
								class="form-control" id="cpu" name="cpu" required>
						</div>
						<div class="form-group">
							<label for="ram">RAM</label> <input type="text"
								class="form-control" id="ram" name="ram" required>
						</div>
						<div class="form-group">
							<label for="hardware">Hardware</label> <input type="text"
								class="form-control" id="hardware" name="hardware" required>
						</div>
						<div class="form-group">
							<label for="card">Card</label> <input type="text"
								class="form-control" id="card" name="card" required>
						</div>
						<div class="form-group">
							<label for="screen">Screen</label> <input type="text"
								class="form-control" id="screen" name="screen" required>
						</div>
						<div class="form-group">
							<label for="os">OS</label> <input type="text"
								class="form-control" id="os" name="os" required>
						</div>
						<div class="form-group">
							<label for="hot">Hot</label> <select class="form-control"
								id="hot" name="hot" required>
								<option value="true">True</option>
								<option value="false">False</option>
							</select>
						</div>
						<div class="form-group">
							<label for="price">Price (VND)</label> <input type="number"
								class="form-control" id="price" name="price" min="0" required>
						</div>
						<div class="form-group">
							<span class="promotionPrice-error"></span>
						</div>
						<div class="form-group">
							<label for="promotionPrice">Promotion Price (VND)</label> <input
								type="number" class="form-control" id="promotionPrice"
								name="promotionPrice" min="0" required>
						</div>
						<div class="form-group">
							<label for="warrantyTime">Warranty Time (months)</label> <input
								type="number" class="form-control" id="warrantyTime"
								name="warrantyTime" required>
						</div>
						<div class="form-group">
							<label for="description">Description</label>
							<textarea class="form-control" id="description"
								name="description" rows="3"></textarea>
						</div>
						<div class="form-group">
							<label for="status">Status</label> <select class="form-control"
								id="status" name="status" required>
								<option value="AVAILABLE">AVAILABLE</option>
								<option value="DELETED">DELETED</option>
							</select>
						</div>
						<div class="form-group">
							<label for="rating">Rating</label> <select class="form-control"
								id="rating" name="rating" required>
								<option value="1.0">1 Star</option>
								<option value="2.0">2 Stars</option>
								<option value="3.0">3 Stars</option>
								<option value="4.0">4 Stars</option>
								<option value="5.0">5 Stars</option>
							</select>
						</div>
						<div class="form-group">
							<label for="image">Image</label> <input type="file"
								class="form-control-file" id="image" name="image" multiple
								required>
						</div>
						<button type="submit" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Edit Product Modal -->
	<div class="modal fade" id="editProductModal" tabindex="-1"
		role="dialog" aria-labelledby="editProductModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editProductModalLabel">Edit
						Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="editProductForm" enctype="multipart/form-data" action=""
						method="post">
						<!-- Add hidden field for product ID -->
						<input type="hidden" id="editProductId" name="productId">
						<!-- Add form fields for product details similar to add form -->
						<div class="form-group">
							<label for="editProductName">Product Name</label> <input
								type="text" class="form-control" id="editProductName"
								name="productName" required>
						</div>
						<div class="form-group">
							<label for="editBrand">Brand</label> <select class="form-control"
								id="editBrand" name="brand" required>
								<c:forEach var="brand" items="${brands}">
									<option value="${brand.getName()}">${brand.getName()}</option>
								</c:forEach>
								<!-- Add more brands as needed -->
							</select>
						</div>
						<div class="form-group">
							<label for="editCpu">CPU</label> <input type="text"
								class="form-control" id="editCpu" name="cpu" required>
						</div>
						<div class="form-group">
							<label for="editRam">RAM</label> <input type="text"
								class="form-control" id="editRam" name="ram" required>
						</div>
						<div class="form-group">
							<label for="editHardware">Hardware</label> <input type="text"
								class="form-control" id="editHardware" name="hardware" required>
						</div>
						<div class="form-group">
							<label for="editCard">Card</label> <input type="text"
								class="form-control" id="editCard" name="card" required>
						</div>
						<div class="form-group">
							<label for="editScreen">Screen</label> <input type="text"
								class="form-control" id="editScreen" name="screen" required>
						</div>
						<div class="form-group">
							<label for="editOs">OS</label> <input type="text"
								class="form-control" id="editOs" name="os" required>
						</div>
						<div class="form-group">
							<label for="editHot">Hot</label> <select class="form-control"
								id="editHot" name="hot" required>
								<option value="true">True</option>
								<option value="false">False</option>
							</select>
						</div>
						<div class="form-group">
							<label for="editPrice">Price (VND)</label> <input type="number"
								class="form-control" id="editPrice" name="price" min="0"
								required>
						</div>
						<div class="form-group">
							<span class="editPromotionPrice-error error-validation"></span>
						</div>
						<div class="form-group">
							<label for="editPromotionPrice">Promotion Price (VND)</label> <input
								type="number" class="form-control" id="editPromotionPrice"
								name="promotionPrice" min="0" required>
						</div>
						<div class="form-group">
							<label for="editWarrantyTime">Warranty Time (months)</label> <input
								type="number" class="form-control" id="editWarrantyTime"
								name="warrantyTime" required>
						</div>
						<div class="form-group">
							<label for="editDescription">Description</label>
							<textarea class="form-control" id="editDescription"
								name="description" rows="3"></textarea>
						</div>
						<div class="form-group">
							<label for="editStatus">Status</label> <select
								class="form-control" id="editStatus" name="status" required>
								<option value="AVAILABLE">AVAILABLE</option>
								<option value="DELETED">DELETED</option>
							</select>
						</div>
						<div class="form-group">
							<label for="editRating">Rating</label> <select
								class="form-control" id="editRating" name="rating" required>
								<option value="1.0">1 Star</option>
								<option value="2.0">2 Stars</option>
								<option value="3.0">3 Stars</option>
								<option value="4.0">4 Stars</option>
								<option value="5.0">5 Stars</option>
							</select>
						</div>
						<div class="form-group">
							<label for="editImage">Image</label> <input type="file"
								class="form-control-file" id="editImage" name="image" multiple>
						</div>
						<button type="submit" class="btn btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Validation -->
	<script type="text/javascript">
	
			$("#addProductForm").on("submit", function(event) {
				var price = $('#price').val();
				var pricePromotion = $('#promotionPrice').val();
				
				var promotionPrice = $('.promotionPrice-error');
				if(!validatePrice(price, promotionPrice)){
					promotionPrice.text("Price has to greater than promotion price!");
					event.preventDefault();
				}
			});
			
			$("#editProductForm").on("submit", function(event) {
				var price = $('#editPrice').val();
				var pricePromotion = $('#editPromotionPrice').val();
				
				var promotionPrice = $('.editPromotionPrice-error');
				if(!validatePrice(price, promotionPrice)){
					promotionPrice.text("Price has to greater than promotion price!");
					event.preventDefault();
				}
			});
			
			function validatePrice(price, promotionPrice) {
				return price >= promotionPrice;
			}
	</script>

	<script type="text/javascript">
        function openAddProductPopup() {
            $('#addProductModal').modal('show');
        }

        function editProduct(id, name, brand, cpu, ram, hardware, card, screen, os, hot, price, promotionPrice, warrantyTime, description, status, rating) {
            $('#editProductId').val(id);
            $('#editProductName').val(name);
            $('#editBrand').val(brand);
            $('#editCpu').val(cpu);
            $('#editRam').val(ram);
            $('#editHardware').val(hardware);
            $('#editCard').val(card);
            $('#editScreen').val(screen);
            $('#editOs').val(os);
            $('#editHot').val(hot);
            $('#editPrice').val(price);
            $('#editPromotionPrice').val(promotionPrice);
            $('#editWarrantyTime').val(warrantyTime);
            $('#editDescription').val(description);
            $('#editStatus').val(status);
            $('#editRating').val(rating);
            $('#editProductModal').modal('show');
            
            document.getElementById('editProductForm').action = '${pageContext.request.contextPath}/admin/products/edit/' + id+'.htm';
        }
        
        function deleteProduct(id) {
            if (confirm('Are you sure you want to delete this product?')) {
                window.location.href = '${pageContext.request.contextPath}/admin/products/delete/' + id + ".htm";
            }
        }
    </script>

</body>

</html>
