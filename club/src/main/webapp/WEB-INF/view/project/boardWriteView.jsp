<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="head.jsp" %>
<%@page import="test.TestVO"%>
<%
TestVO vo = (TestVO)request.getAttribute("vo");
%>				

</head>
<body>


    <div class="wrap">
    	<%@ include file="header.jsp" %>
       
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	<div class="visualLeftInner">
	        		<div class="leftM enu">
		        		<ul>
		        		<a href="gallaryList.do"><h2>갤러리</h2></a> <!-- 위치수정가능하게 -->
		        			<li><a href=""><h3>생일</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        			<li><a href=""><h3>대회</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        			<li><a href=""><h3>회식</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        		</ul>
		        		<hr>
	        		</div>
        			<div class="leftMenu">
		        		<ul>
		        		<a href="boardList.do"><h2>게시판</h2></a> <!-- 위치수정가능하게 -->
		        			<li><a href=""><h3>공감해주셈</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        			<li><a href=""><h3>웃긴글</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        			<li><a href=""><h3>어쩌구</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        		</ul>
		        		<hr> <!-- 게시판이 끝나는 시점에 있게 -->
	        		</div>	
        			<div class="leftMenu">
						<ul>
						<a href=""><h2>공지사항</h2></a>
						</ul>
						<hr>
	        		</div>
        		<div>
        		동아리 설정
        		<img src="/club/img/setting.png"><br>
        		</div>
        		<div>
        		가입신청
        		</div>
        	</div>
        	</div>
        	<div class="visualRight">
        		<h1>자유게시판</h1>
        		<div>
					<table id="boardTable">
					<tr>
						<th>카테고리</th>
						<td>
							카테고리명 넣기

						</td>
					</tr>
					<tr>		
						<th>제목</th>
						<td>
						타이틀명 넣기
						</td>
						
					</tr>
					<tr>		
						
						<td colspan="2">
							컨텐츠 내용 넣기
							예시이미지
							<img src="/club/img/section1_1.png">
						</td>
					</tr>
					</table>
			</div>
			
			<h4>댓글 </h4>
			<div id="replyBox">
				<table id="reply">
					<tr>
						<th> 홍길동</th>
						<td> 어케 댓글창 만들지</td>
						<td> 20-01-05</td>
					</tr>
					<tr>
						<th> 김길동</th>
						<td>클낫다 클낫어</td>
						<td> 20-01-06</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 대댓글창도 만들어야 하는디</td>
						<td> 20-01-07</td>
					</tr>
				</table>
			</div>
			
			
			<div>
			
			<table id="replyInput">
				<tr>
					<th> 이름</th>
					<td><input type="text" name="reply" id="replyText"></td>
					<td><input type="submit" value="작성"></td>
			</table>
			</div>
			<a href="boardList.do">게시글 목록으로 돌아가기</a>
        </div>
        
        
    </div>
    <%@ include file="footer.jsp" %>
  </div>
</body>
</html>