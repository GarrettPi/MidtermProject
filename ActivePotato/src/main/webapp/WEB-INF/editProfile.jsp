<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
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
    	 <a class="dropdown-item" href="logout.do">Logout</a>
		</div>    
  </nav>

	<div class="jumbotron jumbotron-fluid bs-light" style="margin-bottom: 0;">
		<div class="container">
			<div id="center">
				<h1 class="display-6">Welcome ${user.firstName}
					${user.lastName}</h1>
				<br> <img src="${user.profileUrl}" width="200" height="auto" />

			</div>
		</div>
	</div>

		<br>
	
	<div id="center">
		<form action="edit.do" method="POST">
			<br> 
			 
				<label class="update">First Name: </label><input class="updateinput" value="${user.firstName}" type="text"name="firstName"> 
				<br> 
				<br> 
				<label class="update">Last Name: </label><input class="updateinput" value="${user.lastName}" type="text" name="lastName"> 
				<br> 
				<br> 
				<label class="update">New Password: </label><input class="updateinput"  type="password"	name="password1"> 
				<br> 
				<br> 
				<label class="update">Re Type Password: </label><input class="updateinput" type="password" name="password2" required> 
				<br> 
				<br> 
				<label class="update">Email Address: </label><input	class="updateinput" value="${user.email}" type="text" name="email">
				<br> 
				<br>
				<label class="update">Profile Image URL: </label><input class="updateinput" value="${user.profileUrl}" type="text" name="profileUrl">
				<br>
				<br>
				<input class="btn btn-secondary" type="submit" value="Submit Profile Changes">

		</form>
	</div>
	<br>
	
	<br>



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