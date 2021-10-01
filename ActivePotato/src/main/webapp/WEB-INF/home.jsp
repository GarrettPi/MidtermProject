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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
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
					<li class="nav-item"><a class="nav-link" href="loginpage.do">
							Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="registerpage.do"> Register </a></li>
				</ul>
			</div>
		</nav>
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