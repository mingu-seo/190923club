<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/categoryheadHtml.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function save() {
	if ($("#name").val().trim() == "") {
		alert("INFO 키워드를 입력해 주세요");
		$("#name").focus();
		return false;
	}
	$('#frm').submit();
}

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
<!-- S T A R T :: headerArea-->
<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<!-- E N D :: headerArea-->
<form method="post" name="frm" id="frm" action="infoRegist.do" enctype="multipart/form-data">
<div class="wrap">
    <div class="container">
        <h2 style="padding : 10 0px;">Info 등록</h2>
    </div>
    <div class="container">
            <div class="group">      
	            <input type="text" name="name" id="name">
	            <span class="highlight"></span>
	            <span class="bar"></span>
	            <label>Info 키워드</label>
            </div>
    </div>
    <div class="container">
            <div class="group">      
	            <input type="text" name="content" >
	            <span class="highlight"></span>
	            <span class="bar"></span>
	            <label>Info 내용</label>
            </div>
    </div>
    <div class="container">
            <div class="group">      
	            <input type="file" class="file" name="filename_tmp" id="filename_tmp" onchange="getThumbnailPrivew(this,$('#thumb_img1'));">
	            <label>Info 이미지</label>
            </div>
            <div class="group">
            	<div id="thumb_img1" onfocus="this.value='';">사진을 올려보세요</div>
            </div>
    </div>
    
	<div class="container">
        <a class="spotRegistbutton" href="infoList.do"><strong>취 소</strong></a>     
        <a class="spotRegistbutton" onClick="save();"><strong>저 장</strong></a>      
    </div>    

</div>
</form>
</body>
</html>