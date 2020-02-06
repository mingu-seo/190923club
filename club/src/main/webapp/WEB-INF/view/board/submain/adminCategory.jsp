<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
</head>
<body>


    <div class="wrap">
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
	<!-- E N D :: headerArea-->  
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		<div class="visualRightInner">
        			<div id="categorySet">카테고리 설정
        			
        			</div>
        			
        			<div class="boardTitle">
        				<h1>▼ 갤러리</h1>
        			</div>
        			<div class="boardBox">
        				<div>
        				<a href=""><img class="add" src="/img/board/plus.png"></a><!-- 카데고리 추가 -->
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div> 
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        			</div>
        		<hr>
        		
        		<div class="boardTitle">
        				<h1>▼ 자유게시판</h1>
        			</div>
        			<div class="boardBox">
        				
        				<div>
        				<a href=""><img class="add" src="/img/board/plus.png"></a><!-- 카데고리 추가 -->
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div> 
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        			</div>
        		<hr>
        		
        		<div class="boardTitle">
        				<h1>▼ 공지사항</h1>
        			</div>
        			<div class="boardBox">
        				<div>
        				<a href=""><img class="add" src="/img/board/plus.png"></a><!-- 카데고리 추가 -->
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div> 
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        			</div>
        			
        		</div>
        </div>
       
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
   </div>
</body>
</html>