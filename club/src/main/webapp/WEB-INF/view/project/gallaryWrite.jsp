<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	        		<div class="leftM enu">
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
		        		<a href=""><h2>게시판</h2></a> <!-- 위치수정가능하게 -->
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
				<form action="" method="post" enctype="multipart/form-data" onsubmit="save();">
			
					<table id="boardTable">
					<tr>
						<td>사진</td>
						<td>동영상</td>
					</tr>
					<tr>
						<td><input type="file" name="image"></td>
						<td><input type="file" name="video"></td>
					</tr>
					<tr>		
						
						<td colspan="2">
							<textarea name="content" id="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="작성완료">&nbsp;&nbsp;
						<input type="reset" value="다시 작성"/></td>
					</tr>
						
					</table>
				</form>
        </div>
        
        
    </div>
    <%@ include file="footer.jsp" %>
  </div>
</body>
</html>