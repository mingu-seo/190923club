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
		일정 등록
	</div>
	<hr>
	<div class="formDIV"><!-- 폼 감싸는 div -->
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
				<input type="submit" value="등록" style="background-color:white; width:100px; height:30px;"> 
				<input type="button" value="수정" style="background-color:white; width:100px; height:30px;">
			</div> 
 	</div>
</div>
</body>
</html>