<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard - Brands</title>
    
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
	            <c:if test="${not empty param.error}">
	                <div class="alert alert-danger">${param.error}</div>
	            </c:if>
                <div class="row page-titles">
                    <div class="col p-0">
                        <h4>Brands</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Brand List</h4>
                                <button class="btn btn-success mb-3" onclick="openAddBrandPopup()">Add New Brand</button>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Brand Name</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="brand" items="${brands}">
	                                            <tr>
	                                                <td>${brand.id}</td>
	                                                <td>${brand.name}</td>
	                                                <td>
	                                                    <button class="btn btn-primary" onclick="editBrand(${brand.id}, '${brand.name}')">Edit</button>
	                                                    <button class="btn btn-danger" onclick="deleteBrand(${brand.id})">Delete</button>
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

    <!-- Add Brand Modal -->
    <div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addBrandModalLabel">Add New Brand</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addBrandForm" action="${pageContext.request.contextPath}/admin/brands/add.htm" method="post">
                        <div class="form-group">
                            <label for="brandName">Brand Name</label>
                            <input type="text" class="form-control" id="brandName" name="brandName" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Brand Modal -->
    <div class="modal fade" id="editBrandModal" tabindex="-1" role="dialog" aria-labelledby="editBrandModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editBrandModalLabel">Edit Brand</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editBrandForm" action="" method="post">
                        <input type="hidden" id="editBrandId" name="brandId">
                        <div class="form-group">
                            <label for="editBrandName">Brand Name</label>
                            <input type="text" class="form-control" id="editBrandName" name="brandName" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openAddBrandPopup() {
            $('#addBrandModal').modal('show');
        }

        function editBrand(id, name) {
            $('#editBrandId').val(id);
            $('#editBrandName').val(name);
            $('#editBrandModal').modal('show');
            document.getElementById('editBrandForm').action = '${pageContext.request.contextPath}/admin/brands/edit/' + id + '.htm';
        }

        function deleteBrand(id) {
            if (confirm('Are you sure you want to delete this brand?')) {
                window.location.href = '${pageContext.request.contextPath}/admin/brands/delete/' + id + ".htm";
            }
        }
    </script>

</body>

</html>
