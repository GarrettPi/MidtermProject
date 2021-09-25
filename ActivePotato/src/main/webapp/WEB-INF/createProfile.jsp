<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Potato</title>
</head>
<body>
	<h1>Create New Profile!</h1>

	${DEBUG }

	<form action="login.do" method="POST">
		Enter username:<br> <input type="text" name="userName" /> <input
			type="submit" />
	</form>
	<form action="login.do" method="POST">
		Enter password:<br> <input type="text" name="userPassword" /> <input
			type="submit" />
	</form>
	</form>
	<form action="login.do" method="POST">
		Enter email:<br> <input type="text" name="userPassword" /> <input
			type="submit" />
	</form>

	<a href="home.do">Return to Home</a>
	<br />
</body>
</html>