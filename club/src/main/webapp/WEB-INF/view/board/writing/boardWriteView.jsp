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
   <%@ include file="/WEB-INF/view/board/submain/head.jsp" %>

<% List<BoardVO> list = (List<BoardVO>)request.getAttribute("list"); %>				

</head>
<body>
 

<div class="wrap">
    	<%@ include file="/WEB-INF/view/board/submain/header.jsp" %>
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
        <div class="visual">
	
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	<div class="visualRight">
        		<div class="board_ctg_name">게시판 목록</div>
        	<div class="view_wrap">
					<div class="view_tt">제목 불러오기
						<div class="view_info">
							<span>김세영</span>
							<span>|</span> 
							<span>2020-01-06</span>
						</div>
					</div>
					
					<div class="view_ctt">
						내용이 이것저것
						뭐가 많이 들어가겠지
						사진도들어가고
						이것저것
						아 허리가 너무아프다
						<img src="/img/board/gal2.PNG">
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
			
			<input type="button" value="목록" class="btns"> 
        </div>
        
        
    </div>
    <%@ include file="/WEB-INF/view/board/submain/footer.jsp" %>
 </div>
</body>
</html>