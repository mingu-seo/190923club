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
        <h3>카테고리 선택 후, 나만의 SPOT을 만들어보세요!</h3>
    <div class="categorycontainer">
        <div class="center">
            <div class="button">
                <a href="#" class="categorybox">취미, 동호회</a> 
            </div>    
            <div class="button">
                <a href="#" class="categorybox">가족</a> 
            </div>
            <div class="button">
                <a href="#" class="categorybox">학교,동아리</a> 
            </div>
            <div class="button">
                <a href="#" class="categorybox">회사, 팀</a> 
            </div>
            <div class="button">
                <a href="#" class="categorybox">운동</a> 
            </div>
            <div class="button">
                <a href="#" class="categorybox">게임</a> 
            </div>
            <div class="button">
                <a href="#" class="categorybox" >스터디</a> 
            </div>            
            <div class="button">
                <a href="#" class="categorybox">종교</a> 
            </div>            
            <div class="button">
                <a href="#" class="categorybox">기타</a> 
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