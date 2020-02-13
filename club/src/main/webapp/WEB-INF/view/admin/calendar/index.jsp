<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="test.*" %>
<%@ page import ="java.util.*" %>
<%
List<TestVO> list = (List<TestVO>)request.getAttribute("list");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<style>
	.calendar_table{position:relative; width:100%; height:100%; border-top:#255182 1px solid; color:#53728b; margin:0 0 10px 0;}
	.calendar_table .first{background:none;}
	.calendar_table thead th{padding:5px; text-align:center; background:#e9e9e9; border-bottom:1px solid #bec0c4;}
	.calendar_table thead th.sun{background:#ffe7e5; color:#ff4836;}
	.calendar_table thead th.sat{background:#e2f0ff url(/manage/img/blist_td_line.gif) repeat-y left top; color:#1559aa;}
	
	.calendar_table tbody td.first{background-image:none !important; color:#ff4836;}
	.calendar_table tbody td{padding:5px; text-align:center; background:url(/manage/img/blist_td_line.gif) repeat-y left top; }
	.calendar_table tbody td.care{padding:5px; text-align:center; background:#d9f3d5 url(/manage/img/blist_td_line.gif) repeat-y left top;}
	.calendar_table tbody td.choice{padding:5px; text-align:center; background:#cee8fe url(/manage/img/blist_td_line.gif) repeat-y left top;}
	.calendar_table tbody td.sat{color:#1559aa;}
</style>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>달력</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
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
									if (list.size() == 0) {
								%>
									<tr>
										<td>달력이 존재하지 않습니다.</td>
									</tr>
								<%
									} else {
										for (int i=0; i<list.size(); i++) {
											int name = Integer.parseInt(list.get(i).getName());	// 요일
											String today = list.get(i).getToday();	// 날짜
											
											String date = "<span>"+today.substring(8)+"</span>";
											
											if (i == 0 || 1 == name) { 
								%>
									<tr>
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
										<td><%=date%></td>
								<%
											if (i == list.size()-1) {
												for (int k=0; k<7-name; k++) {
								%>
										<td></td>
								<%
												}
											}
								%>
								<%
											if (i == list.size()-1 || 7 == name) {
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
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>