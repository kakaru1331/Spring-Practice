<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>안녕, 세상!</h1>
	<P>  The time on the server is ${serverTime}. </P>
	<a href="/upload">업로드 기능으로</a>
</body>
</html>
