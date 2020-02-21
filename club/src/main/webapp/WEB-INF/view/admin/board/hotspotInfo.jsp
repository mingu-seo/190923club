<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.AdminVO" %>  
<%
	AdminVO adminvo = (AdminVO)session.getAttribute("adminsess"); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>HOTSPOT 정보</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<div class="admin_mainInfo">환영합니다!</div>
					<div class="admin_mainCont">Hot Spot의 메인페이지, 공지사항, FAQ , 카테고리 그리고 각각의 Spot의 관리가 가능합니다!</div>
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>