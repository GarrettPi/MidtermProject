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
	<h1>Active Potato Home Page</h1>
	<br>

	<form action="active.do" method="POST">
		<label class="update"><b>Search Active Potato!</b></label><input class="updateinput"type="text" name="keyword" /><input
			type="submit" />
	</form>
	<br>
	<form action="couch.do" method="POST">
		<label class="update"><b>Search Couch Potato!</b></label> <input class="updateinput" type="text" name="keyword" /><input
			type="submit" />
	</form>
	<br>
	<br>
	<a href="loginpage.do">User Login</a>
	<br>
	<br>
	<a href="couch.do">Indoor Search</a>
	<br>
	<br>
	<a href="active.do">Outdoor Search</a>
	<br />
	</div>
</body>
</html>