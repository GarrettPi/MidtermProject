<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Potato Login</title>
</head>
<body>
	<h1>User Home</h1>

	<form action="active.do" method="POST">
		Search Active Potato!<br> <input type="submit" />
	</form>
	<br>
	<br>
	<form action="couch.do" method="POST">
		Search Couch Potato! <br>
		<input type="submit" />
	</form>
	<br>
	<br>
	<form action="editProfile.do" >
		<input type="hidden" name="user" value="${user}" />
			<input class="btn btn-primary" type="submit" value="Edit Profile" />
	</form> 
	<br>
	<br>
	<a href="home.do">Return to Home</a>
	<br />
</body>
</html>