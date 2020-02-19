<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="category.CategoryVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardVO vo = (BoardVO)request.getAttribute("vo");
List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
int listcount = (Integer)request.getAttribute("listcount"); //전체갯수
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체 페이지수
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
  <%@ include file="/WEB-INF/view/admin/include/adminspotheadHtml.jsp" %>
</head>

<body>
 

    <div class="wrap">
	<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
	<!-- E N D :: headerArea-->
	
	<div class="main">
     <%@ include file="menu.jsp" %>
     	<div class="visual">
		
        	<div class="visualLeft">
        		<%@ include file="boardLeft.jsp" %> 
        	</div>
        	
        	 
	        <div class="visualRight">
		        	<div class="board_ctg_name">
		        		<%=cate_name.getName()%>
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
									<a href="/admin/submain/boardWriteView.do?spot_num=<%=spot_num %>&category_id=<%=list.get(i).getCategory_id() %>&post_id=<%=list.get(i).getPost_id()%>">
									<%=list.get(i).getTitle() %></a>
								</td>
								<td>김세영</td>
								<td><%=util.Function.getYmd(list.get(i).getRegdate()) %></td>
								<td><%=list.get(i).getLike_cnt() %></td>
								<td><%=list.get(i).getView() %></td>
						
							</tr>	  
							<% 
							}
							%>
					</table>
					</div>
				<div id="pageList">
					<%=util.BoardPage.getPageList(vo.getPage(), totalpage, "/board/writing/boardList.do?spot_num="+ spot_num + "&category_id=" + vo.getCategory_id()) %>
				</div>
				
	        </div>
   		</div>
    </div>    
       
    
    </div>
     <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
</div>
</body>
</html>