<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="a.b.c.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="a.b.c.user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="password" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>#</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
    
</style>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int ret = userDAO.login(user.getId(), user.getPassword());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
		if (ret == 1)
			script.println("location.href = 'main.jsp'");
		else if (ret == 0) {
			script.println("alert('비밀번호를 확인해주세요.')");
			script.println("history.back()");			
		} else if (ret == -1) {
			script.println("alert('아이디를 확인해주세요.')");
			script.println("history.back()");			
		} else if (ret == -2) {
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()");
		}		
		
		script.println("</script>");
	%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>