<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard - Products</title>
    
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
                        <h4>Products</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Product List</h4>
                                <button class="btn btn-success mb-3" onclick="openAddProductPopup()">Add New Product</button>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Product Name</th>
                                                <th>Brand</th>
                                                <th>CPU</th>
                                                <th>RAM</th>
                                                <th>Hardware</th>
                                                <th>Card</th>
                                                <th>Screen</th>
                                                <th>OS</th>
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
                                                    <td><img src="${pageContext.request.contextPath}/assets/img/product01.png" width="50px"></td>
                                                    <td>${product.title}</td>
                                                    <td>Apple</td>
                                                    <td>${product.CPU}</td>
                                                    <td>${product.RAM}</td>
                                                    <td>${product.HARDWARE}</td>
                                                    <td>${product.CARD}</td>
                                                    <td>${product.SCREEN}</td>
                                                    <td>${product.OS}</td>
                                                    <td>${product.hot}</td>
                                                    <td>${product.price} VND</td>
                                                    <td>${product.promotionPrice} VND</td>
                                                    <td>${product.warrantyTime}</td>
                                                    <td>${product.description}</td>
                                                    <td>${product.status}</td>
<%--                                                     <td>
                                                        <button class="btn btn-primary" onclick="editProduct(${product.id}, '${product.title}', '${product.brand}', '${product.CPU}', '${product.RAM}', '${product.HARDWARE}', '${product.CARD}', '${product.SCREEN}', '${product.OS}', '${product.hot}', ${product.price}, ${product.promotionPrice}, ${product.warrantyTime}, '${product.description}', '${product.status}', ['${product.image}'])">Edit</button>
                                                        <button class="btn btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
                                                    </td> --%>
                                                    <td>
	                                                    <button class="btn btn-primary" onclick="editProduct(1, 'Product 1', 'Apple', 'Intel i7', '16GB', '512GB SSD', 'NVIDIA GTX 1650', '15.6\'\' Retina', 'MacOS', 'true', 50000000, 45000000, 24, 'High-end laptop', 'In Stock', ['product01.png'])">Edit</button>
	                                                    <button class="btn btn-danger" onclick="deleteProduct(1)">Delete</button>
                                                	</td>
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
        
        <%@ include file="../admin/layout/footer.jsp" %>
        
    </div>

    <%@ include file="../admin/layout/script.jsp" %>

    <!-- Add Product Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addProductForm" enctype="multipart/form-data">
                        <!-- Add form fields for product details -->
                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>
                        <div class="form-group">
                            <label for="brand">Brand</label>
                            <select class="form-control" id="brand" name="brand" required>
                                <option value="Apple">Apple</option>
                                <option value="Samsung">Samsung</option>
                                <option value="Dell">Dell</option>
                                <option value="HP">HP</option>
                                <!-- Add more brands as needed -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="cpu">CPU</label>
                            <input type="text" class="form-control" id="cpu" name="cpu" required>
                        </div>
                        <div class="form-group">
                            <label for="ram">RAM</label>
                            <input type="text" class="form-control" id="ram" name="ram" required>
                        </div>
                        <div class="form-group">
                            <label for="hardware">Hardware</label>
                            <input type="text" class="form-control" id="hardware" name="hardware" required>
                        </div>
                        <div class="form-group">
                            <label for="card">Card</label>
                            <input type="text" class="form-control" id="card" name="card" required>
                        </div>
                        <div class="form-group">
                            <label for="screen">Screen</label>
                            <input type="text" class="form-control" id="screen" name="screen" required>
                        </div>
                        <div class="form-group">
                            <label for="os">OS</label>
                            <input type="text" class="form-control" id="os" name="os" required>
                        </div>
                        <div class="form-group">
                            <label for="hot">Hot</label>
                            <select class="form-control" id="hot" name="hot" required>
                                <option value="true">True</option>
                                <option value="false">False</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">Price (VND)</label>
                            <input type="number" class="form-control" id="price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="promotionPrice">Promotion Price (VND)</label>
                            <input type="number" class="form-control" id="promotionPrice" name="promotionPrice" required>
                        </div>
                        <div class="form-group">
                            <label for="warrantyTime">Warranty Time (months)</label>
                            <input type="number" class="form-control" id="warrantyTime" name="warrantyTime" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="In Stock">In Stock</option>
                                <option value="Out of Stock">Out of Stock</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="image">Image</label>
                            <input type="file" class="form-control-file" id="image" name="image" multiple required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Product Modal -->
    <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editProductForm" enctype="multipart/form-data">
                        <!-- Add hidden field for product ID -->
                        <input type="hidden" id="editProductId" name="productId">
                        <!-- Add form fields for product details similar to add form -->
                        <div class="form-group">
                            <label for="editProductName">Product Name</label>
                            <input type="text" class="form-control" id="editProductName" name="productName" required>
                        </div>
                        <div class="form-group">
                            <label for="editBrand">Brand</label>
                            <select class="form-control" id="editBrand" name="brand" required>
                                <option value="Apple">Apple</option>
                                <option value="Samsung">Samsung</option>
                                <option value="Dell">Dell</option>
                                <option value="HP">HP</option>
                                <!-- Add more brands as needed -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="editCpu">CPU</label>
                            <input type="text" class="form-control" id="editCpu" name="cpu" required>
                        </div>
                        <div class="form-group">
                            <label for="editRam">RAM</label>
                            <input type="text" class="form-control" id="editRam" name="ram" required>
                        </div>
                        <div class="form-group">
                            <label for="editHardware">Hardware</label>
                            <input type="text" class="form-control" id="editHardware" name="hardware" required>
                        </div>
                        <div class="form-group">
                            <label for="editCard">Card</label>
                            <input type="text" class="form-control" id="editCard" name="card" required>
                        </div>
                        <div class="form-group">
                            <label for="editScreen">Screen</label>
                            <input type="text" class="form-control" id="editScreen" name="screen" required>
                        </div>
                        <div class="form-group">
                            <label for="editOs">OS</label>
                            <input type="text" class="form-control" id="editOs" name="os" required>
                        </div>
                        <div class="form-group">
                            <label for="editHot">Hot</label>
                            <select class="form-control" id="editHot" name="hot" required>
                                <option value="true">True</option>
                                <option value="false">False</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="editPrice">Price (VND)</label>
                            <input type="number" class="form-control" id="editPrice" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="editPromotionPrice">Promotion Price (VND)</label>
                            <input type="number" class="form-control" id="editPromotionPrice" name="promotionPrice" required>
                        </div>
                        <div class="form-group">
                            <label for="editWarrantyTime">Warranty Time (months)</label>
                            <input type="number" class="form-control" id="editWarrantyTime" name="warrantyTime" required>
                        </div>
                        <div class="form-group">
                            <label for="editDescription">Description</label>
                            <textarea class="form-control" id="editDescription" name="description" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="editStatus">Status</label>
                            <select class="form-control" id="editStatus" name="status" required>
                                <option value="In Stock">In Stock</option>
                                <option value="Out of Stock">Out of Stock</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="editImage">Image</label>
                            <input type="file" class="form-control-file" id="editImage" name="image" multiple>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openAddProductPopup() {
            $('#addProductModal').modal('show');
        }

        function editProduct(id, name, brand, cpu, ram, hardware, card, screen, os, hot, price, promotionPrice, warrantyTime, description, status, images) {
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
            // Handle images if needed, e.g., displaying them somewhere
            $('#editProductModal').modal('show');
        }

        function deleteProduct(id) {
            if (confirm('Are you sure you want to delete this product?')) {
                // Perform delete action
                console.log('Product ' + id + ' deleted');
            }
        }
    </script>

</body>

</html>
