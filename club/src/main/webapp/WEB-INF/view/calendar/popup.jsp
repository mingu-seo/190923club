<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form action="스케줄 등록 주소" method="post">
			<input type="hidden" name="spot_num" value=""> 
			<input type="hidden" name="member_id" value="">
			<div class="calDate" style="text-align: right">2020-02-17</div>
			<table>
				<tr>
					<td>일정명</td>
					<td><input type="text" value="구디아카데미 면접"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" value="작성자명불러오기"></td>
				</tr>
				<tr>
					<td>일정내용</td>
					<td><textarea rows="10" cols="20"></textarea></td>
				</tr>
			</table>
			<div class="calBtn"> 
				<input type="button" value="등록"> 
				<input type="button" value="수정">
			</div> 
	 	</form>
 	</div>
</div>
</body>
</html>