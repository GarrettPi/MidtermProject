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
<title>Active Potato</title>
</head>
<body>
<div id="center"> 
	<h1>Show Outdoor Details</h1>
	<br>
	<br>
	<img src="${activity.imageUrl}" width="300" height="300"/>
	
	<br>
	<br>
	
	<div class="container" ><table class="table thead-dark table-striped table-hover">
		<thead>
			<tr>
			<th>Activity Name</th>
			<th>Description</th>
			<th>Find Activity Near You</th>
			<th>Type</th>
			<th>Expected Duration</th>
			</tr>
		</thead>
	<tbody>
		<tr>
			<td>${activity.name}</td>
			<td>${activity.description}</td>
			<td><a href="${activity.url}">Google Maps</a></td>
			<td>${activity.activityType.name}</td>
			<td>${activity.expectedDuration}</td>
	</tbody>
	
	</table>
	</div>

	<form action="addInterest.do" method="POST">
		<input type="hidden" name="activity"/>
		<button type="button" class="btn btn-primary">Add Activity</button>
	
	</form>
	

	${DEBUG }

	<a href="home.do">Return to Home</a>
	<br />
	</div>
</body>
</html>