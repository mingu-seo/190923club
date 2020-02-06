<%@page import="reply.ReplyVO"%>
<%@page import="util.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="notice.*" %>
<%
List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
int listcount = (Integer)request.getAttribute("listcount"); //전체갯수
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체 페이지수
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
					<div class="board_writing"><a href="noticeWrite.do?spot_num=<%=spot_num%>">글작성</a></div>
			
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
					<form>
						<input type="hidden" name="board_id" value="3">
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
								<td class="art_title">
									<a href="/board/notice/noticeWriteView.do?spot_num=<%=spot_num %>&board_id=<%=list.get(i).getBoard_id()%>&post_id=<%=list.get(i).getPost_id()%>">
									<%=list.get(i).getTitle() %></a>
								</td>
								<td>조한빈</td>
								<td><%=util.Function.getYmd(list.get(i).getRegdate())%></td>
								<td>11</td>
								<td><%=list.get(i).getView() %></td>
							</tr>  
							
							<%
							}
							%>
							
							
							
						</table>
						</form>
					</div>
	
				 <div class="boardSearch">
					 	<form action="/board/notice/noticeList.do" method="post">
					 		<input type="hidden" name="board_id" value="<%=vo.getBoard_id() %>">
					 		<input type="hidden" name="spot_num" value="<%=spot_num%>">
							<input type="search" name="search_word" id="boardSearch" value="<%=vo.getSearch_word() %>"> 
							<input id="board_search_btn" type="submit" value="검색">
						</form>
				</div>
	
				<div id="pageList">
					<%=util.BoardPage.getPageList(vo.getPage(), totalpage, "/board/notice/noticeList.do?board_id=3") %>
				</div>
				
	        </div>
   		</div>
        
       
        
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
</body>
</html>