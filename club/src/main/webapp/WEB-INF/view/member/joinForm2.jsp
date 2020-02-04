<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/test/joinForm2.css">
<script>
	function join() {	// 다음 버튼
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
			alert("메일 주소 입력해 주세요");
			$("#email").focus();
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
	});
	
</script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            	회원가입
        </div>    
        <div class="menu">
            <ul>
                <li>약관동의</li>
                <li style="background-color: blanchedalmond;">정보입력</li>
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
                                <input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요"/>
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
                            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해 주세요"/>
                        </div>
                    </div>    
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="password_re">비밀번호 재확인</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="password" name="password_re" id="password_re" placeholder="비밀번호를 입력해 주세요"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="name">이름</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="name" id="name" placeholder="이름을 입력해 주세요"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="email">메일 주소</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="email" id="email" placeholder="메일 주소를 입력해 주세요"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <label for="birth">생년월일</label>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <select name="birth">
                                <option value="2000" selected>1990</option>
                                <option value="2000" selected>1991</option>
                                <option value="2000" selected>1992</option>
                                <option value="2000" selected>1993</option>
                                <option value="2000" selected>1994</option>
                                <option value="2000" selected>1995</option>
                                <option value="2001" selected>1996</option>
                                <option value="2002" selected>1997</option>
                                <option value="2003" selected>1998</option>
                                <option value="2004" selected>1999</option>
                                <option value="2000" selected>2000</option>
                                <option value="2001" selected>2001</option>
                                <option value="2002" selected>2002</option>
                                <option value="2003" selected>2003</option>
                                <option value="2004" selected>2004</option>
                            </select>
                            	년
                            <select name="birth">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            	월
                            <select name="birth">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            	일	
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="gender">성별</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="radio" name="gender" value="1" checked/>
                            <label for="man">남자</label>
                            <input type="radio" name="gender" value="2"/>
                            <label for="woman">여자</label>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="tel">휴대전화</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="tel" id="tel" placeholder="휴대전화를 입력해 주세요 (숫자만)"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <a href="javascript:join();"><input style="padding: 0 25px;" type="button" value="다음"></a>
                    </div>
                </div>
            </form>
        </div>
        <div class="footer">
            <div class="size">
               <div class="info">
                   <p>구디아카데미</p>
                   <p>서울시 서울구 서울로 서울동 서울호</p>
                   <p>02-2000-2000 | 010-2222-2222</p>
                   <p>대표자 김철수 | 책임자 김수철</p>
                   <p>사업자등록번호 111-11-22222</p>
               </div>
               <div class="sns_area">
                   <a href=""><img src="/css/test/img/facebook.png"></a>
                   <a href=""><img src="/css/test/img/instar.png"></a>
                   <a href=""><img src="/css/test/img/blog.png"></a>
               </div>
            </div>
       </div>
    </div>
</body>
</html>