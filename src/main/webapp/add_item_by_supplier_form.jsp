<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Item</title>
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
  <a class="navbar-brand" href="supplier_order">My Orders</a>
 
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="all_items_by_supplier">All items<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_item_by_supplier">Add item</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="update_item_by_supplier">Update Item</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="delete_item_by_supplier">Delete Item</a>
      </li>
    </ul>
    <span class="navbar-text">
      <a class="nav-link" href="edit_suppliers_profile">Edit Profile |</a>
    </span>
     <span class="navbar-text">
      <a class="nav-link" href="logout">Logout |</a>
    </span>
  </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">ADD ITEM</h1>
    </div>
</section>
<hr>
<div class="container col-lg-4 ">
<form action="add_item" class="form" method="post">
	Category:
	<select class="form-control mr-sm-2" name="category">
		<option value="">select category</option>
		<option value="cement">cement</option>
		<option value="sand and aggregates">sand & aggregates</option>
		<option value="steel bar">steel bars</option>
		<option value="bricks and blocks">bricks and blocks</option>
		<option value="electrical">electrical</option>
		<option value="plumbing">plumbing</option>
		<option value="wooden products">wooden products</option>
		<option value="tiles">tiles</option>
	</select>
	<br>
	Item name:
	<input class="form-control mr-sm-2" type="text" name="item_name"><br>
	Brand:
	<input class="form-control mr-sm-2" type="text" name="brand"><br>
	Unit Price:
	<input class="form-control mr-sm-2" type="text" name="unit_price"><br>
	Unit Count:
	<input class="form-control mr-sm-2" type="text" name="unit_count"><br>
	Discount:
	<input class="form-control mr-sm-2" type="text" name="discount"><br>
	Image link:
	<input class="form-control mr-sm-2" type="text" name="link"><br><hr>
	<button class="btn btn-danger my-2 my-sm-0" type="submit">Add</button><br>
</form>
<hr>
</div>
</body>
</html>