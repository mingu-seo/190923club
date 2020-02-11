<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
	<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
    <link rel="stylesheet" href="/css/test/clubSetting.css">
</head>
<body>
    <div class="wrap">
       
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
	<!-- E N D :: headerArea-->
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
<%--         	<%@ include file="/WEB-INF/view/board/submain/submainLeft.jsp" %> --%>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		<div class="content">
            <section class="setting">
                <div class="settingHeader">
                    	동아리 설정
                </div>
                <ul class="settingList">
                    <li class="settingItem" style="border-top: solid 1px rgb(134, 124, 124);">
                        <div class="itemContent">동아리 이름 변경</div>
                        <div class="itemSide"><input style="padding: 11px;" type="button" value="변경"></div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">메인 사진 변경</div>
                        <div class="itemSide"><input style="padding: 11px;" type="button" value="변경"></div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">동아리 삭제</div>
                        <div class="itemSide"><input style="padding: 11px;" type="button" value="변경"></div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">멤버 관리</div>
                        <div class="itemSide">
                        	<a href="/member/memberList.do"><input style="padding: 11px;" type="button" value="변경"></a>
                        </div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">리더 위임</div>
                        <div class="itemSide"><input style="padding: 11px;" type="button" value="변경"></div>
                    </li>
                </ul>
            </section>
        </div>
        	</div>        	
        </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
</body>
</html>