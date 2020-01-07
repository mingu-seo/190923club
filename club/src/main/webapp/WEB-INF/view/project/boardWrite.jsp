<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="head.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				<script type="text/javascript" src="/club/smarteditor/js/HuskyEZCreator.js"></script>
				<script>
				var oEditors = [];
				$(function() {
					
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "content", // textarea ID
						sSkinURI: "/club/smarteditor/SmartEditor2Skin.html",	
						htParams : {
							bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							fOnBeforeUnload : function(){
								
							}
						}, //boolean
						fOnAppLoad : function(){
							//예제 코드
							//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
						},
						fCreator: "createSEditor2"
					});
				});
				
				function save(){
					oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);//에디터의 내용을 textarea(id-content)에 적용
				}
				</script>


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
        		<div>
				<form action="" method="post" enctype="multipart/form-data" onsubmit="save();">
			
					<table id="boardTable">
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category" id="tableRight">
							<option value="공감해주셈">공감해주셈</option>
							<option value="웃긴글">웃긴글</option>
							<option value="어쩌구">어쩌구</option>
							</select>
						</td>
					</tr>
					<tr>		
						<th>제목</th>
						<td>
							<input type="text" name="title" id="tableRight">
						</td>
						
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
        
        
    </div>
    <%@ include file="footer.jsp" %>
  </div>
</body>
</html>