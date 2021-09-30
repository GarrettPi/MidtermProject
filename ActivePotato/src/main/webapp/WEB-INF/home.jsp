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

.tab {
	padding-left: 10pt;
}
</style>
<title>Active Potato Home Page</title>

</head>

<body>
	<div class="container">
		<div class="topnav">
			<a href="loginpage.do">User Login</a> <a href="registerpage.do"
				class="tab">Create New Account</a>
		</div>
		<div class="split left">
			<div class="centered">
				<a href="active.do" class="homeButton"> <img
					src="images/activepotato.gif" width="200" height="200" />
				</a>
			</div>
			<div class="centered">
				<a href="active.do" class="homeButton">
					<h1>Active Potato</h1>
				</a>
			</div>
			<br>
			<div class="centered">
				<a href="active.do" class="button">
					<p>Outdoor activities!</p>
				</a>
			</div>
		</div>
		<div class="split right">
			<div class="centered">
				<a href="couch.do" class="homeButton"> <img
					src="images/couchpotato.gif" width="200" height="200" />
				</a>
			</div>
			<div class="centered">
				<a href="couch.do" class="homeButton">
					<h1>Couch Potato</h1>
				</a>
			</div>
			<br>
			<div class="centered">
				<a href="couch.do" class="button">
					<p>Couch activities!</p>
				</a>
			</div>
		</div>
	</div>
	<script src="css/home.js"></script>
</body>
</html>