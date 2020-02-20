<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="member.*" %>
<%
MemberVO sessVO = (MemberVO)session.getAttribute("sess");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap"> 
	<div class="popTitle" style="font-size:30px; text-align:center;">
		일정 등록
	</div>
	<hr>
	<div class="formDIV"><!-- 폼 감싸는 div -->
		<form action="/calendar/insert.do" method="post">
			<input type="hidden" name="spot_num" value="<%=request.getParameter("spot_num")%>"> 
			<input type="hidden" name="member_id" value="<%=sessVO.getNum()%>"> 
			<input type="hidden" name="date" value="<%=request.getParameter("date")%>">
			<div class="calDate" style="text-align: right"><%=request.getParameter("date") %></div>
			<table style="margin:0 auto;">
				<tr>
					<td>일정명</td>
				</tr>
				<tr>
					<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
				</tr>
				<tr>
					<td>작성자</td>
				</tr>
				<tr>
					<td><input type="text" name="writer" value="<%=sessVO.getName()%>"></td>
				</tr>
				<tr> 
					<td>일정내용</td>
				</tr>
				<tr>
					<td><textarea name="contents" rows="10" cols="20"></textarea></td>
				</tr>
			</table>
			<div class="calBtn" style="text-align: center; margin:20px;"> 
				<input type="submit" value="등록"> 
				<input type="button" value="수정">
			</div> 
	 	</form>
 	</div>
</div>
</body>
</html>