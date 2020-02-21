<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adminQna.AdminQnaVO" %>
<%
AdminQnaVO Qna= (AdminQnaVO)request.getAttribute("Qna");
%>   
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
<link rel="stylesheet" href="/css/test/mypage.css">

</head>
<body>
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->  
    <div class="wrap">
        <div class="visual">
             <!-- 왼쪽메뉴 -->
        	<%@ include file="spotInfoLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	<div class="visualRight">
        		<div class="content">
		            <div class="spot_info">
        			<div class="info_title"> HOT SPOT FAQ
        			</div>
        				<div class="infoView">
							<div class="inc_tile"><%=Qna.getSubject() %></div>	
							<div class="inc_writer">작성자 : <%=Qna.getAdmin_name() %></div>	
							<div class="inc_content"><%=Qna.getContent() %></div>
						</div>
		    		</div>
   				</div>
        	</div>        	
        </div>
    </div>
</body>
</html>