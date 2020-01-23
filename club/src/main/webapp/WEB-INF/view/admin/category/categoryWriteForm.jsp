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
		alert("Category 이름을 입력해 주세요");
		$("#name").focus();
		return false;
	}
	$('#frm').submit();
}

</script>

</head>
<body>
<!-- S T A R T :: headerArea-->
<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<!-- E N D :: headerArea-->
<form method="post" name="frm" id="frm" action="categoryRegist.do" enctype="multipart/form-data">
<div class="wrap">
    <div class="container">
        <h2 style="padding : 10 0px;">Category 등록</h2>
    </div>
    <div class="container">
            <div class="group">      
	            <input type="text" name="name" id="name">
	            <span class="highlight"></span>
	            <span class="bar"></span>
	            <label>Category 이름</label>
            </div>
    </div>
    <div class="container">
            <div class="group">      
	            <input type="file" name="filename_tmp" id="filename_tmp">
	            <span class="highlight"></span>
	            <span class="bar"></span>
	            <label>Category 이미지</label>
            </div>
    </div>
	<div class="container">
        <a class="spotRegistbutton" href="categoryList.do"><strong>취 소</strong></a>     
        <a class="spotRegistbutton" onClick="save();"><strong>저 장</strong></a>      
    </div>    

</div>
</form>
</body>
</html>