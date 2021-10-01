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

/* tr:nth-child(even) {
	background-color: #adadad
	opacity: 0.5;
}  */
</style>
<title>Active Potato</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

</head>
<body class="outdoorList">
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
				<c:if test="${empty user }">
					<li class="nav-item"><a class="nav-link" href="loginpage.do">
							Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="registerpage.do"> Register </a></li>
				</c:if>
				<c:if test="${not empty user }">
					<li class="nav-item"><a class="nav-link" href="logout.do">
							Logout </a></li>
				</c:if>
			</ul>
		</div>
	</nav>

	<div class="listOutdoorBody">
		<div id="center" class="container">
			<c:if test="${not empty a }">
				<br>
				<h1>Show Matching Outdoor Activities</h1>

				<br>
				<br>
				<table id="myTable" class="table table-bordered-new">
					<tbody>
					<thead>
						<tr>
							<th onclick="sortTable(0)">Name &#x25b4;&#x25be;</th>
							<th onclick="sortTable(1)">Expected Duration (Min)
								&#x25b4;&#x25be;</th>

							<th>Average Activity Rating</th>
							<th>Description</th>
							<th>URL</th>
							<th>Create Date</th>
							<th>Add Activity To Interests</th>
						</tr>
					</thead>
					<c:forEach var="act" items="${a }">
						<tr>
							<td><a href="selectActive.do?actId=${act.id}">${act.name}</a></td>
							<td>${act.expectedDuration }</td>
							<td>${act.avgRating }</td>
							<td>${act.description }</td>
							<td>${act.url }</td>
							<td>${act.createDate }</td>
							<td>
								<form action="addInterest.do?id=${act.id}" method="POST">
									<input type="hidden" name="id" />
									<button type="submit" class="btn btn-secondary">Add To
										Interests</button>
								</form>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${empty a }">
				<h3>No activities match that keyword.</h3>
			</c:if>
		</div>
		<script>
				function sortTable(n) {
					var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
					table = document.getElementById("myTable");
					switching = true;
					dir = "asc";
					while (switching) {
						switching = false;
						rows = table.rows;
						for (i = 1; i < (rows.length - 1); i++) {
							shouldSwitch = false;
							x = rows[i].getElementsByTagName("TD")[n];
							y = rows[i + 1].getElementsByTagName("TD")[n];
							if (dir == "asc") {
								if (x.innerHTML.toLowerCase() > y.innerHTML
										.toLowerCase()) {
									shouldSwitch = true;
									break;
								}
							} else if (dir == "desc") {
								if (x.innerHTML.toLowerCase() < y.innerHTML
										.toLowerCase()) {
									shouldSwitch = true;
									break;
								}
							}
	<div class="container">
		<div class="topnav">
			<a href="home.do">Home</a>
		</div>
	</div>
	<div id="center" class="container">
		<c:if test="${not empty a }">
			<h1>Show Matching Outdoor Activities</h1>
			<br>
			<table id="myTable" class="table table-bordered">
				<tbody>
				<thead>
					<tr>
						<th onclick="sortTable(0)">Name &#x25b4;&#x25be;</th>
						<th onclick="sortTable(1)">Expected Duration (Min)
							&#x25b4;&#x25be;</th>

						<th>Average Activity Rating</th>
						<th>Description</th>
						<th>URL</th>
						<th>Create Date</th>
						<th>Add Activity To Interests</th>
					</tr>
				</thead>
				<c:forEach var="act" items="${a }">
					<tr>
						<td><a href="selectActive.do?actId=${act.id}">${act.name}</a></td>
						<td>${act.expectedDuration }</td>
						<c:if test="${act.avgRating > 0 }">
							<td>${act.avgRating }</td>
						</c:if>
						<c:if test="${act.avgRating <= 0 }">
							<td>No Ratings</td>
						</c:if>
						<td>${act.description }</td>
						<td>${act.url }</td>
						<td>${act.createDate }</td>
						<td>
							<form action="addInterest.do?id=${act.id}" method="POST">
								<input type="hidden" name="id" />
								<button type="submit" class="btn btn-secondary">Add
									Activity</button>
							</form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${empty a }">
			<h3>No activities match that keyword.</h3>
		</c:if>
		
	</div>
	<script>
		function sortTable(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("myTable");
			switching = true;
			dir = "asc";
			while (switching) {
				switching = false;
				rows = table.rows;
				for (i = 1; i < (rows.length - 1); i++) {
					shouldSwitch = false;
					x = rows[i].getElementsByTagName("TD")[n];
					y = rows[i + 1].getElementsByTagName("TD")[n];
					if (dir == "asc") {
						if (x.innerHTML.toLowerCase() > y.innerHTML
								.toLowerCase()) {
							shouldSwitch = true;
							break;
						}
						if (shouldSwitch) {
							rows[i].parentNode.insertBefore(rows[i + 1],
									rows[i]);
							switching = true;
							switchcount++;
						} else {
							if (switchcount == 0 && dir == "asc") {
								dir = "desc";
								switching = true;
							}
						}
					}
				}
			</script>
	</div>
</body>
</html>