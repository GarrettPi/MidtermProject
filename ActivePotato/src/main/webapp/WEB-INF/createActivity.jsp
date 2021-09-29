<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>

<!-- <style>
@import url('https://fonts.googleapis.com/css2?family=Acme&display=swap');

	body {
	font-family: 'Acme', sans-serif;
	color: Black;
	}
	h1 {
	font-family: 'Acme', sans-serif;
	font-weight: bolder;
	color: red;
	
	}

</style> -->

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

<title>Create New Activity</title>
</head>
<body>

	<div id="center">

		<h1>Add A New Experience</h1>

		<form action="submitActivity.do" method="POST"> 
			<br>
			<div class="container">
				<label class="update">Name: <br></label> <input
					class="updateinput" type="text" required name="name">
			</div>
			<br>
			<div class="container">
				<label class="update">Expected Duration: <br></label> <input
					class="updateinput" type="text" name="expectedDuration">
			</div>
			<br>
			<div class="container">
				<label class="update">Description: <br></label> <input
					class="updateinput" type="text" name="description">
			</div>
			<br>
			<div class="container">
				<label class="update">url: <br></label> <input
					class="updateinput" type="text" name="url">
			</div>
			<br>
			<div class="container">
				<label class="update">image_url: <br></label> <input
					class="updateinput" type="text" name="imageUrl">
			</div>
			<br>
			<div class="container">
				<label class="update">Activity Category: <br></label> 
				<select class="updateinput" name="category">
				<c:forEach var="activityCategory" items="${activityCategory}">
				<option value = ${activityCategory.id }>${activityCategory.name}</option>
				</c:forEach>
				</select>
			</div>
			<br>
			<div class="container">
				<label class="update">Activity Type: <br></label> 
				<select class="updateinput" name="type">
				<c:forEach var="activityType" items="${activityType }">
				<option value = ${activityType.id }>${activityType.name}</option>
				</c:forEach>
				</select>
			</div>
			<div class="container">
				<input type="submit" value="Add Activity">
			</div>
		</form>
	</div>
	<br>
	<div id="center">
		<a href="home.do">Return Home</a> <br />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
</body>
</html>