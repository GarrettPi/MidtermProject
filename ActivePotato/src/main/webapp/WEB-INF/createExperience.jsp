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
	
<title>Welcome to Active Potato</title>
</head>
<body>

	<div id="center">
	
	<h1>New Experience</h1>
		
	
	<form action="createExperience.do?interestId=${interest.id}" method="POST">
		<br>
		<label class="update">Rating: </label><input class="updateinput" type="number" placeholder="Rating out of 10" required name="rating">
							value="YYYY-MM-DD"
		<input type="date" value="${experience.localDateNow}" name="expDate">
		
		<!-- <label class="update">Date of Experience: </label><input class="updateinput" type="date" name="expDate"> -->
		<label class="update">Comments: </label><input class="updateinput" type="text" size="50" placeholder="Comments about the experience..." name="comment">
		
		<input class="btn btn-primary" type="submit" value="Submit New Experience">
	</form>
	</div>
	<br>
	<div id="center">
	<a href="home.do">Return Home</a>
	<br />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>