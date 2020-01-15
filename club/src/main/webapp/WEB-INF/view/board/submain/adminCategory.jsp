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
        	<div class="visualLeftInner">
        		<div>
        		<!--<br><br>동아리 소개 사진  -->
        		<img id="clubImage" src="/club/img/board/pic.jpg"><br>
	        		<div id="clubName">
		        		스키 동아리
		        	</div>
		        	<div class="clubInfo">
		        		멤버 88명<br>
		        		회장 김구디
		        	</div>
        		</div>
        		<div>
        		<br><br>동아리 소개 <br>
        		저희는 스키를 사랑하는 사람들이 모여<br>
        		겨울에는 강원도에 가고<br>
        		스위스에도 가고<br>
        		여기저기 보드도 타러 다니고<br>
        		즐거운 동아리 어쩌구 <br>
        		<br>
        		<br>
        		<br>
        		</div> 
        		<div class="clubInfo">
        		가입신청
        		</div>
        		<div class="clubInfo">
        		동아리 설정
        		<a href=""><img src="/club/img/board/set.png"></a>
        		</div>
        	</div>
        	</div>
        	<div class="visualRight">
        		<div class="visualRightInner">
        			<div id="categorySet">카테고리 설정
        			
        			</div>
        			
        			<div class="boardTitle">
        				<h1>▼ 갤러리</h1>
        			</div>
        			<div class="boardBox">
        				<div>
        				<a href=""><img class="add" src="/club/img/board/plus.png"></a><!-- 카데고리 추가 -->
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div> 
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        			</div>
        		<hr>
        		
        		<div class="boardTitle">
        				<h1>▼ 자유게시판</h1>
        			</div>
        			<div class="boardBox">
        				<div>
        				<a href=""><img class="add" src="/club/img/board/plus.png"></a><!-- 카데고리 추가 -->
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div> 
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        			</div>
        		<hr>
        		
        		<div class="boardTitle">
        				<h1>▼ 공지사항</h1>
        			</div>
        			<div class="boardBox">
        				<div>
        				<a href=""><img class="add" src="/club/img/board/plus.png"></a><!-- 카데고리 추가 -->
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div> 
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        				
        				<div class="boardAdd">
        				<input class="addBox" type="text" placeholder="추가하세요!">
        				<img class="categorySeq" src="/club/img/board/up.PNG"><!-- 카테고리 순서변경 -->
        				<input class="categoryBtn" type="button" value="수정">&nbsp;&nbsp;&nbsp;<input class="categoryBtn" type="button" value="삭제">
        				</div>
        			</div>
        			
        		</div>
        </div>
       
    </div>
     <%@ include file="footer.jsp" %>
   </div>
</body>
</html>