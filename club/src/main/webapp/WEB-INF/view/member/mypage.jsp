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
<script>
function update() {		// 수정 버튼
	if ($("#name").val().trim() == "") {
		alert("이름을 입력해 주세요");
		$("#name").focus();
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
</script>
</head>
<body>
    <div class="wrap">
       
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
	<!-- E N D :: headerArea-->
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="/WEB-INF/view/member/mypageLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
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
	                                <select name="birth">
	                                    <option value="2002" <%=vo.getBirth().split(",")[0].equals("2002") ? "selected" : "" %>>2002</option>
	                                    <option value="2003" <%=vo.getBirth().split(",")[0].equals("2003") ? "selected" : "" %>>2003</option>
	                                    <option value="2004" <%=vo.getBirth().split(",")[0].equals("2004") ? "selected" : "" %>>2004</option>
	                                </select>
	 								년
	                                <select name="birth">
	                                    <option value="1" <%=vo.getBirth().split(",")[1].equals("1") ? "selected" : "" %>>1</option>
	                                    <option value="2" <%=vo.getBirth().split(",")[1].equals("2") ? "selected" : "" %>>2</option>
	                                    <option value="3" <%=vo.getBirth().split(",")[1].equals("3") ? "selected" : "" %>>3</option>
	                                    <option value="4" <%=vo.getBirth().split(",")[1].equals("4") ? "selected" : "" %>>4</option>
	                                    <option value="5" <%=vo.getBirth().split(",")[1].equals("5") ? "selected" : "" %>>5</option>
	                                    <option value="6" <%=vo.getBirth().split(",")[1].equals("6") ? "selected" : "" %>>6</option>
	                                    <option value="7" <%=vo.getBirth().split(",")[1].equals("7") ? "selected" : "" %>>7</option>
	                                    <option value="8" <%=vo.getBirth().split(",")[1].equals("8") ? "selected" : "" %>>8</option>
	                                    <option value="9" <%=vo.getBirth().split(",")[1].equals("9") ? "selected" : "" %>>9</option>
	                                    <option value="10" <%=vo.getBirth().split(",")[1].equals("10") ? "selected" : "" %>>10</option>
	                                    <option value="11" <%=vo.getBirth().split(",")[1].equals("11") ? "selected" : "" %>>11</option>
	                                    <option value="12" <%=vo.getBirth().split(",")[1].equals("12") ? "selected" : "" %>>12</option>
	                                </select>
	                               	 월
	                                <select name="birth">
	                                    <option value="1" <%=vo.getBirth().split(",")[2].equals("1") ? "selected" : "" %>>1</option>
	                                    <option value="2" <%=vo.getBirth().split(",")[2].equals("2") ? "selected" : "" %>>2</option>
	                                    <option value="3" <%=vo.getBirth().split(",")[2].equals("3") ? "selected" : "" %>>3</option>
	                                    <option value="4" <%=vo.getBirth().split(",")[2].equals("4") ? "selected" : "" %>>4</option>
	                                    <option value="5" <%=vo.getBirth().split(",")[2].equals("5") ? "selected" : "" %>>5</option>
	                                    <option value="6" <%=vo.getBirth().split(",")[2].equals("6") ? "selected" : "" %>>6</option>
	                                    <option value="7" <%=vo.getBirth().split(",")[2].equals("7") ? "selected" : "" %>>7</option>
	                                    <option value="8" <%=vo.getBirth().split(",")[2].equals("8") ? "selected" : "" %>>8</option>
	                                    <option value="9" <%=vo.getBirth().split(",")[2].equals("9") ? "selected" : "" %>>9</option>
	                                    <option value="10" <%=vo.getBirth().split(",")[2].equals("10") ? "selected" : "" %>>10</option>
	                                    <option value="11" <%=vo.getBirth().split(",")[2].equals("11") ? "selected" : "" %>>11</option>
	                                    <option value="12" <%=vo.getBirth().split(",")[2].equals("12") ? "selected" : "" %>>12</option>
	                                    <option value="13" <%=vo.getBirth().split(",")[2].equals("13") ? "selected" : "" %>>13</option>
	                                    <option value="14" <%=vo.getBirth().split(",")[2].equals("14") ? "selected" : "" %>>14</option>
	                                    <option value="15" <%=vo.getBirth().split(",")[2].equals("15") ? "selected" : "" %>>15</option>
	                                    <option value="16" <%=vo.getBirth().split(",")[2].equals("16") ? "selected" : "" %>>16</option>
	                                    <option value="17" <%=vo.getBirth().split(",")[2].equals("17") ? "selected" : "" %>>17</option>
	                                    <option value="18" <%=vo.getBirth().split(",")[2].equals("18") ? "selected" : "" %>>18</option>
	                                    <option value="19" <%=vo.getBirth().split(",")[2].equals("19") ? "selected" : "" %>>19</option>
	                                    <option value="20" <%=vo.getBirth().split(",")[2].equals("20") ? "selected" : "" %>>20</option>
	                                    <option value="21" <%=vo.getBirth().split(",")[2].equals("21") ? "selected" : "" %>>21</option>
	                                    <option value="22" <%=vo.getBirth().split(",")[2].equals("22") ? "selected" : "" %>>22</option>
	                                    <option value="23" <%=vo.getBirth().split(",")[2].equals("23") ? "selected" : "" %>>23</option>
	                                    <option value="24" <%=vo.getBirth().split(",")[2].equals("24") ? "selected" : "" %>>24</option>
	                                    <option value="25" <%=vo.getBirth().split(",")[2].equals("25") ? "selected" : "" %>>25</option>
	                                    <option value="26" <%=vo.getBirth().split(",")[2].equals("26") ? "selected" : "" %>>26</option>
	                                    <option value="27" <%=vo.getBirth().split(",")[2].equals("27") ? "selected" : "" %>>27</option>
	                                    <option value="28" <%=vo.getBirth().split(",")[2].equals("28") ? "selected" : "" %>>28</option>
	                                    <option value="29" <%=vo.getBirth().split(",")[2].equals("29") ? "selected" : "" %>>29</option>
	                                    <option value="30" <%=vo.getBirth().split(",")[2].equals("30") ? "selected" : "" %>>30</option>
	                                    <option value="31" <%=vo.getBirth().split(",")[2].equals("31") ? "selected" : "" %>>31</option>
	                                </select>
	                     			일
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