<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>#</title>
</head>
<body>
	<nav>
		<ul>
			<li><a href="/main">대문</a></li>
			<li><a href="/board">게시판</a></li>
			
			<c:if test="${empty sessionScope.id}">
				<li><a href="/loginP">로그인</a></li>
				<li><a href="/joinP">회원가입</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.id}">
				<li><a href="/logout">로그아웃</a></li>
			</c:if>
		</ul>
	</nav>
	<h1>로그인</h1>	
	<form action="/login" method="post">
		<div>
			<label for="id">아이디: <input type="text" name="id" placeholder="아이디" id="id"></label>
		</div>
	  	<div>
	  		<label for="password">비밀번호: <input type="password" name="password" placeholder="비밀번호" id="password"></label>	
	  	</div>	  
	  	<input type="submit" value="로그인">
	</form>	
</body>
</html>