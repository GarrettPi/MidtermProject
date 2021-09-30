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

tr:nth-child(even) {
	background-color: #adadad
}
</style>
<title>Active Potato</title>
</head>
<body>
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
						<th>Add Activity</th>
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
								<button type="submit" class="btn btn-primary">Add
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
		<a href="home.do">Return to Home</a> <br />
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
</body>
</html>