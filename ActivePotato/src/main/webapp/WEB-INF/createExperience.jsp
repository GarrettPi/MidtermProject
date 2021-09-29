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
		
<title>Welcome to Active Potato</title>
</head>
<body>

	<div id="center">
	
	<h1>Add A New Experience</h1>
		
	<form action="createExperience.do?interestId=${interest.id}" method="POST">
		<br>
		<div class="container">
		<label class="update">Rating: <br>
		</label><input class="updateinput" type="number" placeholder="Rating out of 10" required name="rating">
		</div>
		<br>
		<div class="container">
		<label class="update">Date of Experience: <br>
		</label><input class="updateinput" type="date" value="${experience.localDateNow}" name="expDate">
		</div>
		<br>
		<div class="container">
		<label>Comments:</label>
		<br>
		<br>
		<textarea rows="5" cols="50" placeholder="Comments about the experience..." name="comment"></textarea>
		</div>
		<br>
				
		<div class="container">
		<input type="submit" value="Add Experience">
		</div>
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