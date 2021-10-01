<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Home.css">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
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
	<nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	<b style="color: white;">Menu</b>
    </button>
   	  <div class="dropdown-menu">
    	 <a class="dropdown-item" href="home.do">Home</a>
    	 <c:if test="${empty user }">
    	 <a class="dropdown-item" href="loginpage.do">Login</a>
    	 </c:if>
    	 <c:if test="${not empty user }">
    	 <a class="dropdown-item" href="logoutpage.do">Logout </a>
    	 </c:if>
    	 <c:if test="${empty user }">
    	 <a class="dropdown-item" href="registerpage.do">Register</a>
	   	 </c:if>
    </div>
  </nav>
		
	<div class="jumbotron jumbotron-fluid bs-light" style="margin-bottom: 0;">
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
						class="btn btn-secondary" type="submit" value="Search" />
				</form>
			</div>
		</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>