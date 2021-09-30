<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="../css/Home.css">
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

<title>Active Potato Search</title>
</head>
<body>
	<div class="container-liquid">
		<div class="topnav">
			<a href="home.do">Home</a><a href="loginpage.do">Login</a>
		</div>
		<div id="top">
			<div id="center">
				<br>
				<h1 class="normal">Welcome to Active Potato</h1>
				<br> <br> <img src="images/outdoorActivities.png"
					height="263.54" width="400" /> <br> <br>
				<p>
					<b>Enter keyword below to find outdoor activities</b>
				</p>

				<br>

				<form action="searchActive.do" method="GET">
					<b>Outdoor Activity: </b><input type="text" name="keyword" /> <input
						class="btn btn-primary" type="submit" value="Search" />
				</form>
			</div>
		</div>
	</div>

</body>
</html>