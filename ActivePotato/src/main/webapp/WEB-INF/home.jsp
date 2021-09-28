<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Home.css"></link>

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
<title>Active Potato Home Page</title>

</head>

<body>
   <div class="container">
	<div id="top">
			Welcome to Active Potato!
			   <a href="loginpage.do">User Login</a>
   			    <a href="registerpage.do">Create New Account</a>
	</div>

	<a href="active.do" class="homeButton">
		<div class="split left">
			<div class="centered">
				<img src="images/activepotato.gif" width="200" height="200" />
				<h2>Active Potato</h2>
				<p>Click this side to find outdoor activities!</p>
			</div>
		</div>
	</a>
	<a href="couch.do" class="homeButton">
		<div class="split right">
			<div class="centered">
				<img src="images/couchpotato.gif" width="200" height="200" />
				<h2>Couch Potato</h2>
				<p>Click this side to find couch friendly activities!</p>
			</div>
		</div>
	</a>
	</div>
</body>
</html>