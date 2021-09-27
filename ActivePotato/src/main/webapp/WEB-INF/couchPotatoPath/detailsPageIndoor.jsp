<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<h1>Show Media Details</h1>

<div id="center"> 

	<br>
	<br>
	<img src="https://m.media-amazon.com/images/M/MV5BN2FjNmEyNWMtYzM0ZS00NjIyLTg5YzYtYThlMGVjNzE1OGViXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg" width="300" height="300"/>
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
			<th>External Site Link</th>
			<th>Type</th>
			<th>Length</th>
			</tr>
		</thead>
	<tbody>
		<tr>
			<td>${activity.name}</td>
			<td>${activity.description}</td>
			<td><a href="${activity.url}">Movie Rating URL</a></td>
			<td>${activity.activityType.name}</td>
			<td>${activity.expectedDuration}</td>
	</tbody>
	
	</table>
	</div>
 

	<form action="addInterest.do?id=${activity.id}" method="POST">
		<input type="hidden" name="id" />
		<button type="submit" class="btn btn-primary">Add Activity</button>
	</form>
		
		<br>
		<a href="home.do">Return to Home</a><br/>
</div>


</body>
</html>