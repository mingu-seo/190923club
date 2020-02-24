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
<style>
	table tr th{
		padding:5px;
		height:30px;
		font-size: 20px;
	}
	table tr td input {
		height:25px;
		width: 318px;
	}
</style>
<body>
<div class="wrap"> 
	<div class="popTitle" style="font-size:30px; text-align:center;">
		일정 등록zz
	</div>
	<hr>
	<div class="formDIV"><!-- 폼 감싸는 div -->
		<form action="/calendar/insert.do" method="post">
			<input type="hidden" name="spot_num" value="<%=request.getParameter("spot_num")%>"> 
			<input type="hidden" name="member_id" value="<%=sessVO.getNum()%>">  
			<input type="hidden" name="date" value="<%=request.getParameter("date")%>">
			<div class="calDate" style="text-align: right; font-size: 20px; font-weight: bold; color:lightslategray;"><%=request.getParameter("date") %></div>
			<hr>
			<table style="margin:0 auto;">
				<tr>
					<th>일정명</th>
					<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="<%=sessVO.getName()%>"></td>
				</tr>
				<tr> 
					<th>일정내용</th>
					<td><textarea name="contents" rows="10" cols="40"></textarea></td>
				</tr>
			</table>
			<div class="calBtn" style="text-align: center; margin:20px;"> 
				<input type="submit" value="등록" style="background-color:white; width:100px; height:30px; font-size: 16px; font-weight: bold;"> 
				<input type="button" value="수정" style="background-color:white; width:100px; height:30px; font-size: 16px; font-weight: bold;">
			</div> 
	 	</form>
 	</div>
</div>
</body>
</html>