<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="/WEB-INF/view/board/submain/head.jsp" %>
<script>
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.html('<img src="' + e.target.result + '" class="listImg" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
</head>
<body>

    <div class="wrap">
    	<%@ include file="/WEB-INF/view/board/submain/header.jsp" %>
       
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	
        	</div>
        	<div class="visualRight">
        		<h1>자유게시판</h1>
				<form action="" method="post" enctype="multipart/form-data" onsubmit="save();">
			
					<table id="boardTable">
					<tr>
						<td colspan="2"><h3>갤러리</h3></td>
					</tr>
					<tr>
						<td><input type="file" name="image" onchange="getThumbnailPrivew(this,$('#thumb_img1'));" ></td>
					</tr>
					
					<tr>
					<td colspan="2" >
					<div id="thumb_img1" onfocus="this.value='';">사진이나 동영상을 불러오세요</div>
					</tr>
					
					
					<tr>		
						<td colspan="2">
							<textarea name="contents" id="contents" onfocus="this.value='';">내용을 입력하세요</textarea>
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
    <%@ include file="/WEB-INF/view/board/submain/footer.jsp" %>
  </div>
</body>
</html>