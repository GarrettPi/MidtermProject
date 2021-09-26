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
	<h1>Show Matching Indoor Activities</h1>
	Checked Print 
	<c:if test="${not empty a }">
	${a }
	</c:if>
	<br>
	Default print ${a}
	<c:if test="${empty a }">
	Empty
	</c:if>

	<a href="home.do">Return to Home</a>
	<br />
</body>
</html>