<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Potato Login</title>
</head>
<body>
<h1>Please Login!</h1>

${DEBUG }
		<form action="active.do" method="POST">
			Search Active Potato!<br>
			 <input type="submit" />
		</form>
		<form action="couch.do" method="POST">
			Search Couch Potato! <br><input type="submit" />
		</form>
		<form action="login.do" method="POST">
			Straight to user home for testing purposes! <br><input type="submit" />
		</form>
		
<!-- <a href="login.do">User home</a><br/> -->
<a href="registerpage.do">Create new profile</a><br/>
<a href="home.do">Return to Home</a><br/>
</body>
</html>