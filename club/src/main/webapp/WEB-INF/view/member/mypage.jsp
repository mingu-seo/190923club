<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberVO vo = (MemberVO)session.getAttribute("sess"); %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
<link rel="stylesheet" href="/css/test/mypage.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function update() {		// 수정 버튼
	if ($("#name").val().trim() == "") {
		alert("이름을 입력해 주세요");
		$("#name").focus();
		return false;
	}
	if ($("#birth").val().trim() == "") {
		alert("생일을 입력해 주세요");
		$("#birth").focus();
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

	$("#mypageForm").submit();
}
$( function() {
    $( "#birth" ).datepicker({
    		dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    		,yearRange:"c-80:c-10"
    });
  } );
</script>
</head>
<body>
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->  
    <div class="wrap">
        <div class="visual">
        	<div class="visualRight">
        		<div class="content">
            <div class="mypage">
	            <form id="mypageForm" action="mypageUpdate.do" method="post" enctype="multipart/form-data">
	            	<input type="hidden" name="num" value="<%=vo.getNum()%>">
	                <h2 class="headerTitle">내 정보</h2>
	                <div class="profile">
	                    <div class="profileTitle" style="line-height: 80px;">사용 중인 프로필</div>
	                    <div class="profileBox">
	                    	<img src=<%if(vo.getProfile()==null){ %>/css/test/img/profile.jpeg
	                    			 <%} else{%>
	                    			 /profileImg/<%=vo.getProfile()%>
	                    			 <%} %>>
	                    			&nbsp;&nbsp;<%=vo.getId()%>
							<div class="imgUpdateBtn"><input type="file" name="image_tmp" id="image" value="사진 업로드"></div>
	                    </div>
	                </div>
	                <div class="info">
	                    <div class="profileTitle" style="line-height: 50px;">개인 정보</div>
	                    <div class="profileBox">
	                        <div class="content">
	                            <div class="profileBoxTitle">
	                                <label for="name">이름</label>
	                            </div>
	                            <div class="profileBoxContent">
	                                <input type="text" id="name" name="name" value="<%=vo.getName() %>">
	                            </div>
	                        </div>
	                        <div class="content">
	                            <div class="profileBoxTitle">
	                                <label for="birth">생년월일</label>
	                            </div>
	                            <div class="profileBoxContent">
	                                <input type="text" name="birth" id="birth" value="<%=vo.getBirth()%>" readonly>
	                            </div>
	                        </div>
	                        <div class="content">
	                            <div class="profileBoxTitle">
	                                <label for="gender">성별</label>
	                            </div>
	                            <div class="profileBoxContent">
	                                <input type="radio" name="gender" value="1" <%if(vo.getGender()==1){ %>checked<%} %>/>
	                                <label for="man">남자</label>
	                                <input type="radio" name="gender" value="2" <%if(vo.getGender()==2){ %>checked<%} %>/>
	                                <label for="woman">여자</label>
	                            </div>
	                        </div>
	                        <div class="content">
	                            <div class="profileBoxTitle">
	                                <label for="email">메일 주소</label>
	                            </div>
	                            <div class="profileBoxContent">
	                                <input type="text" name="email" id="email" value="<%=vo.getEmail()%>"/>
	                            </div>
	                        </div>
	                        <div class="content">
	                            <div class="profileBoxTitle">
	                                <label for="tel">휴대전화</label>
	                            </div>
	                            <div class="profileBoxContent">
	                                <input type="text" name="tel" id="tel" value="<%=vo.getTel()%>"/>
	                            </div>
	                        </div>
	                    </div>
	        		</div>
		        <div class="profileBtn">
		            <div class="profileBtn">
		            	<input style="padding: 8px 30px; font-size: 22px;" type="button" value="수정" onclick="update()">
		            </div>
		        </div>
		    </form>
    	</div>
    </div>
        </div>        	
        </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
</body>
</html>