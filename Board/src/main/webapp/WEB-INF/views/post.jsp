<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>#</title>
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
            <a href="main" class="navbar-brand">홈</a>
        </div>
        <div class="collapse navbar-collapse" id="nav-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/main">홈</a></li>
                <li><a href="/board">게시판</a></li>
            </ul>
            
            <c:if test="${empty sessionScope.id}">
	            <ul class="nav navbar-nav navbar-right">
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기 <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/loginP">로그인</a></li>
	                        <li><a href="/joinP">회원가입</a></li>
	                    </ul>
	                </li>                
	            </ul>
            </c:if>
            
            <c:if test="${!empty sessionScope.id}">
	            <ul class="nav navbar-nav navbar-right">
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리 <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/logout">로그아웃</a></li>
	                    </ul>
	                </li>                
	            </ul>            
            </c:if>
        </div>
    </nav>
    
    <div class="container">
    	<div class="row">	    	
    		<table class="table">    			
    			<tbody>	    				
    				<tr>
    					<td>제목</td>
    					<td colspan="2">${title}</td>	    					
    				</tr>
    				<tr>
    					<td>작성자</td>
    					<td colspan="2">${id}</td>	    					
    				</tr>
    				<tr>
    					<td>등록일</td>
    					<td colspan="2">${date}</td>
    				</tr>
    				<tr>
    					<td colspan="3">
    						<div class="jumbotron">
    							${contents}
    						</div>	    						
    					</td>	    					
    				</tr>	    				
    			</tbody>
    		</table>
    		
    		<c:if test="${id == sessionScope.id}">
    			<div>
	    			<a href="/board/delete?postNumber=${param.postNumber}" class="btn btn-default btn-sm">삭제</a>
	    			<a href="/board/editP?postNumber=${param.postNumber}" class="btn btn-primary">수정</a>    			
    			</div>
    		</c:if>
	    	
	    	<div>
	    		<a href="/board" class="btn btn-primary">게시글 목록</a>
	    	</div>
    	</div>
    </div>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>