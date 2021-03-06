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

<title>Active Potato User Administrator Menu</title>
  
</head>

<body>
	<nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	    	<b style="color: white;">Menu</b>
    	
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



<div class="jumbotron jumbotron-fluid" style="margin-bottom: 0;">
	<div id="center">
		<h1 class="display-6">Active Potato <br> System Administrator Menu <br> </h1>
				<br> <img src="${user.profileUrl}" width="200" height="auto" />
				
				<br>
				<br>
				<h3 style="border: 1px solid black">Welcome ${user.firstName}
					${user.lastName}</h3>
				<br>
				<br>
				</div>
	<div id="center">
	
	<div class="container-fluid" ><table class="table thead-dark table-striped table-hover">
		<thead>
			<tr>
			<th>User ID</th>
			<th>User Role</th>
			<th>Username</th>
			<th>Email</th>
			<th>Account Active</th>
			<th>Enable or Disable User</th>
			</tr>
		</thead>
	<tbody>
			<c:forEach var="user" items="${allUsers }">
		<tr>
			<td>${user.id}</td>
			<td>${user.role}</td>
			<td>${user.username}</td>
			<td><a href="${user.email}">${user.email}</a></td>
			<td>${user.enabled}</td>
			<c:if test="${user.enabled == false}">
			<td><form action="enableAccount.do?userId=${user.id }" method="POST"><input type="submit"  value="Enable Account"></form></td>
			</c:if>	
		
			<c:if test="${user.enabled == true}">
			
				<td><form action="disableAccount.do?userId=${user.id }" method="POST"><input type="submit"   value="Disable Account"></form></td>
			</c:if>
			</tr>
			</c:forEach>
			
			
	</tbody>
	
	</table>
	</div>
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
	
	
	
	
	
	
	
	