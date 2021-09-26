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
	
	<h1>New User Registration</h1>
		
	
	<form action="register.do" method="POST">
		<br>
		<label class="update">First Name: </label><input class="updateinput" type="text" name="firstName">
		<br>
		<br>
		<label class="update">Last Name: </label><input class="updateinput" type="text" name="lastName">
		<br>
		<br>
		<label class="update">User Name: </label><input class="updateinput" type="text" name="username">
		<br>
		<br>
		<label class="update">Password: </label><input class="updateinput" type="text" name="password">
		<br>
		<br>
		<label class="update">Email Address: </label><input class="updateinput" type="text" name="email">
		<br>
		<br>
				
		<input class="btn btn-primary" type="submit" value="Submit User Registration"> 
			
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