<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp"></jsp:include>
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
<title>Couch Potato</title>

</head>

<body class="indoorList">
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

<div class="listIndoorBody">
		<div class="container-liquid" style="padding-left: 30px; padding-right: 30px;" >
			<div id="center">
			<c:if test="${not empty a }">

				<br>
				<h1>Show Matching Indoor Activities</h1>

				<br>
				<br>
				<table id="myTable" class="table table-bordered"
					style="color: rgb(234, 234, 234) ">
					<tbody>
					<thead>
						<tr>
							<th onclick="sortTable(0)">Name &#x25b4;&#x25be;</th>
							<th onclick="sortTable(1)">Expected Duration (Min)
								&#x25b4;&#x25be;</th>
							<th>Average Activity Rating</th>
							<th>Description</th>
							<th>Activity Link</th>
							<th>Create Date</th>
							<th>Add Activity To Interests</th>
						</tr>
					</thead>
					<c:forEach var="act" items="${a }">
						<tr>
							<td><a href="selectCouch.do?actId=${act.id}">${act.name}</a></td>
							<td>${act.expectedDuration }</td>
							<c:if test="${act.avgRating > 0 }">
								<td>${act.avgRating }</td>
							</c:if>
							<c:if test="${act.avgRating <= 0 }">
								<td>No Ratings</td>
							</c:if>
							<td>${act.description }</td>
							<td><a href="${act.url }" target="_blank">${act.url }</a></td>
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
					}
					if (shouldSwitch) {
						rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
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
	</div>
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