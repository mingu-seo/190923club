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
	        		</div>
        			<div class="leftMenu">
		        		<ul>
		        		<a href=""><h2>게시판</h2></a> <!-- 위치수정가능하게 -->
		        			<li><a href=""><h3>공감해주셈</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        			<li><a href=""><h3>웃긴글</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        			<li><a href=""><h3>어쩌구</h3></a><!-- 내용수정가능하게/추가삭제 가능하게 -->	</li>
		        		</ul>
	        		</div>	
        			<div class="leftMenu">
						<ul>
						<a href=""><h2>공지사항</h2></a>
						</ul>
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
        	
        		<form action="dogRegist.dog" method="post" name="writeFrom" enctype="multipart/form-data">
				<div id ="writeBox">
					<table id="tableForm">
						<tr>
							<td class="td_left">
							<label for="kind">품종 : </label>
							</td>
							<td class="td_right">
							<input type ="text" name = "kind" id="kind" required="required"/>
							</td>
						</tr>
		
						<tr>
							<td class="td_left">
								<label for="nation">원산지 : </label>
							</td>
							<td class="td_right">
								<input type ="text" name = "nation" id="nation" />
							</td>
						</tr>
						<tr>
							<td class="td_left">
								<label for="price">가격 : </label>
							</td>
							<td class="td_right">
								<input type ="text" name = "price" id="price" />
							</td>
						</tr>	
							
						<tr>
							<td class="td_left">
								<label for="height">신장 : </label>
							</td>
							<td class="td_right">
								<input type ="text" name = "height" id="height" />
							</td>
						</tr>
						<tr>
							<td class="td_left">
							<label for = "weight">체중 : </label>
							</td>
							<td class="td_right">
							<input type ="text" name = "weight" id="weight" />
							</td>
						</tr>
		
						<tr>
							<td class="td_left">
								<label for="content">글내용 : </label>
							</td>
							<td class="td_right">
								<textarea name ="content" id= "content" rows="13" cols="40" wrap="off"></textarea>
							</td>
						</tr>
							
						<tr>
							<td class="td_left">
								<label for="image">상품 이미지 : </label>
							</td>
							<td class="td_right">
								<input type ="file" name= "image" id="image"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" id="commandCell">
								<input type="submit" value="개 상품등록"/>
								<input type="reset" value="다시 작성"/>
								<input type="button" value="개 상품목록 보기" onClick="window.location.href='dogList.dog'"/>
							</td>
						</tr>
				</table>
				</div>
			</form>
        </div>
        <%@ include file="footer.jsp" %>
        
    </div>
   
</body>
</html>