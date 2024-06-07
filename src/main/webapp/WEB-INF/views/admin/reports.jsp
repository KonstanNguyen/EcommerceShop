<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard - Reports</title>
    
    <%@ include file="../admin/layout/link.jsp" %>
    
    <!-- Include Chart.js and jsPDF library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
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
                        <h4>Reports</h4>
                    </div>
                </div>

                <!-- Export Button -->
                <div class="row mb-3">
                    <div class="col">
                        <button class="btn btn-primary" onclick="exportReportAsPDF()">Export Report as PDF</button>
                    </div>
                </div>

                <!-- Revenue by Product and Revenue Over Time Charts -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Revenue by Product</h4>
                                <canvas id="revenueByProductChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Revenue Over Time</h4>
                                <input type="date" id="startDate">
                                <input type="date" id="endDate">
                                <button onclick="updateRevenueOverTimeChart()">Update</button>
                                <canvas id="revenueOverTimeChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Top Selling Products and Revenue by Brand Charts -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Top Selling Products</h4>
                                <canvas id="topSellingProductsChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Revenue by Brand</h4>
                                <canvas id="revenueByBrandChart"></canvas>
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
        // Sample data for demonstration purposes
        const sampleData = {
            revenueByProduct: {
                labels: ["Product 1", "Product 2", "Product 3"],
                data: [12000, 15000, 8000]
            },
            revenueOverTime: {
                labels: ["2024-01-01", "2024-02-01", "2024-03-01"],
                data: [30000, 40000, 35000]
            },
            topSellingProducts: {
                labels: ["Product 1", "Product 2", "Product 3"],
                data: [200, 180, 150]
            },
            revenueByBrand: {
                labels: ["Brand A", "Brand B", "Brand C"],
                data: [50000, 40000, 30000]
            }
        };

        // Function to create charts
        function createChart(chartId, type, labels, data, label) {
            const ctx = document.getElementById(chartId).getContext('2d');
            new Chart(ctx, {
                type: type,
                data: {
                    labels: labels,
                    datasets: [{
                        label: label,
                        data: data,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        // Initialize charts with sample data
        createChart('revenueByProductChart', 'bar', sampleData.revenueByProduct.labels, sampleData.revenueByProduct.data, 'Revenue');
        createChart('revenueOverTimeChart', 'line', sampleData.revenueOverTime.labels, sampleData.revenueOverTime.data, 'Revenue');
        createChart('topSellingProductsChart', 'bar', sampleData.topSellingProducts.labels, sampleData.topSellingProducts.data, 'Sales');
        createChart('revenueByBrandChart', 'pie', sampleData.revenueByBrand.labels, sampleData.revenueByBrand.data, 'Revenue');

        // Function to update revenue over time chart based on date range
        function updateRevenueOverTimeChart() {
            const startDate = document.getElementById('startDate').value;
            const endDate = document.getElementById('endDate').value;
            // Fetch and update data based on date range (placeholder logic)
            console.log('Updating chart from', startDate, 'to', endDate);
            // Update the chart with new data here
        }

        // Function to export report as PDF
        async function exportReportAsPDF() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Add a title
            doc.setFontSize(18);
            doc.text("Report", 14, 22);

            // Add Revenue by Product table
            doc.setFontSize(14);
            doc.text("Revenue by Product", 14, 32);
            doc.autoTable({
                startY: 36,
                head: [['Product', 'Revenue']],
                body: sampleData.revenueByProduct.labels.map((label, index) => [label, sampleData.revenueByProduct.data[index]]),
            });

            // Add Revenue Over Time table
            doc.text("Revenue Over Time", 14, doc.lastAutoTable.finalY + 10);
            doc.autoTable({
                startY: doc.lastAutoTable.finalY + 14,
                head: [['Date', 'Revenue']],
                body: sampleData.revenueOverTime.labels.map((label, index) => [label, sampleData.revenueOverTime.data[index]]),
            });

            // Add Top Selling Products table
            doc.text("Top Selling Products", 14, doc.lastAutoTable.finalY + 10);
            doc.autoTable({
                startY: doc.lastAutoTable.finalY + 14,
                head: [['Product', 'Sales']],
                body: sampleData.topSellingProducts.labels.map((label, index) => [label, sampleData.topSellingProducts.data[index]]),
            });

            // Add Revenue by Brand table
            doc.text("Revenue by Brand", 14, doc.lastAutoTable.finalY + 10);
            doc.autoTable({
                startY: doc.lastAutoTable.finalY + 14,
                head: [['Brand', 'Revenue']],
                body: sampleData.revenueByBrand.labels.map((label, index) => [label, sampleData.revenueByBrand.data[index]]),
            });

            // Save the PDF
            doc.save('report.pdf');
        }
    </script>

</body>

</html>
