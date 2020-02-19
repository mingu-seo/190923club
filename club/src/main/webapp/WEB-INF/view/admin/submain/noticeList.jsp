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
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
int listcount = (Integer)request.getAttribute("listcount"); //전체갯수
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체 페이지수
%>


<!DOCTYPE html>
<html>
<head>

    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
  <%@ include file="/WEB-INF/view/admin/include/adminspotheadHtml.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>    	
    <div class="wrap">
	<div class="main">       
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
		
        	<div class="visualLeft">
        		<%@ include file="boardLeft.jsp" %>
        	</div>
        	 
        	
	        <div class="visualRight">
		        	<div class="board_ctg_name"><%=cate_name.getName() %></div><!-- 카테고리 이름 -->
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
									<a href="/admin/submain/noticeWriteView.do?spot_num=<%=spot_num %>&category_id=<%=list.get(i).getCategory_id() %>&post_id=<%=list.get(i).getPost_id()%>">
									<%=list.get(i).getTitle() %></a>
								</td>
								<td><%=list.get(i).getWriter() %></td>
								<td><%=util.Function.getYmd(list.get(i).getRegdate())%></td>
								<td><%=list.get(i).getLike_cnt() %></td>
								<td><%=list.get(i).getView() %></td>
							</tr>  
							 
							<%
							}
							%>
							
							
							
						</table>
						</form>
					</div>
				<div id="pageList">
					<%=util.BoardPage.getPageList(vo.getPage(), totalpage, "/admin/submain/noticeList.do?spot_num="+ spot_num + "&category_id=" + vo.getCategory_id()) %>
				</div>
				 
	        </div>
   		</div>
        
       
        
    </div>
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
</body>
</html>