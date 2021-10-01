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
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="home.do">
							Home </a></li>
					<li class="nav-item"><a class="nav-link"
						href="registerpage.do"> Register </a></li>
				</ul>
			</div>
		</nav>
		<div id="center">
			<br>
			<br>
			<br>
			<h1 class="normal">User Login</h1>

			<br>
			<form action="login.do" method="POST">
				<label class="update">Enter Username:</label><input
					class="updateinput" type="text" placeholder="Username"
					name="userName" /> <br> <br> <label class="update">Enter
					Password:</label><input class="updateinput" type="password"
					placeholder="Password" name="userPassword" /> <br> <br>
				<input type="submit" name="submit" />
			</form>
			or
			<form action="registerpage.do">
				<input type="submit" value="Create New Account">
			</form>
		</div>
	</div>
</body>
</html>