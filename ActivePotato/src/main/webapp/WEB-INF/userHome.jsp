<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.update {
	display: inline-block;
	clear: left;
	width: 250px;
	text-align: left;
}

.updateinput {
	display: inline-block;
}

#interest:hover {
	color: blue;
	border: 5px solid rgb(53, 58, 63);
}

.interestLink {
	text-decoration: none;
}

</style>

<title>Active Potato User Home Menu</title>

</head>

<body>
	<nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	Menu
    </button>
    	  <div class="dropdown-menu">
    	 <a class="dropdown-item" href="home.do">Home</a>
    	 <a class="dropdown-item" href="editProfile.do">Edit Profile</a>
    	 <c:if test="${user.role == 'admin'}">
    	 <a class="dropdown-item" href="userAdmin.do">Administrator Menu</a>
    	 </c:if>
    	 <a class="dropdown-item" href="logout.do">Logout</a>
		</div>    
  </nav>



	<div class="jumbotron jumbotron-fluid bs-light"
		style="margin-bottom: 0;">
		<div class="container">
			<div id="center">
				<h1 class="display-6">Welcome ${user.firstName}
					${user.lastName}</h1>
				<br> <img src="${user.profileUrl}" width="200" height="auto" />

			</div>
		</div>
	</div>

	<div style="width: 100%;">
		<div
			style="width: 50%; height: 200px; float: left; background: #343a40; padding: 25px;">
			<div id="right" style="margin-top: 62px">
				<form action="searchActive.do" method="GET">
					<label><b style="color: white">Search Active Potato!</b></label> <input
						type="text" name="keyword"> <input type="submit">
				</form>
			</div>
		</div>

		<div
			style="margin-left: 50%; height: 200px; background: #343a40; padding: 25px;">
			<div id="left" style="margin-top: 62px">
				<form action="searchCouch.do" method="GET">
					<label><b style="color: white">Search Couch Potato!</b></label> <input
						type="text" name="keyword"> <input type="submit">
				</form>
			</div>
		</div>
	</div>

	<div class="container-fluid">

		<div class="row">

			<div class="col-12 col-sm-1" style="background: #343a40;"></div>


			<div class="col-12 col-sm-4"
				style="border: 1px dotted black; border-radius: 5px; padding: 10px;">
				<div id="center">
					<b>Profile Interests</b>
				</div>
				<c:if test="${not empty acts }">
					<c:forEach var="a" items="${acts }">
						<a href="selectActivity.do?id=${a.id}" class="interestLink" style="text-decoration: none;">
							<div id="interest" style="border: 2px solid black; border-radius: 5px; padding: 5px;">

								<img src="${a.activityType.url }" width="50" height="50" />
								${a.name} <br>${a.description }
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

			<div class="col-12 col-sm-2" style="background: #343a40;">
				<div id="center">

					<form action="createActivity.do" method="GET">
						<b style="color: white; margin-bottom: 20px; margin-top: 25px;">New
							Profile Activity</b> <br>
						<button type="submit" class="btn btn-light">Create
							Activity</button>
					</form>


				</div>
			</div>

			<div class="col-12 col-sm-4"
				style="border: 1px dotted black; border-radius: 5px; padding: 10px;">
				<div id="center">
					<b>User Comments</b>
				</div>
				<c:if test="${not empty userComments }">
					<c:forEach var="c" items="${userComments }">
						<a href="selectActivity.do?id=${c.activity.id}"
							class="interestLink" style="text-decoration: none">
							<div id="interest" style="border: 2px solid black; border-radius: 5px; padding: 5px;">
								<c:if test="${empty c.baseComment }">
							On ${c.activity.name }, "${c.comment}"
							</c:if>
								<c:if test="${not empty c.baseComment }">
								You replied to ${c.baseComment.user.username} on ${c.baseComment.activity.name }, "${c.baseComment.comment }"
								<br>
									<b>You: </b>"${c.comment }"
							</c:if>
								<c:if test="${not empty c.comments }">
									<c:forEach var="r" items="${c.comments }">
										<br>
										<b>${r.user.username }</b> replied: "${r.comment }"
							</c:forEach>
								</c:if>
								<br>
							</div>
						</a>
						<br>

					</c:forEach>
				</c:if>
			</div>

			<div class="col-12 col-sm-1" style="background: #343a40;"></div>

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
