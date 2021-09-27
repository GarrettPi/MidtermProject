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
<c:if test="${not empty a }">
		<h1>Show Matching Outdoor Activities</h1>
		<br>
		<table>
			<c:forEach var="act" items="${a }">
				<tr>
					<td>${act.id }</td>
					<td><a href="selectActive.do?actId=${act.id}">${act.name}</a></td>
				</tr>
			</c:forEach>
		</table>


	</c:if>
	<c:if test="${empty a }">
	No activities match that keyword.
	</c:if>

	<a href="home.do">Return to Home</a>
	<br />
</body>
</html>