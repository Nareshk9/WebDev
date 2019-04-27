<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Login</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
    </ul>
    <span class="navbar-text">
      <a class="nav-link active" href="login">Login |</a>
    </span>
     <span class="navbar-text">
      <a class="nav-link" href="register">Register |</a>
    </span>
  </div>
</nav>
<br>
<div class="container-fluid row">
<div class="col-lg-4">
<form action="login_confirm" method="post" class="form">
	<h2>Supplier login</h2><hr>
	<input class="form-control mr-sm-2"  placeholder="username" type="text" name="user_id"> <br>
	<input class="form-control mr-sm-2"  placeholder="password" type="password" name="password"> <br>
	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button><br>
</form>
</div>
<div class="col-lg-4">
<form action="login_user_confirm" method="post" class="form">
<h2>User login</h2><hr>
	<input class="form-control mr-sm-2"  placeholder="username" type="text" name="user_id"> <br>
	<input class="form-control mr-sm-2"  placeholder="password" type="password" name="password"> <br>
	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button><br>
</form>
</div>
<div class="col-lg-4">
<form action="login_admin" method="post" class="form">
<h2>Admin login</h2><hr>
	<input class="form-control mr-sm-2"  placeholder="username" type="text" name="user_id"> <br>
	<input class="form-control mr-sm-2"  placeholder="password" type="password" name="password"> <br>
	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button><br>
</form>
</div>
</div>
</body>
</html>