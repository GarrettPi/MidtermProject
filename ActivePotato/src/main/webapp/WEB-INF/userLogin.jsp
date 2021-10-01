<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

.update {
	display: inline-block;
	clear: left;
	width: 250px;
	text-align: left;
}

.updateinput {
	display: inline-block;
}
</style>
<title>Welcome to Active Potato</title>

</head>

<body>
<nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	Menu
    </button>
   	  <div class="dropdown-menu">
    	 <a class="dropdown-item" href="home.do">Home</a>
    	 <a class="dropdown-item" href="loginpage.do">Login</a>
		</div>    
  </nav>

	<div class="jumbotron jumbotron-fluid bs-light"
		style="margin-bottom: 500;">
		
		<div id="center">
<br><br><h1 class="normal">Welcome to Active Potato</h1><br>
			<h2 class="normal">User Login</h2>

			<br>
			<form action="login.do" method="POST">
				<label class="update">Enter Username:</label><input
					class="updateinput" type="text" placeholder="Username"
					name="userName" /> <br> <br> <label class="update">Enter
					Password:</label><input class="updateinput" type="password"
					placeholder="Password" name="userPassword" /> <br> <br>
				<input type="submit" name="submit" /> 
			</form><b> or </b><form action="registerpage.do"><input type="submit" value="Create New Account"></form>
		</div>
	</div><br><br><br>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
