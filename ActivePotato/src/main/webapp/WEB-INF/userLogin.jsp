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

		<h1>User Login</h1>
	
	<br>
	<form action="login.do" method="POST">
	<label class="update">Enter Username:</label><input class="updateinput" type="text" value ="Username" name="userName" />
	<br>
	<br>
	<label class="update">Enter Password:</label><input class="updateinput" type="text" value ="Password" name="userPassword" />
	<br> 
	<br> 
	<input type="submit" name="submit" />
	</form>
	<br>
	<a href="registerpage.do">Create new profile</a>
	<br>
	<br>
	<a href="home.do">Return Home</a>
	</div>
</body>
</html>