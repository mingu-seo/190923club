<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spot.*" %>
<%
String board_type = request.getParameter("board_type");

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
			        			<li><a href="/board/gallery/galleryList.do?spot_num=<%=spot_num %>&board_id=1" <%="1".equals(board_type) ? "class='menu_on'":"" %>><span class="ctg-s">┗</span>생일</a></li> <!-- 내용수정가능하게/추가삭제 가능하게 -->	
			        			<li><a href="/board/gallery/galleryList.do?spot_num=<%=spot_num %>&board_id=1" <%="2".equals(board_type) ? "class='menu_on'":"" %>><span class="ctg-s">┗</span>대회</a></li> <!-- 내용수정가능하게/추가삭제 가능하게 -->	
			        			<li><a href="/board/gallery/galleryList.do?spot_num=<%=spot_num %>&board_id=1" <%="3".equals(board_type) ? "class='menu_on'":"" %>><span class="ctg-s">┗</span>회식</a></li> <!-- 내용수정가능하게/추가삭제 가능하게 -->	
			        		</ul>
						</div>
	        		</div>
	        		
	        		
	        		
        			<div class="leftMenu">
		        		<div class="board-title">게시판</div> <!-- 위치수정가능하게 -->
		        		<div>
		        			<ul>
		        				<li><a href="/board/writing/boardList.do?spot_num=<%=spot_num %>&board_id=2"><span class="ctg-s">┗</span>공감해주셈</a></li> <!-- 내용수정가능하게/추가삭제 가능하게 -->
		        				<li><a href="/board/writing/boardList.do?spot_num=<%=spot_num %>&board_id=2"><span class="ctg-s">┗</span>웃긴글</a></li> <!-- 내용수정가능하게/추가삭제 가능하게 -->	
		        				<li><a href="/board/writing/boardList.do?spot_num=<%=spot_num %>&board_id=2"><span class="ctg-s">┗</span>어쩌구</a></li> <!-- 내용수정가능하게/추가삭제 가능하게 -->	
		        			</ul>
	        			</div>
	        		</div>
	        			
	        		
	        		
        			<div class="leftMenu">
						<div class="board-title">공지사항</div>
						<div>
							<ul>
							<li><a href="/board/notice/noticeList.do?spot_num=<%=spot_num %>&board_id=3"><span class="ctg-s">┗</span>이벤트 공지</a></li>
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