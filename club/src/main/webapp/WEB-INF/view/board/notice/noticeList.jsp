<%@page import="util.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="notice.*" %>
<%
List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
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
		        	<div class="board_ctg_name">공지사항 목록</div><!-- 카테고리 이름 -->
					<div class="board_writing"><a href="noticeWrite.do">글작성</a></div>
			
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
								<td><%= list.get(i).getPost_id()%></td>
								<td class="art_title"><a href="/board/notice/noticeWriteView.do?post_id=<%=list.get(i).getPost_id()%>"><%=list.get(i).getTitle() %></td>
								<td>조한빈</td>
								<td><%=util.Function.getYmd(list.get(i).getRegdate())%></td>
								<td>11</td>
								<td>24</td>
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
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
</body>
</html>