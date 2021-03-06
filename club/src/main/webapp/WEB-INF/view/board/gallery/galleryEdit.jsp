<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="category.CategoryVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="gallery.GalleryVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
GalleryVO vo = (GalleryVO)request.getAttribute("vo");
SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo");
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
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

    	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
    <div class="wrap">
       <div class="main">
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	 
        	</div> 
        	<div class="visualRight">
        		<div class="board_ctg_name"><%=cate_name.getName() %></div><!-- 카테고리 이름 -->
				<form action="galleryUpdate.do" method="post" enctype="multipart/form-data" onsubmit="save();">
					<input type="hidden" name="post_id" value="<%=vo.getPost_id() %>">
					<input type="hidden" name="board_id" value="<%=vo.getBoard_id() %>">
					<input type="hidden" name="category_id" value="<%=vo.getCategory_id() %>">
					<input type="hidden" name="spot_num" value="<%=spot_num%>">
					
					<table id="boardTable" border="1">
					<tr>		
						<th>제목</th>
							<td colspan="2" class="writing_box" >
								<input type="text" name="title" class="tableRight" value="<% out.print(vo.getTitle());%>">
							</td>
					</tr>
					
					<tr>
						<th>파일 선택</th>
						<td colspan="2"><input type="file" id="image" name="image_tmp" onchange="getThumbnailPrivew(this,$('#thumb_img1'));"></td>
						
					</tr>
					<tr>
						<th>파일 선택</th>
						<td colspan="2"><input type="file" id="image2" name="image_tmp2" onchange="getThumbnailPrivew(this,$('#thumb_img2'));" >
						</td>
					</tr>
					<tr>
						<th>파일 선택</th>
						<td colspan="2"><input type="file" id="image3" name="image_tmp3" onchange="getThumbnailPrivew(this,$('#thumb_img3'));" >
						</td>
					</tr>
					<tr>
						<td><div id="thumb_img1" onfocus="this.value='';"><img style="max-width:150px;" src="/upload/<%=vo.getImage()%>"></div>
						<a href="/board/gallery/deleteImage.do?post_id=<%=vo.getPost_id()%>&cname=image&spot_num=<%=spot_num%>&board_id=<%=vo.getBoard_id()%>&category_id=<%=vo.getCategory_id()%>"><input type="button" value="삭제"></a></td>
						<td><div id="thumb_img2" onfocus="this.value='';"><img style="max-width:150px;" 
						
						<%if(vo.getImage2()!=null ){%>
						src="/upload/<%=vo.getImage2()%>"></div>
						<a href="/board/gallery/deleteImage.do?post_id=<%=vo.getPost_id()%>&cname=image2&spot_num=<%=spot_num%>&board_id=<%=vo.getBoard_id()%>&category_id=<%=vo.getCategory_id()%>"><input type="button" value="삭제"></a></td>
						<%}%>
						
						<td><div id="thumb_img3" onfocus="this.value='';"><img style="max-width:150px;" 
						<%if(vo.getImage3()!=null ){%>
						src="/upload/<%=vo.getImage3()%>"></div>
						<a href="/board/gallery/deleteImage.do?post_id=<%=vo.getPost_id()%>&cname=image3&spot_num=<%=spot_num%>&board_id=<%=vo.getBoard_id()%>&category_id=<%=vo.getCategory_id()%>"><input type="button" value="삭제"></a></td>
						<%}%>
					</tr>
					
					
					<tr>		
						<td colspan="3">
							<textarea name="contents" id="contents"><%=vo.getContents()%></textarea>
						</td>
					</tr>
						
					</table>
					 
					<div class="writing_btns">
						<span><input type="submit" value="수정완료" class="btns"></span>
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