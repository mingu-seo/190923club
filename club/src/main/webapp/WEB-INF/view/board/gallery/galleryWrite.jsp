<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="gallery.GalleryVO" %>
<%@ page import ="member.MemberVO" %>
<%@ page import ="category.CategoryVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
GalleryVO vo = (GalleryVO)request.getAttribute("vo");
MemberVO sessVO = (MemberVO)session.getAttribute("sess");//세션객체
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
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
    	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
       
       <div class="main">
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	
        	</div>
        	<div class="visualRight">
        		<div class="board_ctg_name"><%=cate_name.getName() %></div>
				<form action="galleryInsert.do" method="post" enctype="multipart/form-data" onsubmit="save();">
				<input type="hidden" name="spot_num" value="<%=spot_num%>">
				<input type="hidden" name="board_id" value="1">
				<input type="hidden" name="category_id" value="<%=vo.getCategory_id()%>">
				<input type="hidden" name="member_id" value="<%=sessVO.getNum()%>">
				<input type="hidden" name="writer" value="<%=sessVO.getName()%>">
				 
					<table id="boardTable" border="1">
					<tr>		
						<th>제목</th>
							<td colspan="2" class="writing_box">
								<input type="text" name="title" class="tableRight" required>
							</td>
					</tr>
					
					<tr>
						<th>파일 선택</th>
						<td colspan="2"><input type="file" id="image" name="image_tmp" onchange="getThumbnailPrivew(this,$('#thumb_img1'));" required></td>
					</tr>
					<tr>
						<th>파일 선택</th>
						<td colspan="2"><input type="file" id="image2" name="image_tmp2" onchange="getThumbnailPrivew(this,$('#thumb_img2'));" ></td>
					</tr>
					<tr>
						<th>파일 선택</th>
						<td colspan="2"><input type="file" id="image3" name="image_tmp3" onchange="getThumbnailPrivew(this,$('#thumb_img3'));" ></td>
					</tr>
					
					<tr>
						<td><div id="thumb_img1" onfocus="this.value='';"><img src="/img/1.png"></div></td>
						<td><div id="thumb_img2" onfocus="this.value='';"><img src="/img/1.png"></div></td>
						<td><div id="thumb_img3" onfocus="this.value='';"><img src="/img/1.png"></div></td>
					</tr>
					
					
					<tr>		
						<td colspan="3">
							<textarea name="contents" id="contents" onfocus="this.value='';">내용을 입력하세요</textarea>
						</td>
					</tr>
						
					</table>
					
					<div class="writing_btns">
						<span><input type="submit" value="작성완료" class="btns"></span>
						<span><input type="reset" value="다시 작성" class="btns"/></span>
						<span><input type="button" value="목록" class="btns" onclick="location.href='galleryList.do?spot_num=<%=spot_num%>&category_id=<%=vo.getCategory_id()%>'"></span>
					</div>
				</form>
        </div>
        
        
    </div>
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
  </div>
</body>
</html>