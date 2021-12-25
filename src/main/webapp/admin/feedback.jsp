<%@page import="controller.admin.showFeedback"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

</head>
<body id="page-top">
    <div id="wrapper">
        <jsp:include page="component/navbar.jsp" />
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <jsp:include page="component/topbar.jsp" />
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Feedback</h3>
                        <a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="../contact">
                        	<i class="fas fa-globe"></i>&ensp;GoTo Page
                        </a>
                    </div>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Feedbacks</p>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table id="example" class="display" style="width:100%">
							        <thead class="table-dark">
							            <tr>
							                <th>ID</th>
							                <th>Name</th>
							                <th>Email</th>
							                <th>Number</th>
							                <th>Message</th>
							            </tr>
							        </thead>
							        <tbody>
							        	<%
							    			showFeedback feed = new showFeedback();
							        		ResultSet resultTable = feed.getFeedback();
							        		while(resultTable.next()){
							        		
							        	%>
							        
							            <tr class="table-light">
							                <td><%=resultTable.getInt("id") %></td>
							                <td><%=resultTable.getString("name") %></td>
							                <td><%=resultTable.getString("email") %></td>
							                <td><%=resultTable.getString("number") %></td>
							                <td><%=resultTable.getString("massage") %></td>
							            </tr>
							            <%	
							        		} %>
							    </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright Â© Brand 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script>
    $(document).ready(function() {
        $('#example').DataTable();
    } );
    </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>