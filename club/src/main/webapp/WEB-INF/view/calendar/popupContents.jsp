<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="calendar.*" %>
<%
ScheduleVO popCon = (ScheduleVO)request.getAttribute("popCon");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function deleteSchedule(num) {
		if(confirm("일정을 삭제하시겠습니까?")) {
			location.href="/calendar/delete.do?num="+num;
		}else false;
		 
	}
</script>
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
		
	</div>
	<div class="formDIV"><!-- 폼 감싸는 div -->
			<table style="margin:0 auto;">
				<tr>
					<th>일정명</th>
					<td><%=popCon.getTitle() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=popCon.getWriter() %>
				</tr>
				<tr> 
					<th>일정내용</th>
					<td><%=popCon.getContents() %></td>
				</tr>
			</table>
			<div class="calBtn" style="text-align: center; margin:20px;"> 
				<input type="button" value="삭제" onclick="deleteSchedule(<%=popCon.getNum() %>);" style="background-color:white; width:100px; height:30px;">
			</div> 
 	</div>
</div>
</body>
</html>