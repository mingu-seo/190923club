<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="head.jsp" %>
</head>
<body>


    <div class="wrap">
    	<%@ include file="header.jsp" %>
       
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
<<<<<<< HEAD
        		<h1><a href="/board/writing/boardWrite.do">게시판 글쓰기</a></h1>
        		<h1><a href="/board/gallary/gallaryWrite.do">갤러리 글쓰기</a></h1>
=======
        		<h1><a href="/club/board/writing/boardWrite.do">게시판 글쓰기</a></h1>
        		<h1><a href="/club/board/gallery/galleryWrite.do">갤러리 글쓰기</a></h1>
>>>>>>> branch 'master' of https://github.com/mingu-seo/190923club.git
        	</div>
        	
        </div>
        
        
        <%@ include file="footer.jsp" %>
        
   
        
    </div>
</body>
</html>