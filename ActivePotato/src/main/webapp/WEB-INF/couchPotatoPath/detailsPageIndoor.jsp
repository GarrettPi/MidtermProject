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
</style>
<title>Active Potato</title>

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
    	 <a class="dropdown-item" href="logout.do">Logout </a>
    	 </c:if>
    	 <c:if test="${empty user }">
    	 <a class="dropdown-item" href="registerpage.do">Register</a>
	   	 </c:if>
    </div>
  </nav>
	

<div class="jumbotron jumbotron-fluid bs-light"
		style="margin-bottom: 0;">
	<div id="center">
		<h1>Show Media Details</h1>

		<br> <br> <img src="${activity.imageUrl}" width="300"
			height="auto" /> <br> <br>
		<p>
			<b>Media Trailer</b>
		</p>
		<iframe src="${activity.trailerUrl }" width="700px" height="400"></iframe>

<br>
<br>

		<div class="container">
			<table class="table thead-dark table-striped table-hover">
				<thead>
					<tr>
						<th>Activity Name</th>
						<th>Description</th>
						<th>External Site Link</th>
						<th>Type</th>
						<th>Length</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${activity.name}</td>
						<td>${activity.description}</td>
						<td><a href="${activity.url}" target="_blank">Source URL</a></td>
						<td>${activity.activityType.name}</td>
						<td>${activity.expectedDuration}</td>
				</tbody>

			</table>
		</div>

		<form action="addComment.do?activityId=${activity.id}" method="POST">
			Comment: <input type="text" placeholder="comment" name="comment" />
			<button type="submit" class="btn btn-secondary">Add Comment</button>
		</form>
		<br>
		<form action="addInterest.do?id=${activity.id}" method="POST">
			<input type="hidden" name="id" />
			<button type="submit" class="btn btn-secondary">Add Activity
				To Interests</button>
		</form>
		<br>
		<c:if test="${user.id == activity.user.id }">
			<form action="deleteActivity.do?activityId=${activity.id}"
				method="POST">
				<input type="hidden" name="activity" />
				<button type="submit" class="btn btn-secondary">Delete
					Activity</button>
			</form>
		</c:if>
		
		<br>
		<br>
		
		
		<div class="container" >
			<table class="table thead-dark table-striped table-hover" >
				<thead>
					<tr>
						<th>Username</th>
						<th>Rating</th>
						<th>Comments</th>
						<th>Date Added</th>
						<th>Delete</th>
						<th>Reply</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="c" items="${comments }">
						<c:if test="${empty c.experienceId }">
							<tr>
								<td>${c.user.getUsername()}</td>
								<td></td>
								<td>${c.comment}</td>
								<td>${c.commentDate}</td>
								<c:if test="${c.user.id == user.id }">
									<td><form action="deleteComment.do?commentId=${c.id}"
											method="POST">
											<input type="submit" value="delete">
										</form></td>
								</c:if>
								<c:if test="${c.user.id != user.id }">
									<td></td>
									<td><form action="addReply.do?commentId=${c.id}"
											method="POST">
											<input type="submit" value="Reply">
										</form></td>
								</c:if>
							</tr>
						</c:if>
					</c:forEach>
					<c:forEach var="e" items="${experiences}">
						<tr>
							<td>${e.interest.user.getUsername()}
							<td>${e.rating }</td>
							<c:forEach var="comment" items="${comments }">
								<c:if
									test="${not empty comment.experienceId && comment.experienceId == e.id}">
									<td>${comment.comment}</td>
								</c:if>
							</c:forEach>
							<td>${e.experienceDate}</td>
							<c:if test="${e.interest.user.id == user.id }">
								<td><form action="deleteExperience.do?experienceId=${e.id}"
										method="POST">
										<input type="submit" value="delete">
									</form></td>
							</c:if>
							<c:if test="${e.interest.user.id != user.id }">
								<td></td>
								<c:if test="${not empty e.commentId }">
									<td><form action="addReply.do?commentId=${e.commentId}"
											method="POST">
											<input type="submit" value="Reply">
										</form></td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	</div>
	<br>

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