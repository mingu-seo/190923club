<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spot.*" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="category.*" %>
<%
String board_type = request.getParameter("board_type");
List<CategoryVO>[] categoryList = (List<CategoryVO>[])request.getAttribute("categoryList");  
%>
<style>
	.menu_on {
		color:pink !important;
		font-size:26px;
	}
	
</style>
  <div class="visualLeftInner">
	        		<div class="leftMenu">
		        		<div class="board-title">갤러리</div> <!-- 위치수정가능하게 -->
			        	<div>
			        		<ul>
			        			<%
		        					//카테고리 리스트 
		        					for(int i=0; i<categoryList[0].size(); i++) {
		        				%>  
		        				<li>
			        				<a href="/board/gallery/galleryList.do?spot_num=<%=spot_num %>&board_id=2&category_id=<%=categoryList[0].get(i).getCategory_id()%>">
			        				<span class="ctg-s">┗</span><%=categoryList[0].get(i).getName() %></a> 
		        				</li> 
		        				<%
		        				}
		        				%>
			        		</ul>
						</div>
	        		</div>
	        		
	        		
	        		
        			<div class="leftMenu">
		        		<div class="board-title">게시판</div>
		        		<div>
		        			<ul>
		        				<%
		        					//카테고리 리스트 
		        					for(int i=0; i<categoryList[1].size(); i++) {
		        				%>  
		        				<li>
			        				<a href="/board/writing/boardList.do?spot_num=<%=spot_num %>&board_id=2&category_id=<%=categoryList[1].get(i).getCategory_id()%>">
			        				<span class="ctg-s">┗</span><%=categoryList[1].get(i).getName() %></a> 
		        				</li>
		        				<%
		        				}
		        				%>
		        			</ul>
	        			</div>
	        		</div>

	        		
        			<div class="leftMenu">
						<div class="board-title">공지사항</div>
						<div>
							<ul>
							<%
	        					//카테고리 리스트 
	        					for(int i=0; i<categoryList[2].size(); i++) {
	        				%>  
	        				<li>
		        				<a href="/board/notice/noticeList.do?spot_num=<%=spot_num %>&board_id=2&category_id=<%=categoryList[2].get(i).getCategory_id()%>">
		        				<span class="ctg-s">┗</span><%=categoryList[2].get(i).getName() %></a> 
	        				</li> 
	        				<%
	        				}
	        				%>
							</ul>
						</div>
						
	        		</div>
        		
	        		<div class="clubInfo">
	        		가입신청
	        		</div>
	        		
	        		<div class="clubInfo">
	        		동아리 설정
	        		<a href=""><img src="/img/board/set.png"></a>
	        		</div>
	        		
	</div>