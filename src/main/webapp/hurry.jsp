<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hurry up</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
//allow access only if session exists
String user = "";
if(session.getAttribute("flag")==null){
	response.sendRedirect("loginform.jsp");
}else user = (String) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="welcome.jsp">Home</a>
  <div class="dropdown-expand">
  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
   All Categories <span class="caret"></span>
  </button>
  <ul class="dropdown-menu bg-dark">
    <li><a class="nav-link" href="display_categories?b=cement">Cement</a></li>
    <li><a class="nav-link" href="display_categories?b=sand and aggregates">Sand and Aggregates</a></li>
    <li><a class="nav-link" href="display_categories?b=steel bar">Steel Bars</a></li>
    <li><a class="nav-link" href="display_categories?b=bricks and blocks">Bricks and Blocks</a></li>
    <li><a class="nav-link" href="display_categories?b=electrical">Electrical</a></li>
    <li><a class="nav-link" href="display_categories?b=plumbing">Plumbing</a></li>
    <li><a class="nav-link" href="display_categories?b=wooden products">Wooden Products</a></li>
    <li><a class="nav-link" href="display_categories?b=tiles">Tiles</a></li>
    <li><a class="nav-link" href="display_categories?b=bathroom accessories">Bathroom Accessories</a></li>
    <li><a class="nav-link" href="display_categories?b=hardware fixtures">Hardware Fixtures</a></li>
    <li><a class="nav-link" href="display_categories?b=paint and finishes">Paint and Finishes</a></li>
    <li><a class="nav-link" href="display_categories?b=lighting and fixtures">Lighting and Fixtures</a></li>
  </ul>
</div>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="cart">Cart</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="user_order">My Orders</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="hurry">Hurry Up</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="discount">Discounts</a>
      </li>
    </ul>
    
    <span class="navbar-text">
      <a class="nav-link" href="edit_profile">Edit Profile |</a>
    </span>
     <span class="navbar-text">
      <a class="nav-link" href="logout">Logout |</a>
    </span>
    
  </div>
</nav>


<div class="container">

<hr>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Only few left</h1>
    </div>
</section>

<div class="row">
<c:forEach var="it" items="${i}">
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap img-responsive" > 
			<img style="width:150px" src="${it.getLink()}">
			
		</div>
		<figcaption class="info-wrap">
			<h5 class="title text-dots"><c:out value="${it.getname()}"/></h5>
			<h6 class="btn-overlay" href="#"><c:out value="${it.getbrand()}"/></h6>
			<div class="price-wrap h5">
					<span class="price-new">Rs.<c:out value="${it.getprice()}"/></span>
					<h6 class="v">Discount= ${it.getdiscount()}%</h6>
				</div> <!-- price-wrap.// -->
			<div class="action-wrap">
		<c:if test="${it.getcount()>0}">
				<form action="add_to_cart?b=${it.getid()}" method="post">
				Quantity:
				<input class="form-control mr-sm-2 col-lg-4" type="text" name="item_count" value="1"><hr>
				<button class="btn btn-warning btn-sm float-left" type="submit"><i class="fa fa-shopping-cart"></i> Add to cart</button>
				</form>
				<a href="more_details?b=${it.getid()}" class="btn btn-primary btn-sm float-right"> More </a>
		</c:if>		
				
			</div> <!-- action-wrap -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
</c:forEach>
</div> <!-- row.// -->


</div> 

</body>
</html>