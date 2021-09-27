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
				<c:if test="${not empty user.interestList }">
					<c:forEach var="a" items="${user.interestList }">
						<div>
						<img src="https://cdn.pixabay.com/photo/2013/07/13/13/36/film-161204_960_720.png" width="50" height="50"/>
						${a.activity.name}Loremipsum dolor sit amet,
							consectetur adipiscing elit. In ullamcorper maximus ante, ut
							laoreet massa pharetra a.</div>
						<br>
					</c:forEach>

				</c:if>
			</div>
			<div class="col-sm-4">
				<%-- 				<div id="center">
					<a href="logout.do">Logout</a>
					<h1>User Home</h1>
					<br> <img src="${user.profileUrl}" width="100" height="100" />
					<br> <br> <b> Welcome ${user.firstName}
						${user.lastName}!</b> <br> <br>
				</div> --%>
				<div id="center">
					<form action="active.do" method="POST">
						<label class="update"><b>Search Active Potato!</b></label><input
							class="updateinput" type="text" name="keyword" /><input
							type="submit" />
					</form>
					<br>
					<form action="couch.do" method="POST">
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