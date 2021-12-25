<%@page import="java.sql.ResultSet"%>
<%@page import="controller.users.homePage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	homePage home = new homePage();
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <title>Home</title>
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <jsp:include page="template/navbar.jsp" />
      <!-- end header inner -->
      <!-- end header -->
      <!-- banner -->
      <section class="banner_main">
         <div id="banner1" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#banner1" data-slide-to="0" class="active"></li>
               <li data-target="#banner1" data-slide-to="1"></li>
               <li data-target="#banner1" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="glasses">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="glasses">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="glasses">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
            </a>
            <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
            <i class="fa fa-arrow-right" aria-hidden="true"></i>
            </a>
         </div>
      </section>
      <!-- end banner -->
      <!-- about section -->
      <%
      ResultSet about = home.getPage("about");
      if(about.next()){
    	  %>
      
      <div class="about">
         <div class="container">
            <div class="row d_flex">
               <div class="col-md-5">
                  <div class="about_img">
                     <figure><img src="images/<%=about.getString("image") %>" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-7">
                  <div class="titlepage">
                     <h2>About Our Shop</h2>
                     <p><%=about.getString("info") %></p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <%
      	}
      %>
      <!-- about section -->
      <!-- Our  Glasses section -->
      <div class="glasses">
         <div class="container">
            <div class="row">
               <div class="col-md-10 offset-md-1">
                  <div class="titlepage">
                     <h2>Our Glasses</h2>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor
                        e et dolore magna aliqua. Ut enim ad minim veniam, qui
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <div class="container-fluid">
            <div class="row">
            <%
            	ResultSet product = home.getTable("products");
            	while(product.next()){
            		
            %>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                  <div class="glasses_box">
                     <figure><img src="images/products/<%=product.getString("image") %>" alt="#"/></figure>
                     <h3><span class="text-danger" style="text-decoration: line-through;">$<%=product.getString("price") %></span> &ensp;&ensp;<span class="text-success">$</span><%=product.getString("sell") %></h3>
                     <p><%=product.getString("name") %></p>
                  </div>
               </div>
            <%
            	}
            %>
               <div class="col-md-12">
                  <a class="read_more" href="glasses">Shop Now</a>
               </div>
            </div>
         </div>
      </div>
      <!-- end Our  Glasses section -->
      <!-- Our shop section -->
      <%
      ResultSet best = home.getPage("best");
      if(best.next()){
    	  %>
      <div id="about" class="shop">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-5">
                  <div  class="shop_img">
                     <figure><img src="images/<%=best.getString("image") %>" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-7 padding_right0">
                  <div class="max_width">
                     <div class="titlepage">
                        <h2>Best SunGlasses  At Our shop</h2>
                        <p><%=best.getString("info") %></p>
                        <a class="read_more" href="glasses">Shop Now</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <%} %>
      <!-- end Our shop section -->
      <!-- clients section -->
      <div class="clients">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>What say our clients</h2>
                     <p>orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut la</p>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div id="myCarousel" class="carousel slide clients_Carousel " data-ride="carousel">
                     <ol class="carousel-indicators">
			            <%
			            	ResultSet client = home.getTable("clients");
			            	int clientCount = 0;
			            	boolean check=true;
			            	String Total = " ";
			            	while(client.next()){
			            		%>
		                        <li data-target="#myCarousel" data-slide-to="<%=clientCount %>" <% if(check){out.print("class='active'");}%>></li>
                        <%clientCount++;check=false;}
			            %>
                     </ol>
                     <div class="carousel-inner">
                     <%
                     client = home.getTable("clients");
                     check = true;
                     while(client.next()){
                    	 %>
                    
                        <div class="carousel-item <% if(check){out.print("active");}%>">
                           <div class="container">
                              <div class="carousel-caption ">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="clients_box">
                                          <figure><img src="images/clients/<%=client.getString("image") %>" alt="#"/></figure>
                                          <h3><%=client.getString("name") %></h3>
                                          <p><%=client.getString("info") %></p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     <%    check=false;}
                     %>
                     
                     </div>
                     <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                     <i class='fa fa-angle-left'></i>
                     </a>
                     <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                     <i class='fa fa-angle-right'></i>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end clients section -->
      <!-- contact section -->
      <div id="contact" class="contact">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <form id="request" action="admin/feedback" method="POST" class="main_form">
                     <div class="row">
                        <div class="col-md-12 ">
                           <h3>Contact Us</h3>
                        </div>
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="Name" type="text" name="name"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Phone Number" type="number" name="number"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Email" type="email" name="email">                          
                        </div>
                        <div class="col-md-12">
                           <input class="contactusmess" placeholder="Message" name="message" type="text">
                        </div>
                        <div class="col-md-12">
                           <button class="send_btn">Send</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         <div class="container-fluid">
            <div class="map_section">
               <div id="map">
               </div>
            </div>
         </div>
      </div>
      </div>
      <!-- end contact section -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <ul class="location_icon">
                     <%ResultSet social = home.getTable("social");
                     	while(social.next()){
                     		
                     %>
                        <li><a target="_blank" href="<%= social.getString("link") %>"><i class="<%= social.getString("icon") %>" aria-hidden="true"></i></a><br> <%= social.getString("name") %></li>
                     <%
                     	}
                     %>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script>
         // This example adds a marker to indicate the position of Bondi Beach in Sydney,
         // Australia.
         function initMap() {
           var map = new google.maps.Map(document.getElementById('map'), {
             zoom: 11,
             center: {lat: 40.645037, lng: -73.880224},
             });
         
         var image = 'images/maps-and-flags.png';
         var beachMarker = new google.maps.Marker({
             position: {lat: 40.645037, lng: -73.880224},
             map: map,
             icon: image
           });
         }
      </script>
      <!-- google map js -->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
      <!-- end google map js --> 
   </body>
</html>

