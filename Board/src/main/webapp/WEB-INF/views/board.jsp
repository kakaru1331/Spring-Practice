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
	                        <li><a href="logout">로그아웃</a></li>
	                    </ul>
	                </li>                
	            </ul>            
            </c:if>
        </div>
    </nav>
    
    <div class="container">
    	<div class="row">
    		<table class="table table-striped">
    			<thead>
    				<tr>
    					<th>번호</th>
    					<th>제목</th>
    					<th>작성</th>
    					<th>등록</th>
    				</tr>
    			</thead>
    			<tbody>    				
    				<c:forEach items="${postList}" var="post">
    					<tr>
    						<td>${post.post_seq}</td>
    						<td><a href="/board/post?postNumber=${post.post_seq}">${post.title}</a></td>
    						<td>${post.id}</td>
    						<td>${post.reg_date}</td>    						
    					</tr>
    				</c:forEach>
    			</tbody>
    		</table>
    		
    		<c:if test="${beginPage == 1}">
    			<span>이전으로</span>
    		</c:if>
    		<c:if test="${beginPage != 1}">
    			<a href="/board?pageNumber=${beginPage-1}">이전</a>    		
    		</c:if>
    		
			<c:forEach begin="${beginPage}" end="${endPage}" var="page">
		    	<c:choose>
		    		<c:when test="${page == param.pageNumber}">
		    			<span>${page}</span>
		    		</c:when>
		    		<c:otherwise>
		    			<a href="/board?pageNumber=${page}">${page}</a>
		    		</c:otherwise>
		    	</c:choose>
								
			</c:forEach>
			
			<c:if test="${totalPages > endPage }">
				<a href="/board?pageNumber=${endPage+1}">다음으로</a>
			</c:if>
			<c:if test="${totalPages == endPage }">
				<span>다음</span>
			</c:if>
			    					    		
    		<a href="writeP" class="btn btn-primary pull-right">글쓰기</a>
    	</div>
    </div>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>