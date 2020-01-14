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
		        <h1>게시판 목록</h1>
			<h2><a href="boardWrite.do">게시판글쓰기</a></h2>
			<div>
			<select id="boardAlign1">
				 	<option value="최신순">최신순</option>
				 	<option value="좋아요순">좋아요순</option>
				 	<option value="조회수순">조회수순</option>
			</select>
			<select id="boardAlign2">
				 	<option value="오름차순">오름차순</option>
				 	<option value="내림차순">내림차순</option>
			</select>
			</div>
		
			  				
					<div>
						<table id="boardList">
							<tr id="tr_top">
							
							<tr>
								<th>글번호</th>
								<th>카테고리</th>
								<th>제목 </th>
								<th>작성자 </th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							
							
							<%
							for (int i=0; i<list.size(); i++) {
							%>
							<tr>
								<td><a href="boardWriteView.do?id_post=<%=list.get(i).getId_post() %>"><%=list.get(i).getId_post()%></a></td>
								<td>카테고리 불러오기</td>
								<td ><%=list.get(i).getTitle() %></td>
								<td>작성자  불러오기</td>
								<td><%=list.get(i).getRegdate() %></td>
								<td>조회수  불러오기</td>
						
							</tr>	
							<%
							}
							%>
			  				
			  			
										
						</table>
					</div>
	
				 <div id="boardSearch">
					 	<select id="boardSearchCategory">
					 	<option value="작성자">작성자</option>
					 	<option value="제목">제목</option>
					 	<option value="내용">내용</option>
					 	</select>
					 	
						 <input type="text" name="boardSearch" id="boardSearch">
						 
						 <input type="submit" value="검색">
					
				</div>	
	
	
				<div id="pageList">
					[이전]&nbsp;
					1&nbsp;2&nbsp;3&nbsp;4&nbsp;5&nbsp;6&nbsp;7&nbsp;8&nbsp;9&nbsp;
					[다음]
				</div>
	        	
	        </div>
   		</div>
        
       
        
    </div>
     <%@ include file="/WEB-INF/view/board/submain/footer.jsp" %>
</div>
</body>
</html>