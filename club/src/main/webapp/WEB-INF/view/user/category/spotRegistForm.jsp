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
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/user/include/top.jsp" %>
	<!-- E N D :: headerArea-->
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
        <div class="spotResgistLeftbox" img="#">선택한 프로필</div>
        <h3 class="spotResgistLeftInfo">프로필은 추후 변경가능합니다.</h3>

        </div>
        <div class="spotResgistContent">
            <div class="center1">
                <h3 class="title">커버선택</h3>
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

		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
</div>

</body>
</html>