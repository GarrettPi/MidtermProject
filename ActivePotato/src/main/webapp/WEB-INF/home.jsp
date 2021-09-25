<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Potato</title>
</head>
<body>
<h1>Welcome to Active Potato, you swamp monster!</h1>

	<form action="active.do" method="POST">
		Search Active Potato!<br> <input type="submit" />
	</form>
	<form action="couch.do" method="POST">
		Search Couch Potato! <br>
		<input type="submit" />
	</form>
	
${DEBUG }

<a href="loginpage.do">User Login</a><br/>
<a href="couch.do">Indoor Search</a><br/>
<a href="active.do">Outdoor Search</a><br/>
</body>
</html>