<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardVO vo = (BoardVO)request.getAttribute("vo");
List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
</head>
<body>


    <div class="wrap">
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
	<!-- E N D :: headerArea-->  
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
		
        	<div class="visualLeft">
        		<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	
	        <div class="visualRight">
		        	<div class="board_ctg_name">게시판 목록</div><!-- 카테고리 이름 -->
					<div class="board_writing"><a href="boardWrite.do?spot_num=<%=spot_num%>">글작성</a></div>
			
					<div class="board_seq">
					<select>
						 	<option value="최신순">최신순</option>
						 	<option value="좋아요순">좋아요순</option>
						 	<option value="조회수순">조회수순</option>
					</select>
					
					<select>
						 	<option value="오름차순">오름차순</option>
						 	<option value="내림차순">내림차순</option>
					</select>
					</div>
		
		
					<div class="board_list_box">
			  				
					<div>
						<table id="boardList">
							<tr class="board_top">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>좋아요</th>
								<th>조회</th>
							</tr>
							

							<%
							for (int i=0; i<list.size(); i++) {
							%>
							<tr class="board_art">
								<td><a><%=list.get(i).getPost_id()%></a></td>
								<td class="art_title">
									<a href="/board/writing/boardWriteView.do?spot_num=<%=spot_num %>&board_id=2&post_id=<%=list.get(i).getPost_id()%>">
									<%=list.get(i).getTitle() %></a>
								</td>
								<td>김세영</td>
								<td><%=util.Function.getYmd(list.get(i).getRegdate()) %></td>
								<td>11</td>
								<td><%=list.get(i).getView() %></td>
						
							</tr>	  
							<% 
							}
							%>
			  				
			  			
										


					</table>
					</div>
	
				<div class="boardSearch">
					<form action="/board/writing/boardList.do" method="post">
						<input type="hidden" name="spot_num" value="<%=spot_num %>">
						<input type="hidden" name="board_id" value="<%=vo.getBoard_id() %>">
						<input type="text" name="search_word" id="boardSearch" value="<%=vo.getSearch_word() %>">
						<input id="board_search_btn" type="submit" value="검색">
					</form>
				</div>	

	
				<div id="pageList">
					<span>[이전]</span>
					<span><a href="">1</a></span>
					<span><a href="">2</a></span>
					<span><a href="">3</a></span>
					<span><a href="">4</a></span>
					<span>[다음]</span>
				</div>
				
	        </div>
   		</div>
        
       
        
    </div>
     <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
</div>
</body>
</html>