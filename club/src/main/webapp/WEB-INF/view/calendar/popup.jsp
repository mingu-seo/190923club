<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="calendar.*" %>
<%@ page import ="member.*" %>
<%@ page import ="java.util.*" %>
<%
MemberVO sessVO = (MemberVO)session.getAttribute("sess");//세션객체
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap" style="margin:0 auto;"> 
	<div class="popTitle" style="font-size:30px; text-align:center;">
		일정 등록
	</div>
	<hr>
	<div class="formDIV"><!-- 폼 감싸는 div --> 
		<form action="/calendar/insert.do" method="post">
			<input type="hidden" name="spot_num" value="<%=request.getParameter("spot_num")%>">
			<input type="hidden" name="date" value="<%=request.getParameter("date")%>">  
			<input type="hidden" name="member_id" value="<%=sessVO.getNum()%>">
			<input type="hidden" name="writer" value="<%=sessVO.getName()%>">
			<div class="calDate" style="text-align: right"><%=request.getParameter("date") %></div> 
			<table style="margin:20px auto; width:400px; padding:20px;">
				<tr>
					<td>일정명</td>
				</tr>
				<tr>
					<td style="text-align: left;"><input type="text" name="title" placeholder="댓글을 입력하세요"></td> 
				</tr>
				<tr>
					<td>작성자</td>
				</tr>
				<tr>
					<td style="text-align: left;"><input type="text" value="<%=sessVO.getName()%>"></td>
				</tr>
				<tr>
					<td>일정내용</td> 
				</tr>
				<tr> 
					<td style="text-align: left;"><textarea rows="10" cols="40" name="contents"></textarea></td>
				</tr> 
			</table>
			<div class="calBtn" style="text-align: center; padding:30px;"> 
				<input type="submit" value="등록"> 
				<input type="button" value="수정">
			</div> 
	 	</form>
 	</div>
</div>
</body>
</html>