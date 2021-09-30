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
<title>Active Potato</title>
</head>
<body>
	<div id="center">
		<h1>Show Outdoor Details</h1>
		<br> <br> <img src="${activity.imageUrl}" width="300"
			height="auto" /> <br> <br>

		<div class="container">
			<table class="table thead-dark table-striped table-hover">
				<thead>
					<tr>
						<th>Activity Name</th>
						<th>Description</th>
						<th>Find Activity Near You</th>
						<th>Type</th>
						<th>Expected Duration</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${activity.name}</td>
						<td>${activity.description}</td>
						<td><a href="${activity.url}" target="_blank">Google Maps</a></td>
						<td>${activity.activityType.name}</td>
						<td>${activity.expectedDuration}</td>
				</tbody>

			</table>
		</div>
		<form action="addComment.do?activityId=${activity.id}" method="POST">
			Comment: <input type="text" placeholder="comment" name="comment" />
			<button type="submit" class="btn btn-primary">Add Comment</button>
		</form>
	<br>
		<form action="addInterest.do?id=${activity.id}" method="POST">
			<input type="hidden" name="activity" />
			<button type="submit" class="btn btn-primary">Add Activity
				To Interests</button>

		</form>
		<br>
		<c:if test="${user.id == activity.user.id }">
			<form action="deleteActivity.do?activityId=${activity.id}"
				method="POST">
				<input type="hidden" name="activity" />
				<button type="submit" class="btn btn-primary">Delete
					Activity</button>

			</form>

		</c:if>

		<div class="container">
			<table class="table thead-dark table-striped table-hover">
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
		${DEBUG } <a href="home.do">Return to Home</a> <br />
	</div>
</body>
</html>