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
<h1>Show Media Details</h1>
		<h2> ${activity.name}</h2>
		<p> Description: ${activty.description }</p>
		<p> Rating found: ${activity.url}</p>
		<p> Type: ${activty.type}</p>
		<p> Expected Duration: ${activity.expectedDuration}</p>

${DEBUG }

<a href="home.do">Return to Home</a><br/>
</body>
</html>