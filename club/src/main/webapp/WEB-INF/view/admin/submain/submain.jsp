<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "spot.SpotVO" %>
<!DOCTYPE html> 
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/admin/include/adminspotheadHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/boardmain.css">
</head>
<body>

	<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
	<!-- E N D :: headerArea-->
    <div class="wrap">
	<div class="main">
        <%@ include file="menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		
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
        </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
	</div>
    </div>
</body>
</html>