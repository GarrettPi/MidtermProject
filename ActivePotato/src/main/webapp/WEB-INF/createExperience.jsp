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
		
<title>Welcome to Active Potato</title>
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
    	 <a class="dropdown-item" href="logoutpage.do">Logout </a>
    	 </c:if>
    	 <c:if test="${empty user }">
    	 <a class="dropdown-item" href="registerpage.do">Register</a>
	   	 </c:if>
    </div>
  </nav>


	<div id="center">
	
	<h1>Add A New Experience</h1>
		
	<form action="createExperience.do?interestId=${interest.id}" method="POST">
		<br>
		<div class="container">
		<label class="update">Rating: <br>
		</label><input class="updateinput" type="number" placeholder="Rating out of 10" required name="rating">
		</div>
		<br>
		<div class="container">
		<label class="update">Date of Experience: <br>
		</label><input class="updateinput" type="date" value="${experience.localDateNow}" required name="expDate">
		</div>
		<br>
		<div class="container">
		<label>Comments:</label>
		<br>
		<br>
		<textarea rows="5" cols="50" placeholder="Comments about the experience..." name="newComment" required></textarea>
		</div>
		<br>
				
		<div class="container">
		<input type="submit" value="Add Experience">
		</div>
	</form>
	</div>
	<br>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
	
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