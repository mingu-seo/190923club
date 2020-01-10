<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="head.jsp" %>
</head>
<body>


    <div class="wrap">
    	<%@ include file="header.jsp" %>
       
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	<%@ include file="boardLeft.jsp" %>
        	</div>
        	
        	
        <div class="visualRight">
	        		<h1>게시판 목록</h1>
		<h2><a href="boardWrite.do">게시판글쓰기</a></h2>
		<div class="boardAlign">
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
					<td>번호</td>
					<td>카테고리</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
				
				<tr>
					<td>번호 불러오기</td>
					<td>카테고리 불러오기</td>
					<td>제목 불러오기</td>
					<td>작성자  불러오기</td>
					<td>날짜  불러오기</td>
					<td>조회수  불러오기</td>
				</tr>
				
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
     <%@ include file="footer.jsp" %>
</body>
</html>