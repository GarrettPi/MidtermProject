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
		<c:if test="${! empty(a)}  ">
		${a}
		</c:if>
		
<%-- 		<table>
			<c:forEach var="activity" items="${a}">
				<tr>
					<td>${activity.id}</td>
 <td><a href="getPokemon.do?pid=${p.id}">${p.name}</a></td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
		<c:if test="${empty a}">
			<p>No Activity Found</p>
		</c:if> --%>
		
	Default print	
	${a}

	<a href="home.do">Return to Home</a>
	<br />
</body>
</html>