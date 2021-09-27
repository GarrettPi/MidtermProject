<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>

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

	<div id="center">
	<h1>Active Potato Home Page</h1>
	<br>
	<br>
	Welcome to Active Potato!
	<br>
	
	<img src="images/activepotato.gif" width="200" height="200" />	<img src="images/couchpotato.gif" width="200" height="200" />
	<br>
	<br>
	<br>
	
	<p>Active Potato is an assistance app for the everyday individual who doesn't know what to do 
	if they leave their couch or how to choose a movie if they remain on it. The home page is a selection 
	 page split down the center, on the left is 'Active Potato'; on the right side is 'Couch Potato.'
	</p>
	<br>
	<br>
	<form action="active.do" method="POST">
			Active Potato Activity
			<input class="btn btn-warning" type="submit" value="Search" />
	</form>
	<br>
		
	<form action="couch.do" method="POST">
			Couch Potato Activity
			<input class="btn btn-warning" type="submit" value="Search" />
	</form>

	<br>
	<br>
	<a href="loginpage.do">User Login</a>
	<br>
	<br>
	<a href="registerpage.do">Create New Account</a>
	
	<br />
	</div>
</body>
</html>