<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.wrap{
	width: 1200px;
}
.container{
	width: 1200px;
}
</style>

<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<script>
	function join() {
		if ($("#id").val().trim() == "") {
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		}
		var con = true;
		var data = $("#joinform").serialize();
		console.log(data);
		$.ajax({
			url : "/admin/idCheck.do",
			data : {id:$("#id").val()},
			type : "POST",
			async : false,
			success : function(data) {
				//console.log(data);
				if (data.trim() == "0") {
				} else {
					alert("중복된 아이디입니다.");
					$("#id").val("");
					$("#id").focus();
					con = false;
				}
			}
		});
		if (con == false) {
			return false;
		}
		if ($("#password").val().trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		if ($("#name").val().trim() == "") {
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		if ($("#tel1").val().trim() == "") {
			alert("전화번호를 입력해 주세요");
			$("#tel1").focus();
			return false;
		}
		if ($("#tel2").val().trim() == "") {
			alert("전화번호를 입력해 주세요");
			$("#tel2").focus();
			return false;
		}
		if ($("#email").val().trim() == "") {
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}
		
		$("#joinform").submit();
	}
	
	$(function() {
		$("#duplicateCheck").click(function() {
			if ($("#id").val().trim() == "") {
				alert("아이디를 입력해 주세요");
			} else {
				$.ajax({
					url : "/admin/idCheck.do",
					data : {id:$("#id").val()},
					type : "POST",
					success : function(data) {
						//console.log(data);
						if (data.trim() == "0") {
							alert("사용 가능");
							$("#id").attr("readonly", "readonly");
						} else {
							alert("사용 불가");
						}
					}
				});
			}
		});
	});

</script>
<style>

</style>
</head>
<body>
<form name="joinform" id="joinform" action="joinProcess.do" method="post">
<div class="wrap">
    <div class="container">
        <h2 style="padding : 10 0px;">회원가입 페이지</h2>
    </div>
    <div class="container">	            
		<label for="id">아이디 : </label>
		<input type="text" name="id" id="id"><input type="button" id="duplicateCheck" value="아이디 중복체크">
    </div>
	<div class="container">
		<label for="password">비밀번호 : </label>
		<input type="password" name="password" id="password">
	</div>
	<div class="container">
		<label for="name">이름 : </label>
		<input type="text" name="name" id="name">
	</div>
	<div class="container">
		<label for="tel">전화번호 : </label>
		<select>
               <optgroup label="tel1" name="tel1">
                   <option>010</option>
                   <option>011</option>
                   <option>017</option>
                   <option>018</option>
                   <option>019</option>
               </optgroup>
           </select>&nbsp;-
		<input type="text" name="tel2" size="6" maxlength="4" id="tel1">&nbsp;-
		<input type="text" name="tel3" size="6" maxlength="4" id="tel2">
	</div>
	<div class="container">
		<label for="email">이메일주소 : </label>
		<input type="text" name="email" id="email">
	</div>
	<div class="container">
		<div colspan="2">
			<a href="javascript:join();">가입완료</a>
			&nbsp;
			<a href="javascript:joinform.reset();">다시작성</a>
			&nbsp;
			<a href="index.do">메인으로</a>
		</div>
	</div>
</div>
</form>
</body>
</html>