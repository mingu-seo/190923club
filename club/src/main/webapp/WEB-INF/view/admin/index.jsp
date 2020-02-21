<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function loginCheck() {	// 로그인 버튼
	if ($("#id").val().trim() == "") {
		alert("아이디를 입력해 주세요");
		$("#id").focus();
		return false;
	} else if ($("#password").val() == "") {
		alert("비밀번호를 입력해 주세요");
		$("#password").focus();
		return false;
	}
	$("#adminLogin").submit();
}

</script>
</head>
<body onload="userid_chk();">
<div id="login">
	<div class="title">
		<h1>HOT SPOT <span>관리자모드</span></h1>
		<p>관리자 로그인 후 이용가능합니다.</p>
	</div>
	<div class="login"> 
	<form name="board" id="adminLogin" method="post" action="adminLogin.do" onsubmit="return loginCheck();">
		<fieldset>
			<legend>관리자모드 로그인</legend>
			<div class="bgBox">
				<div class="infoBox">
					<dl>
						<dt>
							<label for="id"><strong>아이디</strong></label>
						</dt>
						<dd>
							<input type="text" id="id" name="id" value="" title="아이디를 입력해주세요." style="ime-mode:inactive"/>
						</dd>
					</dl>
					<dl>
						<dt>
							<label for="password"><strong>비밀번호</strong></label>
						</dt>
						<dd>
							<input type="password" id="password" name="password" value="" title="비밀번호를 입력해주세요." />
						</dd>
					</dl>
				</div>
				<!-- //infoBox -->
				<input type="image" src="<%=request.getContextPath()%>/img/admin/member_login_btn.gif" alt="로그인" class="loginBtn" title="" />
			</div>
			<!-- //bgBox -->
			<div class="joinList">
				<a href="join.do">회원 가입</a>
			</div>
			<!-- //joinList -->
			<input type="hidden" name="url" id="url" value="<%//=url%>"/>
			<input type="hidden" name="param" id="param" value="<%//=param%>"/>
		</fieldset>
	</form>
	</div>
</div>
</body>
</html>