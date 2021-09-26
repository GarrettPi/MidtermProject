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
	<h1>Indoor Search!</h1>
	<br> Enter the media activity you would like to search for:
	<br>
	<form action="getActivity.do" method="GET">
		Enter media tile:<br> <input type="text" name="keyword" />
		<input type="submit" value="Show Media" />
	</form>

	${DEBUG }
	<a href="home.do">Return to Home</a><br/>
</body>
</html>