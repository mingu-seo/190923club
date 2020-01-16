<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
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
    	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
       
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	
        	</div>
        	<div class="visualRight">
        		<h1>갤러리</h1>
				<form action="galleryInsert.do" method="post" enctype="multipart/form-data" onsubmit="save();">
					<table id="boardTable">
					<tr>
						<th>카테고리</th>
						<td>
						<select name="category" class="tableRight">
							<option value="생일">생일</option>
							<option value="대회">대회</option>
							<option value="웃음">웃음</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="file" id="image" name="image_tmp" onchange="getThumbnailPrivew(this,$('#thumb_img1'));" ></td>
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
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
  </div>
</body>
</html>