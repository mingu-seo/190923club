<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
<%@page import="test.TestVO"%>
<%
TestVO vo = (TestVO)request.getAttribute("vo");
%>				

</head>
<body>


    <div class="wrap">
    	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
       
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>

        	</div>
        	<div class="visualRight">
        		<h1>공지사항</h1>
        		<div>
					<table id="boardTable">
					<tr>
						<th>카테고리</th>
						<td>
							카테고리명 넣기

						</td>
					</tr>
					<tr>		
						<th>제목</th>
						<td>
						타이틀명 넣기
						</td>
						
					</tr>
					<tr>		
						
						<td colspan="2">
							컨텐츠 내용 넣기
							예시이미지
							<img src="/img/section1_1.png">
						</td>
					</tr>
					</table>
			</div>
			
			<h4>댓글 </h4>
			<div id="replyBox">
				<table id="reply">
					<tr>
						<th> 홍길동</th>
						<td> 어케 댓글창 만들지</td>
						<td> 20-01-05</td>
					</tr>
					<tr>
						<th> 김길동</th>
						<td>클낫다 클낫어</td>
						<td> 20-01-06</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 대댓글창도 만들어야 하는디</td>
						<td> 20-01-07</td>
					</tr>
				</table>
			</div>
			
			
			<div>
			
			<table id="replyInput">
				<tr>
					<th> 이름</th>
					<td><input type="text" name="reply" id="replyText"></td>
					<td><input type="submit" value="작성"></td>
			</table>
			</div>
			<a href="noticeList.do">공지사항 목록으로 돌아가기</a>
        </div>
        
        
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
  </div>
</body>
</html>