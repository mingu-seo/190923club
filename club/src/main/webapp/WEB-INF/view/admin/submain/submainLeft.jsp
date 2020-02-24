<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="member.MemberVO"%>
<%@ page import="spot.SpotVO"%>
<%@ page import="joinSpot.JoinSpotVO"%>
<%
SpotVO list = (SpotVO)request.getAttribute("spot_vo");
MemberVO lvo = (MemberVO)request.getAttribute("lvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="visualLeft">
        	<input type="hidden" name="num" value="<%=list.getNum()%>">
        	<div class="visualLeftInner">
        		<div>
        			<!--<br><br>동아리 소개 사진  -->
	        		<img id="clubImage" src="/upload/images/<%=list.getFile()%>"><br>
		        		<div id="clubName">
			        		<%=list.getName()%>
			        	</div>
			        	<div class="clubInfo">
			        		멤버 <%=listcount %>명<br>
			        		회장 <%=lvo.getName() %>
			        	</div>
        		</div>
        		<div class="clubIntro">
					<%=list.getContent() %>
        		</div> 
        	</div>
        	</div>
</body>
</html>