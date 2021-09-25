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
	<h1>Please Login!</h1>

	${DEBUG }


	<form action="login.do" method="POST">
		
	Enter username: <input type="text" value ="Username" name="userName" />
	<br>
	Enter password: <input type="text" value ="Password" name="userPassword" />
	<br> 
	
	<input type="submit" name="submit" />
	</form>

	<a href="registerpage.do">Create new profile</a>
	<br />
	<a href="home.do">Return to Home</a>
	<br />
</body>
</html>