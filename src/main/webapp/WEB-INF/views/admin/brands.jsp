<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
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
                                            <tr>
                                                <td>1</td>
                                                <td>Apple</td>
                                                <td>
                                                    <button class="btn btn-primary" onclick="editBrand(1, 'Apple')">Edit</button>
                                                    <button class="btn btn-danger" onclick="deleteBrand(1)">Delete</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Samsung</td>
                                                <td>
                                                    <button class="btn btn-primary" onclick="editBrand(2, 'Samsung')">Edit</button>
                                                    <button class="btn btn-danger" onclick="deleteBrand(2)">Delete</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sony</td>
                                                <td>
                                                    <button class="btn btn-primary" onclick="editBrand(3, 'Sony')">Edit</button>
                                                    <button class="btn btn-danger" onclick="deleteBrand(3)">Delete</button>
                                                </td>
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
                    <form id="addBrandForm">
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
                    <form id="editBrandForm">
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
        }

        function deleteBrand(id) {
            if (confirm('Are you sure you want to delete this brand?')) {
                // Perform delete action
                console.log('Brand ' + id + ' deleted');
            }
        }
    </script>

</body>

</html>
