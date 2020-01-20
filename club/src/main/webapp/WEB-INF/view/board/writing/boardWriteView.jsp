<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css"> 

<% BoardVO vo = (BoardVO)request.getAttribute("vo"); %>				
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
<%@page import="test.TestVO"%>

</head>
<body>
 


    <div class="wrap">
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/user/include/top.jsp" %>
	<!-- E N D :: headerArea-->
       
        <div class="visual">
	
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	<div class="visualRight">
        		<div class="board_ctg_name">게시판 목록</div>
        	<div class="view_wrap">
					<div class="view_tt"><%=vo.getTitle() %>
						<div class="view_info">
							<span>김세영</span>
							<span>|</span> 
							<span>2020-01-06</span>
						</div>
					</div>
					
					<div class="view_ctt">
						<%=vo.getContents() %>
					</div>
					
					<div class="view_repl_info">
						<span class="view_like">♥</span>
						<span>이 글을 N명이 좋아합니다.</span>
					</div>		
				
				<div class="repl_box">
					<div id="replyBox">
						<table id="reply">
							<tr> 
								<th class="repl_date">홍길동</th>
								<td>어케 댓글창 만들지</td>
								<th class="repl_date">2020-01-05</th>
							</tr>
							<tr>
								<th class="repl_date">김길동</th>
								<td>클낫다 클낫어</td>
								<th class="repl_date">2020-01-06</th>
							</tr>
							<tr>
								<th class="repl_date">박길동</th>
								<td>대댓글창도 만들어야 하는디</td>
								<th class="repl_date">2020-01-07</th>
							</tr>
							
							<tr>
								<td colspan="2">
									<textarea id="replyText">댓글을 입력하세요</textarea>
								</td>
								<td> 
									<input type="submit" id="repl_btn" value="등록"> 
								</td>
							</tr>
						</table>
					</div> 
				</div>
				
				
			</div>
			
			<input type="button" value="목록" class="btns" onclick="location.href='boardList.do'"> 
        </div>
        
        
    </div>
    <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
</div>
</body>
</html>