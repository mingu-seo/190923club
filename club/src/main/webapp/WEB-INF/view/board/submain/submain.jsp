<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/boardmain.css">
</head>
<body>


    <div class="wrap">
       
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
	<!-- E N D :: headerArea-->
        <%@ include file="menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		<h1><a href="/board/writing/boardWrite.do">게시판 글쓰기</a></h1>
        		<h1><a href="/board/gallary/gallaryWrite.do">갤러리 글쓰기</a></h1>
        	
        		
        		<div class="main_post_div">
        			<div class="main_post_writer">
        				<span>작성자 |</span>
        				<span>조한빈</span>
        			</div>
        			<div class="main_post_info">
        				<span>2020-01-29 18시 30분</span>
        			</div>
        			<div class="main_post">
        				와 흥민이 인생골이다<br>
        				<img src="/img/board/gal2.PNG">
        			</div>
        			<div class="main_post_click">
        				<span>❤︎ 좋아요 </span>   
        				<span>✉ 댓글작성</span>
        				<span>☎ 공유하기</span>
        			</div>
        		</div>
        		<div class="main_post_div">
        			<div class="main_post_writer">
        				<span>작성자 |</span>
        				<span>조한빈</span>
        			</div>
        			<div class="main_post_info">  
        				<span>2020-01-29 18시 30분</span>
        			</div>
        			<div class="main_post">
        				와 흥민이 인생골이다<br>
        			</div>
        			<div class="main_post_click">
        				<span>❤︎ 좋아요 </span>   
        				<span>✉ 댓글작성</span>
        				<span>☎ 공유하기</span>
        			</div> 
        		</div>
        		<div class="main_post_div">
        			<div class="main_post_writer">
        				<span>작성자 |</span>
        				<span>조한빈</span>
        			</div>
        			<div class="main_post_info">
        				<span>2020-01-29 18시 30분</span>
        			</div>
        			<div class="main_post">
        				와 흥민이 인생골이다<br>  
        				<img src="/img/board/gal2.PNG">
        			</div>
        			<div class="main_post_click">
        				<span>❤︎ 좋아요 </span>   
        				<span>✉ 댓글작성</span>
        				<span>☎ 공유하기</span>
        			</div>
        		</div>

        		
        	</div>        	
        </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
</body>
</html>