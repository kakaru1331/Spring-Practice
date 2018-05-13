<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-collapse" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/main" class="navbar-brand">홈</a>
        </div>
        <div class="collapse navbar-collapse" id="nav-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/main">홈</a></li>
                <li><a href="/board">게시판</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/loginP">로그인</a></li>
                        <li><a href="/joinP">회원가입</a></li>
                    </ul>
                </li>                
            </ul>
        </div>
    </nav>
    
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbotron">
                <form action="join" method="post">
                    <h3>회원가입</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">                    
                    </div>
                    <div class="form-group">
	                    <input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="15">
                    </div>
                    <div class="form-group">
	                    <input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">
                    </div>
                    <div class="form-group">
	                   	<div class="radio">
	                		<label><input type="radio" name="gender" value="남자">남자</label>
	                	</div>
	                	<div class="radio">
	                		<label><input type="radio" name="gender" value="여자">여자</label>
	                	</div>
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
            </div>
        </div>
        <div class="col-lg-4"></div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>