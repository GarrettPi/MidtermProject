<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<title>Active Potato</title>
</head>
<body>
	<div class="container">
		<c:if test="${not empty a }">
			<h1>Show Matching Indoor Activities</h1>
			<br>
			<table class="table table-bordered">
				<tbody>
				<thead>
					<tr>
						<th>Name</th>
						<th>Expected Duration (Min)</th>
						<th>Description</th>
						<th>URL</th>
						<th>Create Date</th>
					</tr>
				</thead>
				<c:forEach var="act" items="${a }">
					<tr>
						<td><a href="selectCouch.do?actId=${act.id}">${act.name}</a></td>
						<td>${act.expectedDuration }</td>
						<td>${act.description }</td>
						<td>${act.url }</td>
						<td>${act.createDate }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${empty a }">
	No activities match that keyword.
	</c:if>
		<a href="home.do">Return to Home</a> <br />
	</div>
</body>
</html>