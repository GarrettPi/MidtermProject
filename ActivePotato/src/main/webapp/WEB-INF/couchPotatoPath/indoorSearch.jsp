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

<title>Couch Potato Search</title>
</head>
<body>
	<div class="container">
		<div id="top">
			<div id="center">
	<br>
	<h1>Welcome to Active Potato</h1>
	<br> 
	<br>
	<img src="images/indoorActivities.png" height="263.54" width="400"/>
	<br> 
	<br>
		<p><b>Enter keyword below to find indoor activities</b></p>
	
	<br>
	
	<form action="searchCouch.do" method="GET">
		<b>Indoor Activity: </b><input type="text" name="keyword" />
		<input class="btn btn-primary" type="submit" value="Search" />
	</form>
	<br>

	<a href="home.do">Return to Home</a><br/>
			</div>
		</div>
	</div>

</body>
</html>