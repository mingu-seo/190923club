<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function join() {
	if ($("#name").val().trim() == "") {
		alert("SPOT 이름을 입력해 주세요");
		$("#name").focus();
		return false;
	}
	var con = true;
	var data = $("#joinform").serialize();
	console.log(data);
	$.ajax({
		url : "/spot/nameCheck.do",
		data : {name:$("#name").val()},
		type : "POST",
		async : false,
		success : function(data) {
			//console.log(data);
			if (data.trim() == "0") {
			} else {
				alert("중복된 SPOT이름입니다.");
				$("#name").val("");
				$("#name").focus();
				con = false;
			}
		}
	});
	if (con == false) {
		return false;
	}
	if ($("#filename_tmp").val().trim() == "") {
		alert("커버 파일을 등록해주세요");
		$("#filename_tmp").focus();
		return false;
	}
	if ($("#content").val().trim() == "") {
		alert("SPOT 소개를 입력해 주세요");
		$("#content").focus();
		return false;
	}
	if ($("#question").val().trim() == "") {
		alert("SPOT가입 질문을 입력해 주세요");
		$("#question").focus();
		return false;
	}
	if ($("#tel").val().trim() == "") {
		alert("전화번호를 입력해 주세요");
		$("#tel").focus();
		return false;
	}
	if ($("#email").val().trim() == "") {
		alert("이메일을 입력해 주세요");
		$("#email").focus();
		return false;
	}
	$("#joinform").submit();
}
</script>
</head>
<body>
<form method="post" name="joinform" id=joinform action="spotUpdate.do" enctype="multipart/form-data">
<input type="hidden" name="category_num" value="<%=request.getParameter("num")%>">
<div class="wrap">
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
    <div class="container">
        <h2 style="padding : 10 0px;">HOT SPOT 수정페이지</h2>
    </div>
    <div class="container">
         <div class="group">
	          <input type="text" name="name" id="name" class="font" maxlength="20" value="${vo.name}">
	          <span class="highlight"></span>
	          <span class="bar"></span>
	          <label>SPOT 이름</label>
         </div>
        <div class="group">      
            <input type="file" name="filename_tmp" id="filename_tmp" title="첨부파일을 업로드 해주세요." value="${vo.file}">
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>커버 선택</label>
        </div>
        <div class="group">     
            <input type="text" name="content" id="content" class="font" value="${vo.content}">
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>SPOT 소개</label>
         </div>
         <div class="group">      
            <input type="text" name="question" id="question" class="font" value="${vo.question}">
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>SPOT가입 질문</label>
         </div>
         <div class="group">      
            <input type="text" name="tel" id="tel" class="font" value="${vo.tel}">
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>Tel</label>
         </div>
         <div class="group">      
            <input type="text" name="email" id="email" class="font" value="${vo.email}">
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>Email</label>
        </div>
        <a href="spotList.do" class="spotRegistbutton">취 소</a>
		<a href="javascript:joinform.reset();" class="spotRegistbutton">다시 작성</a>
		&nbsp;    
		<a href="javascript:join();" class="spotRegistbutton">수정 완료</a>
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
</div>
</form>
</body>
</html>