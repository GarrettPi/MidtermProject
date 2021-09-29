<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <jsp:include page="bootstrapHead.jsp"></jsp:include>
 --%>
 
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



#interest:hover {
	color: blue;
	border: 5px solid black;
}

.interestLink {
	text-decoration: none;
}

#userContainer {
	align-items: center;
    height: 100vh;
}

#userInterest {
	overflow-y: scroll;
	height: 50%;
}



</style>

<title>Active Potato User Home Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="home.do">
						Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="editProfile.do">
						Edit Profile </a></li>
				<li class="nav-item"><a class="nav-link" href="logout.do">
						Log Out </a></li>
			</ul>
		</div>
	</nav>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<div id="center">
				<h1 class="display-6">Welcome ${user.firstName}
					${user.lastName}</h1>
				<br>

				<img src="${user.profileUrl}" width="200" height="auto" />

			</div>
		</div>
	</div>


	
		<div id="center">
			<form action="searchActive.do" method="GET">
				<label class="update"><b>Search Active Potato!</b></label>
				<input class="updateinput" type="text" name="keyword" >
				<input type="submit" >
			</form>
			<br>
			<form action="searchCouch.do" method="GET">
				<label class="update"><b>Search Couch Potato!</b></label>
				<input class="updateinput" type="text" name="keyword" >
				<input type="submit" >
			</form>
			<br>
					<form action="createActivity.do" method="GET">
						<button type="submit" class="btn btn-primary">Add
							Activity</button>
					</form>
		</div>
	
	<br>
	<hr>

	<div class="container-fluid">
		<div class="row" id="userContainer">

			<div class="col-12 col-sm-6" id="userInterest" style="border: 1px dotted black; border-radius: 5px; padding: 10px;">
				<div id="center">Profile Interests</div>
				<c:if test="${not empty acts }">
					<c:forEach var="a" items="${acts }">
						<a href="selectActivity.do?id=${a.id}" class="interestLink">
							<div id="interest" style="border: 2px solid black; border-radius: 5px; padding: 5px;" >
								<img src="${a.activityType.url }" width="50" height="50" />
								${a.name} <br> Loremipsum dolor sit amet, consectetur
								adipiscing elit. In ullamcorper maximus ante, ut laoreet massa
								pharetra a.
								<form action="addExperience.do?id=${a.id }" method="post">
									<input type="submit" value="Add Experience">
								</form>
								<form action="removeInterest.do?id=${a.id }" method="POST">
									<input type="submit" value="Delete">
								</form>
							</div>
						</a>
						<br>
					</c:forEach>

				</c:if>
			</div>

			<div class="col-12 col-sm-6" id="userInterest" style="border: 1px dotted black; border-radius: 5px; padding: 10px;">
				<div id="center">User Comments</div>
				<c:if test="${not empty userComments }">
					<c:forEach var="c" items="${userComments }">
						<div id="interest" style="border: 2px solid black; border-radius: 5px; padding: 5px;">

							${c.comment}
						<br>
					</c:forEach>

				</c:if>
			</div>

		</div>
	</div>
	<br>


	<footer class="footer mt-auto py-3 bg-dark">
		<div class="container">
			<span class="text-muted"> Active Potato </span>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>
