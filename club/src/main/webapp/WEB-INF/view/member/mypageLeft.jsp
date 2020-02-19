<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="spot.SpotVO"%>
<%
SpotVO list = (SpotVO)request.getAttribute("spot_vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/test/mypageLeft.css">
</head>
<body>
	<div class="visualLeft">
       	<div class="visualLeftInner">
       		<div class="joinForm">
        <div class="mypageLeft">
            <div class="leftContent">
                <div class="titleText1">
                    <div class=btn1><a href=""><input type="button" value="내 정보"></a></div>
                </div>
                <div class="titleText2">
                    <div class=btn2><a href="/spot/spotList.do"><input type="button" value="나의 핫스팟"></a></div>
                </div>
                <div class="titleText3">
                    <div class=btn2><a href=""><input type="button" value="HOT SPOT공지사항"></a></div>
                </div>
                <div class="titleText4">
                    <div class=btn2><a href=""><input type="button" value="HOT SPOT QnA"></a></div>
                </div>
                <div class="titleText5">
                    <div class=btn2><a href=""><input type="button" value="이용약관"></a></div>
                </div>
                <div class="titleText6">
                    <div class=btn2><a href=""><input type="button" value="개인정보 처리방침"></a></div>
                </div>
            </div>
        </div>
    </div>
       	</div>
    </div>
</body>
</html>