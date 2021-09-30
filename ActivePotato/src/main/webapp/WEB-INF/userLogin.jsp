<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Home.css">

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
	<div class="container-liquid">
		<div class="topnav">
			<a href="home.do">Home</a><a href="registerpage.do">Create New Account</a>
		</div>
		<div id="center">
<br><br><br>
			<h1 class="normal">User Login</h1>

			<br>
			<form action="login.do" method="POST">
				<label class="update">Enter Username:</label><input
					class="updateinput" type="text" placeholder="Username"
					name="userName" /> <br> <br> <label class="update">Enter
					Password:</label><input class="updateinput" type="password"
					placeholder="Password" name="userPassword" /> <br> <br>
				<input type="submit" name="submit" /> 
			</form> or <form action="registerpage.do"><input type="submit" value="Create New Account"></form>
		</div>
	</div>
</body>
</html>