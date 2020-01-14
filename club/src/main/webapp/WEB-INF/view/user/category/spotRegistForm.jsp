<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
    <div class="header">
        HEADER 
    </div>
    <div class="container">
        <h2 style="padding : 10 0px;">HOT SPOT 생성페이지</h2>
    </div>
    <div class="container">
        <form>
            <div class="group">      
            <input type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>SPOT 이름</label>
            </div>
        </form>
    </div>
    
    <div class="container">
        <div class="spotResgistLeftmenu">
        <div class="spotResgistLeftbox" img="#">선택한 프로필<br>프로필은 추후에 변경 가능합니다.</div>

        </div>
        <div class="spotResgistContent">
            <div class="center1">
                <h3 style="
                position: absolute;
                top: 60px; ">커버선택</h3>
                <div class="navi">
                    <span class="paging">1/3</span>
                    <span class="btnArea">
                        <button class="prev"><</button>
                        <button class="next">></button>
                    </span>
                </div>
            </div>
            <div class="center2">
                <div class="button">
                    <a href="#" class="spotResgistBox" img="#">사용자가</a> 
                </div> 
                <div class="spotResgistBox">관리자가 </div>
                <div class="spotResgistBox">관리자가 </div>
                <div class="spotResgistBox">관리자가 </div>
                <div class="spotResgistBox">관리자가 </div>
                <div class="spotResgistBox">관리자가 </div>
                <div class="spotResgistBox">관리자가 </div>
                <div class="spotResgistBox">관리자가 </div>
            </div>
        </div>
    </div>
    <div class="container">
        <form>
            <div class="group">      
            <input type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>SPOT 소개</label>
            </div>
        </form>
        <form>
            <div class="group">      
            <input type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>SPOT가입 질문설정</label>
            </div>
        </form>
        <form>
            <div class="group">      
            <input type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>Contact us</label>
            </div>
        </form>
        <input type="button" class="spotRegistbutton" value="취    소">
        <input type="submit" class="spotRegistbutton" value="확    인">        
    </div>
        <div class="container">
        <div class="footer">
            FOOTER
        </div>
    </div>
</div>
</body>
</html>