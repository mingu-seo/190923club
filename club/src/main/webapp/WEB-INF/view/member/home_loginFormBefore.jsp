<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="/js/jquery.1.2.3.js"></script>
    <script src="/js/swiper.min.js"></script>
    <link rel="stylesheet" href="/css/test/swiper.css">
    <link rel="stylesheet" href="/css/test/reset.css">
    <link rel="stylesheet" href="/css/test/home_loginFormBefore.css">   
    <script>
    	$(function() {
    		var swiper = new Swiper('.swiper', {
                slidesPerView: 'auto',
                loop: true,
	            navigation: {
	                nextEl: '.swiper-button-next',
	                prevEl: '.swiper-button-prev',
	            },
	            pagination: {
	                el: '.swiper-pagination'
	            },
        	});
    	});
    	
    	function login() {	// 로그인 버튼
    		if ($("#id").val().trim() == "") {
    			alert("아이디를 입력해 주세요");
    			$("#id").focus();
    			return false;
    		} else if ($("#password").val() == "") {
    			alert("비밀번호를 입력해 주세요");
    			$("#password").focus();
    			return false;
    		}
    		var con = true;
    		var data = $("#userLogin").serialize();
    		//console.log(data);
    		$.ajax({
    			url : "/member/userLogin.do",
    			data : {id:$("#id").val()},
    			type : "POST",
    			async : false,
    			success : function(data) {
    				//console.log(data);
    				if (data.trim() != "") {
    				} else {
    					alert("dk입니다.");
    					$("#id").val("");
    					$("#id").focus();
    					con = false;
    				}
    			}
    		});
    		if (con == false) {
    			return false;
    		}
    		if ($("#id").val().trim() == "") {
    			alert("존재하지 않는 아이디 입니다.");
    			$("#id").focus();
    			return false;
    		}
    		if ($("#password").val().trim() == "") {
    			alert("비밀번호를 입력해 주세요");
    			$("#password").focus();
    			return false;
    		}
    		if ($("#password").val().trim() != $("#password_re").val().trim()) {
    			alert("비밀번호와 일치하지 않습니다.");
    			$("#password_re").val("");
    			$("#password_re").focus();
    			return false;
    		}

    		$("#userLogin").submit();
    	}
    </script>
</head>
<body>
    <div class="wrap">
        <form id="userLogin" action="userLogin.do" post="post">
	        <div class="header">
	            <a href="/member/joinForm1.do" style="float: right; padding: 30px;"><input style="padding: 5px 10px;" type="button" value="회원가입"></a>
	            	<div class="login">
		                <table>
		                    <th class="loginHeader" colspan="2">로그인</th class="loginHeader">
		                    <tr>
		                        <td><label for="id" style="font-size:20px">아이디</label></td>
		                        <td><input type="text" id="id" name="id"></td>
		                    </tr>
		                    <tr>
		                        <td><label for="password" style="font-size:20px">비밀번호</label></td>
		                        <td><input type="password" id="password" name="password"></td>
		                    </tr>
		                    <tr>
		                        <td colspan="2">
		                            <div class="loginBtnArea">
		                                <a href="script:login()">
		                                	<input style="float: left; margin: 0 10px; padding: 5px; width: 85px;" type="submit" id="userLogin" value="로그인">
		                                </a>
		                                <input style="float: right; margin: 0 10px; padding: 5px; width: 85px;" type="button" value="비밀번호 찾기">
		                            </div>
		                        </td>
		                    </tr>
		                </table>
		            </div>
		        </div>
            </form>
        <div class="description">
            <div class="visual">
	       	 <div class="swiper swiper-container">
	       	 	<div class="swiper-wrapper">
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 	</div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-pagination"></div>
	       	 </div>
	      </div>
        </div>
        <div class="container">
            <div class="content">
                <div class="club">
                    <a href=""><img src=""><div class=club_description></div></a>
                </div>
                <div class="club">
                    <a href=""><img src=""></a>
                </div>
                <div class="club">
                    <a href=""><img src=""></a>
                </div>
                <div class="club">
                    <a href=""><img src=""></a>
                </div>
                <div class="club">
                    <a href=""><img src=""></a>
                </div>
                <div class="club">
                    <a href=""><img src=""></a>
                </div>
            </div>
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