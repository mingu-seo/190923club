<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="calendar.*" %>
<%@ page import ="java.util.*" %>
<%
List<CalendarVO> calendar_list = (List<CalendarVO>)request.getAttribute("calendar_list");
CalendarVO calVO = (CalendarVO)request.getAttribute("calVO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/board/writing.css">
<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %> 
</head>
<body> 
<div class="wrap">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %> 
		<!-- E N D :: headerArea--> 
		
			<div class="main">
				<%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
				<div class="visual">
				
        		<%@ include file="/WEB-INF/view/board/submain/submainLeft.jsp" %>
        		
					<!-- 내용 : s -->
						<div class="visualRight">
						<div id="bwrite">
							<h3>달력</h3>
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
										<td>달력이 존재하지 않습니다.</td>
									</tr>
								<%
									} else {
										for (int i=0; i<calendar_list.size(); i++) {
											int name = Integer.parseInt(calendar_list.get(i).getName());	// 요일
											String today = calendar_list.get(i).getToday();	// 날짜
											
											String date = "<span>"+today.substring(8)+"</span>";
											
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
											<%=date%>
											<div class="calBtn" style="padding:5px 0;">
												<input type="button" class="calPop" value="일정 등록" onclick="popup('<%=today%>');">
											</div>
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
<script>
	function popup(today) {
		window.open('/calendar/popup.do?spot_num=<%=spot_num%>&date='+today, 'window팝업', 'width=500, height=500, left=600, top=400, menubar=no');
	}
</script>
						</div>
					</div><!-- visualRight -->
				</div><!-- visual --> 
			</div><!-- main -->
</div><!--//wrap -->

</body>
</html>