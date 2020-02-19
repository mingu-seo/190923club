<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adminQna.AdminQnaVO" %>
<%
	List<AdminQnaVO> list= (List<AdminQnaVO>)request.getAttribute("list");
	AdminQnaVO vo = (AdminQnaVO)request.getAttribute("vo");
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
        			<div class="info_title"> HOT SPOT QnA
        			</div>
							<%
							for (int i=0; i<list.size(); i++){
							%>
		        				<div class="infoContent">
									<a href="spotQnaDetail.do?num=<%=list.get(i).getNum()%>" class="info_title">
									<%=list.get(i).getSubject() %></a>						
								</div>
								<div class="infoDate"><%=list.get(i).getDate() %></div>
							<%
								}
							%>
		    		</div>
   				</div>
        	</div>        	
        </div>
    </div>
</body>
</html>