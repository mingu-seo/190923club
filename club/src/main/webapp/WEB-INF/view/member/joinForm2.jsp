<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/test/joinForm2.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function join() {	// 다음 버튼
		if ($("#id").val().trim() == "") {
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		}
		if ($("#id").val().trim() == "") {
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		}
		var con = true;
		var data = $("#joinform").serialize();
		//console.log(data);
		$.ajax({
			url : "/member/idCheck.do",
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
		if ($("#password_re").val().trim() == "") {
			alert("비밀번호 재확인을 입력해 주세요");
			$("#password_re").focus();
			return false;
		}
		if ($("#password").val().trim() != $("#password_re").val().trim()) {
			alert("비밀번호와 일치하지 않습니다.");
			$("#password_re").val("");
			$("#password_re").focus();
			return false;
		}
		if ($("#name").val().trim() == "") {
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		if ($("#email").val().trim() == "") {
			alert("메일 주소를 입력해 주세요");
			$("#email").focus();
			return false;
		}
		if ($("#birth").val().trim() == "") {
			alert("생일을 입력해 주세요");
			$("#birth").focus();
			return false;
		}
		if ($("#tel").val().trim() == "") {
			alert("휴대전화를 입력해 주세요");
			$("#tel").focus();
			return false;
		}

		$("#joinform").submit();
	}
	
	$(function() {	// 중복확인 버튼
		$("#duplicateCheck").click(function() {
			if ($("#id").val().trim() == "") {
				alert("아이디를 입력해 주세요");
			} else {
				$.ajax({
					url : "/member/idCheck.do",
					data : {id:$("#id").val()},
					type : "POST",
					success : function(data) {
						console.log(data);
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
	
		 $( "#birth" ).datepicker({
	    		dateFormat: 'yy-mm-dd' //Input Display Format 변경
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	            ,changeYear: true //콤보박스에서 년 선택 가능
	            ,changeMonth: true //콤보박스에서 월 선택 가능                
	            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	            
		 		,yearRange:"c-80:c-10"
	    });
	});
	
	
	
</script>
</head>
<body>
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
    <div class="wrap">
        <div class="header">
            	회원가입
        </div>    
        <div class="menu">
            <ul>
                <li>약관동의</li>
                <li style="background-color: aliceblue;">정보입력</li>
                <li>가입완료</li>
            </ul>
        </div>
        <div class="container">
            <form id="joinform" name="joinform" action="join.do" method="post">
                <div class="content">
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="id">아이디</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <div class="cf_bottom_left">
                                <input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요."/>
                            </div>
                            <div class="cf_bottom_right">
                                <input type="button" id="duplicateCheck" value="중복체크">
                            </div>
                        </div>
                    </div>
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="password">비밀번호</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해 주세요."/>
                        </div>
                    </div>    
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="password_re">비밀번호 재확인</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="password" name="password_re" id="password_re" placeholder="비밀번호를 입력해 주세요."/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="name">이름</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="name" id="name" placeholder="이름을 입력해 주세요."/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="email">메일 주소</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="email" id="email" placeholder="메일 주소를 입력해 주세요."/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="birth">생년월일</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="birth" id="birth" value="" readonly>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="gender">성별</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="radio" name="gender" value="1" checked/>
                            <label for="man">남자</label>&nbsp;&nbsp;
                            <input type="radio" name="gender" value="2"/>
                            <label for="woman">여자</label>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="tel">휴대전화</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="tel" id="tel" placeholder="휴대전화를 입력해 주세요. (숫자만)"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <a href="javascript:join();"><input style="padding: 0 25px;" type="button" value="다음"></a>
                    </div>
                </div>
            </form>
        </div>
	    <div class="container">
			<!-- S T A R T :: footerArea-->
			<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
			<!-- E N D :: footerArea-->
	    </div>
    </div>
</body>
</html>