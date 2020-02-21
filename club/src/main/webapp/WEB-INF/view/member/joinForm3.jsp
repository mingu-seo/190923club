<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/test/joinForm3.css">
</head>
<body>
    <div class="wrap">
        <div class="header">
            회원가입
        </div>    
        <div class="menu">
            <ul>
                <li>약관동의</li>
                <li>정보입력</li>
                <li style="background-color: aliceblue;">가입완료</li>
            </ul>
        </div>
        <div class="container">
            <div class="contract">
                <div class="head">
                    가입완료
                </div>
                <div class="content">
                    <p>가입이 완료되었습니다.</p>
                </div>
                <div class="btn">
                    <a href="/member/loginFormBefore.do">
                    	<input style="padding: 5px 20px;" type="button" value="확인">
                    </a>
                </div>
            </div>
        </div>
	    <div class="container">
			<!-- S T A R T :: footerArea-->
			<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
			<!-- E N D :: footerArea-->
	    </div>
    </div>
</body>
</html>