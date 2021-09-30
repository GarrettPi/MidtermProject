<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>

<!-- <style>
@import url('https://fonts.googleapis.com/css2?family=Acme&display=swap');

	body {
	font-family: 'Acme', sans-serif;
	color: Black;
	}
	h1 {
	font-family: 'Acme', sans-serif;
	font-weight: bolder;
	color: red;
	
	}

</style> -->

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

<title>Reply to Comment</title>
</head>
<body>

	<div id="center">

		<h1>Replying to ${comment.user.username } on ${comment.activity.name }</h1>

		<form action="createReply.do?baseCommentId=${comment.id }" method="POST"> 
			<br>
			<div>
			<input type="text" name="comment" required placeholder="Enter your reply">
			</div>
			<div class="container">
				<input type="submit" value="Reply">
			</div>
		</form>
	</div>
	<br>
	<div id="center">
		<a href="home.do">Return Home</a> <br />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
</body>
</html>