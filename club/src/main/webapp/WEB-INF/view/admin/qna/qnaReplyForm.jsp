<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adminQna.AdminQnaVO" %>
<%@ page import="admin.AdminVO" %>  
<%
	AdminVO adminvo = (AdminVO)session.getAttribute("adminsess"); 
	AdminVO admin = (AdminVO)request.getAttribute("admin"); 
	AdminQnaVO article = (AdminQnaVO)request.getAttribute("data");
	AdminQnaVO vo = (AdminQnaVO)request.getAttribute("vo");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents", // textarea ID
		sSkinURI: "/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
});

function save() {
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용을 textarea(id=introduce)에 적용
	$('#frm').submit();
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
					<h2>Q & A - [답변]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="replyProcess.do" enctype="multipart/form-data">
							<input type="hidden" name="page" value="<%=vo.getPage()%>"/>
							<input type="hidden" name="num" value="<%=article.getNum()%>"/>
							<input type="hidden" name="re_ref" value="<%=article.getRe_ref()%>"/>
							<input type="hidden" name="re_lev" value="<%=article.getRe_lev()%>"/>
							<input type="hidden" name="re_seq" value="<%=article.getRe_seq()%>"/>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="subject">*제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="subject" class="w100" title="제목을 입력해주세요" value="Re: <%=article.getSubject()%>"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="admin_name">작성자</label></th>
										<td colspan="10">
											<input type="text" name="admin_name" class="w100" value="<%=adminvo.getName()%>"/>	
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="content">*내용</label></th>
										<td colspan="10">
											<textarea id="contents" name="content" title="내용을 입력해주세요" style="width:100%;"></textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="file">첨부파일</label></th>
										<td colspan="10">
											<input type="file" id="filename_tmp" name="filename_tmp" class="w100" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="qnaList.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" onClick="save();"><strong>저장</strong></a>
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