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
	<%-- <c:if test="${not empty user }">
	${user.username }
	</c:if> --%>
	<h1>Outdoor Search!</h1>
	<br> Enter the outdoor activity you would like to search for:
	<br>
	<form action="searchActive.do" method="GET">
		Enter outdoor activity:<br> <input type="text" name="keyword" />
		<input type="submit" value="Show Activities" />
	</form>

	${DEBUG }
	<a href="home.do">Return to Home</a><br/>
</body>
</html>