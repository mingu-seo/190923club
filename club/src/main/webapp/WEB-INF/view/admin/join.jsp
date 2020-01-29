<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/categoryheadHtml.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>


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
							alert("사용 가능합니다.");
							$("#id").attr("readonly", "readonly");
						} else {
							alert("등록된 ID입니다.");
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
<!-- S T A R T :: headerArea-->
<div id="header">
	<div class="header_inner">
		<h1>HOT SPOT</h1>
		<p class="login_name"></p>
	</div>
</div>
<!-- E N D :: headerArea-->
<form name="joinform" id="joinform" action="joinProcess.do" method="post">
<div class="wrap">
	<div class="joinwrap">
	    <div class="joinheadcontainer">
	        <h2>회원가입 페이지</h2>
	    </div>
	    <div class="joincontainer">	         
	      	<div class="lcontents1">
          		id : 
        	</div>
        	<div class="content1">
       			<input type="text" name="id" id="id">&nbsp;<input type="button" id="duplicateCheck" value=" 중복체크 ">
	   		</div>
	   	</div>
		<div class="joincontainer">
			<div class="lcontents1">
				PASSWORD : 
			</div>
        	<div class="content1">
				<input type="password" name="password" id="password">
			</div>
		</div>
		<div class="joincontainer">
	      	<div class="lcontents1">
	      		NAME : 
	      	</div>
	      	<div class="content1">
				<input type="text" name="name" id="name">
			</div>
		</div>
		<div class="joincontainer">
	      	<div class="lcontents1">
				TEL :
			</div>
	      	<div class="content1">
				<select>
		               <optgroup label="tel1" name="tel1">
		                   <option>010</option>
		                   <option>011</option>
		                   <option>017</option>
		                   <option>018</option>
		                   <option>019</option>
		               </optgroup>
		           </select>&nbsp;-
				<input type="text" name="tel2" size="10" maxlength="4" id="tel1">&nbsp;-
				<input type="text" name="tel3" size="10" maxlength="4" id="tel2">
			</div>
		</div>
		<div class="joincontainer">
	      	<div class="lcontents1">
				EMAIL : 
			</div>
	      	<div class="content1">			
				<input type="text" name="email" id="email">
			</div>
		</div>
		<div class="joinheadcontainer">
			<div>
				<a href="javascript:join();" class="joinfont">가입완료</a>
				&nbsp;
				<a href="javascript:joinform.reset();" class="joinfont">다시작성</a>
				&nbsp;
				<a href="index.do" class="joinfont">메인으로</a>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>