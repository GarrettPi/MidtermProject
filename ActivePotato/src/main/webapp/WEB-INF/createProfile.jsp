<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Home.css">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

<style>
#right {
	text-align: right;
}

#center {
	text-align: center;
}

#left {
	text-align: left;
}
</style>

<title>Welcome to Active Potato</title>


</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	<b style="color: white;">Menu</b>
    </button>
   	  <div class="dropdown-menu">
    	 <a class="dropdown-item" href="home.do">Home</a>
    	 <c:if test="${empty user }">
    	 <a class="dropdown-item" href="loginpage.do">Login</a>
    	 </c:if>
    	 <c:if test="${empty user }">
    	 <a class="dropdown-item" href="registerpage.do">Register</a>
	   	 </c:if>
    </div>
  </nav>


<div class="container-liquid">

	<div id="center">
	<br><br><br>
	<h1 class="normal">New User Registration</h1>


	<form action="register.do" method="POST">
		<br>
		<label class="update">First Name: </label><input class="updateinput" type="text" name="firstName">
		<br>
		<br>
		<label class="update">Last Name: </label><input class="updateinput" type="text" name="lastName">
		<br>
		<br>
		<label class="update">User Name: </label><input class="updateinput" type="text" name="username">
		<br>
		<br>
		<label class="update">Password: </label><input class="updateinput" type="text" name="password">
		<br>
		<br>
		<label class="update">Email Address: </label><input class="updateinput" type="text" name="email">
		<br>
		<br>
		<label class="update">Profile Image URL: </label><input class="updateinput" type="text" name="profileUrl">
		<br>
		<br>


		<input class="btn btn-secondary" type="submit" value="Submit User Registration">

	</form>
	</div>
	</div>
	<br>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<footer class="footer mt-auto py-3 bg-dark">
		<div class="container">
			<span class="text-muted"> Active Potato </span>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
