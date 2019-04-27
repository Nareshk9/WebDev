<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profle</title>
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
<hr>
<div class="container">
<form class="form col-lg-6" action="confirm_user_profile" method="post">
     Username: ${i.getuser()}<hr>
	<input class="form-control mr-sm-2"  value="${i.getusername()}" type="text" name="username"><br>
	<input class="form-control mr-sm-2"  value="${i.getaddress()}" type="text" name="address"><br> 
	<input class="form-control mr-sm-2"  value="${i.getcontact()}" type="text" name="contact"><br>
	<input class="form-control mr-sm-2"  value="${i.getemail()}" type="text" name="email"><br>
	<input class="form-control mr-sm-2"  value="${i.getpassword()}" type="text" name="password"><br>
	<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Update</button><br>
</form>
</div>
</body>
</html>