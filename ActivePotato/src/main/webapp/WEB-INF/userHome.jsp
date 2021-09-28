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
	<div class="container">
		<div class="row" id="headContainer">
			<div class="col-sm-12" id="headColumns">
				<div id="center">
					<a href="logout.do">Logout</a>
					<h1>User Home</h1>
					<br> <img src="${user.profileUrl}" width="100" height="100" />
					<br> <br> <b> Welcome ${user.firstName}
						${user.lastName}!</b> <br> <br>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" id="userContainer">
			<div class="col-sm-4" id="userInterest">
				<c:if test="${not empty acts }">
					<c:forEach var="a" items="${acts }">
						<a href="selectActivity.do?id=${a.id}" class="interestLink">
						<div id="interest">
							<img src="${a.activityType.url }" width="50" height="50" />
							${a.name} <br> Loremipsum dolor sit amet, consectetur
							adipiscing elit. In ullamcorper maximus ante, ut laoreet massa
							pharetra a.
							<form action="removeInterest.do?id=${a.id }" method="POST"><input type="submit" value="Delete"></form>
						</div>
						</a>
						<br>
					</c:forEach>

				</c:if>
			</div>
			<div class="col-sm-4">
				<div id="center">
					<form action="searchActive.do" method="GET">
						<label class="update"><b>Search Active Potato!</b></label><input
							class="updateinput" type="text" name="keyword" /><input
							type="submit" />
					</form>
					<br>
					<form action="searchCouch.do" method="GET">
						<label class="update"><b>Search Couch Potato!</b></label> <input
							class="updateinput" type="text" name="keyword" /><input
							type="submit" />
					</form>
					<br> <br>
					<form action="editProfile.do">
						<input type="hidden" name="user" value="${user}" /> <input
							class="btn btn-primary" type="submit" value="Edit Profile" />
					</form>
					<br> <br> <a href="userHome.do">Return to Home</a> <br />
				</div>
			</div>
		</div>
	</div>

</body>
</html>