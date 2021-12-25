<%@page import="controller.admin.allSocial"%>
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
                        <h3 class="text-dark mb-0">Social Media Information</h3>
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
                            <form method="POST">
                            	<div class="row">
                                    <div class="col">
                                        <div class="mb-3">
	                                        <label class="form-label" for="city"><strong>Name</strong></label>
	                                        <input class="form-control" type="text" id="city" placeholder="Name" name="name">
                                        </div>
                                    </div>
                                    <div class="col">
                                    	<div class="mb-3">
	                                        <label class="form-label" for="city"><strong>Link</strong></label>
	                                        <input class="form-control" type="text" placeholder="Link" id="city" name="link">
                                        </div>    
                                    </div>
                                    
                                </div>  	
                                <div class="row">
                                     <div class="col">
                                        <div class="mb-3">
	                                        <label class="form-label" for="city"><strong>Info</strong></label>
	                                        <input class="form-control" type="text" id="city" placeholder="Info" name="info">
                                        </div>
                                    </div>
                                    <div class="col">
                                    	<div class="mb-3">
	                                        <label class="form-label" for="city">Icons</label></br>
	                                        <input class="" value="fa fa-map-marker" type="radio" checked name="icon">
	                                        <label class="form-label fs-5" for="fa fa-map-marker"><i class="fa fa-map-marker"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-google-plus" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-google-plus"><i class="fa fa-google-plus"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-facebook" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-facebook"><i class="fa fa-facebook"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-instagram" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-instagram"><i class="fa fa-instagram"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-twitter" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-tweeter"><i class="fa fa-twitter"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-linkedin" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-linkedin"><i class="fa fa-linkedin"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-telegram" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-telegram"><i class="fa fa-telegram"></i></label>&ensp;
	                                        
	                                        <input class="" value="fa fa-phone" type="radio" name="icon">
	                                        <label class="form-label fs-5" for="fa fa-phone"><i class="fa fa-phone"></i></label>&ensp;
	                                        
                                        </div>    
                                    </div>
                                </div>
                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="submit">Save&nbsp;Client Info</button></div>
                            </form>
                        </div>
                    </div>
                    <div class="mt-4 card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Social Media Links</p>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table id="example" class="display" style="width:100%">
							        <thead class="table-primary">
							            <tr>
							                <th>ID</th>
							                <th>Name</th>
							                <th>Icon</th>
							                <th>Link</th>
							                <th>Info</th>
							            </tr>
							        </thead>
							        <tbody>
							        	<%
							    			allSocial feed = new allSocial();
							        		ResultSet resultTable = feed.getSocial();
							        		while(resultTable.next()){
							        		
							        	%>
							        
							            <tr class="table-light">
							                <td><%=resultTable.getInt("id") %></td>
							                <td><%=resultTable.getString("name") %></td>
							                <td><i class="<%=resultTable.getString("icon") %>"></i></td>
							                <td><a target="_blank" href="<%=resultTable.getString("link") %>"><%=resultTable.getString("link") %></a></td>
							                <td><%=resultTable.getString("info") %></td>
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