<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int joinSpotCnt = (Integer)request.getAttribute("joinSpotCnt");
	int listcount = (Integer)request.getAttribute("listcount");
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
	<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
    <link rel="stylesheet" href="/css/test/spotSetting.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
    <div class="wrap">
       
	<!-- S T A R T :: headerArea-->
	<!-- E N D :: headerArea-->
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="/WEB-INF/view/board/submain/submainLeft.jsp" %> 

        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		<div class="content">
            <section class="setting">
                <div class="settingHeader">
                    	HOT SPOT설정
                </div>
                <ul class="settingList">
                    <li class="settingItem">
                        <div class="itemContent">SPOT 설정</div>
                        <div class="itemSide">
                        	<a href="/spot/spotUpdateForm.do?num=<%=list.getNum()%>"><input type="button" value="변경"></a>
                        </div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">SPOT 삭제</div>
                        <div class="itemSide">
                        	<a href="/spot/spotDelete.do?num=<%=list.getNum() %>">
                        		<input type="button" value="변경">
                        	</a>
                        </div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">멤버 관리</div>
                        <div class="itemSide">
                        	<a href="/member/memberList.do"><input type="button" value="변경"></a>
                        </div>
                    </li>
                    <li class="settingItem">
                        <div class="itemContent">리더 위임</div>
                        <div class="itemSide"><input type="button" value="변경"></div>
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