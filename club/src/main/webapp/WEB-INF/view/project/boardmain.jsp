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
	        		<div class="leftMenu">
		        		<ul>
		        		<a href=""><h2>갤러리</h2></a> <!-- 위치수정가능하게 -->
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
        		<img src="/club/img/set.png"><br>
        		</div>
        		<div>
        		가입신청
        		</div>
        	</div>
        	</div>
        	<div class="visualRight"> 
        		<div id="preview">
        		미리보기<a href="admincategory.do"><img src="/club/img/set.png"></a>
        		</div>
	        	
        		
        		<div class=rightBoard>
        		
        		<h2>갤러리<a href=""><img src="/club/img/plus.png"></a></h2>
        			<div class="galarybox">
        			
        			<div class="pregalary-info">
					<a href=""><img  class="pregalary-img" src="/club/img/gal1.PNG"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title">드디어 블랙위도우··</div>
					<div class="pregalary-writer">김길동</div>
					<span class="pregalary-day">2020-01-08</span><span class="pregalary-num">조회수&nbsp;&nbsp;285</span>
					</div>
					
					<div class="pregalary-info">
					<a href=""><img class="pregalary-img" src="/club/img/gal2.PNG"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title">이번에 홍천 비발디파크··</div>
					<div class="pregalary-writer">홍길동</div>
					<span class="pregalary-day">2020-12-28 </span><span class="pregalary-num">조회수&nbsp;&nbsp;285</span>
					</div> 
					
					<div class="pregalary-info">
					<a href=""><img class="pregalary-img" src="/club/img/gal3.PNG"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title">엠티가서 찍은 사진··</div>
					<div class="pregalary-writer">최길동</div>
					<span class="pregalary-day">2020-01-22</span><span class="pregalary-num">조회수&nbsp;&nbsp;285</span>
					</div>
					
        			</div>
        		</div>
        		
        		<div class=rightBoard>
        		<h2>게시판<a href=""><img src="/club/img/plus.png"></a></h2>
        		<ul>
        			<a href=""><li>게시물1</li></a>
        			<a href=""><li>게시물2</li></a>
        			<a href=""><li>게시물3</li></a>
        		</ul>
        		</div>
        	
        		<div class=rightBoard>
        		<h2>공지<a href=""><img src="/club/img/plus.png"></a></h2>
        		<ul>
        			<a href=""><li>게시물1</li></a>
        			<a href=""><li>게시물2</li></a>
        			<a href=""><li>게시물3</li></a>
        		</ul>
        		</div>
        	</div>
        
       
        
    </div>
     <%@ include file="footer.jsp" %>
</body>
</html>