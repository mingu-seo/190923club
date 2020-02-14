<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
	<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/test/spotJoinForm.css">
</head>
<body>
    <div class="wrap">
       
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
	         	<%@ include file="/WEB-INF/view/board/submain/submainLeft.jsp" %>
        	<!-- 왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		<div class="content">
		            <div class="joinForm">
				        <div class="joinTitle">
				            <div class="titleText">
				                <h2><%=list.getName() %></h2>
				                <p><%=list.getName() %>에 가입하시겠습니까?</p>
				            </div>
					        <div class="joinBtn">
					            <a href="/spotJoin/joinSpot.do?spot_num=<%=spot_num%>"><input type="button" value="가입신청"></a>
					        </div>
				        </div>
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