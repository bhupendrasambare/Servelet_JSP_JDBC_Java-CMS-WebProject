<%@page import="controller.admin.allClient"%>
<%@page import="controller.admin.allProduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.admin.showFeedback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Add Products</title>
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
                        <h3 class="text-dark mb-0">Client Information</h3>
                        	<a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="../">
                        		<i class="fas fa-globe"></i>&ensp;GoTo Page
                        	</a>
                    </div>
                    <div class="card shadow">
	                    <div class="card-header py-3">
	                        <p class="text-primary m-0 fw-bold">Add New Client
	                        	<span id="productInputBoxButton" style="padding-left:20px">
	                        		<i class="font-weight-bolder fas fa-chevron-circle-up"></i>
	                        	</span>
	                        </p>
	                        
	                    </div>
	                    
                        <div id="inputBox" class="card-body">
                            <form method="POST" enctype="multipart/form-data">
                            	<div class="row">
                                    <div class="col">
                                        <div class="mb-3">
	                                        <label class="form-label" for="city"><strong>Client Name</strong></label>
	                                        <input class="form-control" type="text" id="city" placeholder="Name" name="name">
                                        </div>
                                    </div>
                                    <div class="col">
                                    	<div class="mb-3">
	                                        <label class="form-label" for="city"><strong>Image</strong></label>
	                                        <input class="form-control" type="file" id="city" name="image">
                                        </div>    
                                    </div>
                                    
                                </div>  	
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
	                                        <label class="form-label" for="city"><strong>Info</strong></label>
	                                        <textarea class="form-control" type="text" id="city" placeholder="Information" name="info"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="submit">Save&nbsp;Client Info</button></div>
                            </form>
                        </div>
                    </div>
                    <div class="mt-4 card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Clients</p>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table id="example" class="display" style="width:100%">
							        <thead class="table-primary">
							            <tr>
							                <th>ID</th>
							                <th>Name</th>
							                <th>Info</th>
							                <th>Image</th>
							            </tr>
							        </thead>
							        <tbody>
							        	<%
							    			allClient feed = new allClient();
							        		ResultSet resultTable = feed.getClient();
							        		while(resultTable.next()){
							        		
							        	%>
							        
							            <tr class="table-light">
							                <td><%=resultTable.getInt("id") %></td>
							                <td><%=resultTable.getString("name") %></td>
							                <td><%=resultTable.getString("info") %></td>
							                <td><img hight="20px" width="40px" src="../images/clients/<%=resultTable.getString("image") %>"></img></td>
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
	        
	        $("#productInputBoxButton").click(function(){
	        	if($("#inputBox").is(":visible")){
		        	  $("#inputBox").hide();
		        	  $("#productInputBoxButton").html('<i class="font-weight-bolder fas fa-chevron-circle-down"></i>');
		        	  
	        	}else{
	        		$("#inputBox").show();
	        		$("#productInputBoxButton").html('<i class="font-weight-bolder fas fa-chevron-circle-up"></i>');
	        	}
	        });
	    } );
	    
    </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>