<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
   <%@ include file="/WEB-INF/view/board/submain/head.jsp" %>
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
		        	<div class="board_ctg_name">게시판 목록</div><!-- 카테고리 이름 -->
					<div class="board_writing"><a href="boardWrite.do">글작성</a></div>
			
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
								<td><a><%=list.get(i).getId_post()%></a></td>
								<td class="art_title"><a href="/board/writing/boardWriteView.do?id_post=<%=list.get(i).getId_post()%>"><%=list.get(i).getTitle() %></a></td>
								<td>김세영</td>
								<td><%=util.Function.getYmd(list.get(i).getRegdate()) %></td>
								<td>11</td>
								<td>235</td>
						
							</tr>	
							<%
							}
							%>
			  				
			  			
										


					</table>
					</div>
	
				<div class="boardSearch">
					 	<select class="search_ctg">
					 	<option value="작성자">작성자</option>
					 	<option value="제목">제목</option>
					 	<option value="내용">내용</option>
					 	</select>
					 	
						<input type="text" name="boardSearch" id="boardSearch">
						 
						<input id="board_search_btn" type="submit" value="검색">
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
     <%@ include file="/WEB-INF/view/board/submain/footer.jsp" %>
</div>
</body>
</html>