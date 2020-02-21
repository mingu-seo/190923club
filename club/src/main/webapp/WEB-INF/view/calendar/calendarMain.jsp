<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="calendar.*" %>
<%@ page import ="java.util.*" %>
<%
List<CalendarVO> calendar_list = (List<CalendarVO>)request.getAttribute("calendar_list");
String yearmonth = (String)request.getAttribute("yearmonth");
int joinSpotCnt = (Integer)request.getAttribute("joinSpotCnt");
%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/board/boardmain.css">
<link rel="stylesheet" type="text/css" href="/css/board/writing.css">
<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %> 
<script>
	function popup(today) { 
		window.open('/calendar/popup.do?spot_num=<%=request.getParameter("spot_num")%>&date='+today, 'window팝업', 'width=500, height=500, left=600, top=400, menubar=no'); 
	};
	
	function detailPopup(num) { 
		window.open('/calendar/popupContents.do?num='+num, 'window팝업', 'width=500, height=500, left=600, top=400, menubar=no');
	}
</script>
<style>
td {
	position:relative; 
}
.dateNumber {
	position: absolute;
    right: 5;
    top: 5;
}
</style>
</head>
<body> 
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %> 
		<!-- E N D :: headerArea--> 
<div class="wrap">
		
			<div class="main">
				<%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
				<div class="visual">
				
        		<%@ include file="/WEB-INF/view/board/submain/submainLeft.jsp" %>
        		
					<!-- 내용 : s -->
						<div class="visualRight">
						
						<%
		        			if(joinSpotCnt==0) {
		        		%>
		        			<div class="noMemberView"> 
		        				<div class="txt">멤버만 게시글을 볼 수 있습니다.<br> SPOT에 가입해 보세요 !</div> 
		        			</div>
		       			<%
		        			} else if(joinSpotCnt ==1){  
		       			%>
		       			
						<div id="bwrite">
							<div class="" style="font-size: 28px;  margin-bottom: 20px;">
								<a href="/calendar/calendarmain.do?spot_num=<%=spot_num%>&yearmonth=${prevMonth}"><img src="/img/right-arrow.png" style="width:30px; height:30px;"></a>
								<%=yearmonth %>
								<a href="/calendar/calendarmain.do?spot_num=<%=spot_num%>&yearmonth=${nextMonth}"><img src="/img/L-arrow.png" style="width:30px; height:30px;"></a>
							</div> 
							<div style="text-align: right; color:red; margin-bottom: 5px;">
								※ 날짜를 선택하시면 일정을 등록할 수 있습니다.
							</div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="calendar_table">
								<colgroup>
									<col width="16%" />
									<col width="14%" />
									<col width="14%" />
									<col width="14%" />
									<col width="14%" />
									<col width="14%" />
									<col width="14%" />
								</colgroup>
								<thead>
									<tr>
										<th class="first sun"><span>일</span></th>
										<th><span>월</span></th>
										<th><span>화</span></th>
										<th><span>수</span></th>
										<th><span>목</span></th>
										<th><span>금</span></th>
										<th class="sat"><span>토</span></th>
									</tr>
								</thead>
								<tbody>
								<%
									if (calendar_list.size() == 0) {
								%>
									<tr>
										<td colspan="30" style="font-size: 30px;">달력이 존재하지 않습니다.</td>
									</tr>
								<%
									} else {
										for (int i=0; i<calendar_list.size(); i++) {
											int name = Integer.parseInt(calendar_list.get(i).getName());	// 요일
											String today = calendar_list.get(i).getToday();	// 날짜
											
											String date = today.substring(8);
											
											if (i == 0 || 1 == name) { 
								%>
									<tr id="calTR">
								<% 
											}
											if (i == 0) {
												for (int j=0; j<name-1; j++) {
								%> 
										<td></td>
								<%
												} 
											}
								%>
										<td>
										<% for (int k=0; k<calendar_list.get(i).getSchedule().size(); k++) { %>
											<div class="scheduleTitle" style="background-color: yellow; margin-bottom: 5px; cursor:pointer;" onclick="detailPopup(<%=calendar_list.get(i).getSchedule().get(k).getNum() %>);">
												<%=calendar_list.get(i).getSchedule().get(k).getTitle() %>
											</div>
										<% } %>
											<span class='dateNumber' style="cursor: pointer;" onclick="popup('<%=today%>');"><%=date%></span>
										</td>
								<%
											if (i == calendar_list.size()-1) {
												for (int k=0; k<7-name; k++) {
								%>
										<td></td>
								<%
												}
											}
								%>
								<%
											if (i == calendar_list.size()-1 || 7 == name) {
								%>
									</tr>
								<%
											}
										}
									}
								%>
								</tbody>
							</table>
						</div>
						
						<%
		        			}
						%>
					</div><!-- visualRight -->
				</div><!-- visual -->
			</div><!-- main -->
</div><!--//wrap -->

</body>
</html>