<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/test/joinForm1.css">    
<script>
function contractCheck(){
	if (!$("#contractCheck").prop("checked")) {
		alert("약관에 동의해주세요");
		return false;
	} else {		
		location.href="/member/joinForm2.do";
	}
}
</script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            회원가입
        </div>    
        <div class="menu">
            <ul>
                <li style="background-color: blanchedalmond;">약관동의</li>
                <li>정보입력</li>
                <li>가입완료</li>
            </ul>
        </div>
        <div class="container">
            <div class="contract">
                <div class="head">
					약관동의
                </div>
                <div class="content">
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                    <p>약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의-약관 동의</p>
                </div>
                <div class="bottom">
                    <p><input id="contractCheck" type="checkbox">약관에 동의합니다.</p>
                </div>
                <div class="btn">
                    <input style="padding: 5px 20px;" type="button" value="다음" onclick="contractCheck()">
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