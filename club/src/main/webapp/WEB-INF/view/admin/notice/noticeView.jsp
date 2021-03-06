<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adminNotice.AdminNoticeVO"%>
<%@ page import="util.Page"%>
<%
	AdminNoticeVO list = (AdminNoticeVO)request.getAttribute("list");
	String nowPage = (String)request.getAttribute("nowPage");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function updateConfirm() {
	if (confirm("수정하시겠습니까?")) {
		location.href='noticeUpdateForm.do?num=<%=list.getNum()%>&page=<%=nowPage%>';
	}
}
function deleteConfirm() {
	if (confirm("삭제하시겠습니까?")) {
		location.href='noticeDelete.do?num=<%=list.getNum() %>&page=<%=nowPage%>';
	}
}

</script>
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
					<h2>공지사항 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="subject">제목</label></th>
										<td colspan="10">
											<%=list.getSubject()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="subject">작성자</label></th>
										<td colspan="10">
											<%=list.getAdmin_name()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="content">내용</label></th>
										<td colspan="10">
											<%=list.getContent() %>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="file">첨부파일</label></th>
										<td colspan="10">
												<div class="weidtFile">
													<p><a href="notice/file_down.jsp?file=<%=list.getFile()%>" target="_blank"><%=list.getFile() %></a><br />
												</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="noticeList.do?page=<%=nowPage%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" onclick="updateConfirm();"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" onclick="deleteConfirm();"><strong>삭제</strong></a>
				
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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