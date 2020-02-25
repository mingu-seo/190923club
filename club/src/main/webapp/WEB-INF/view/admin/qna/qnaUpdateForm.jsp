<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.AdminVO" %>  
<%
	AdminVO adminvo = (AdminVO)session.getAttribute("adminsess"); 
	AdminVO admin = (AdminVO)request.getAttribute("admin"); 
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
	if ($("#subject").val().trim() == ""){
		alert("제목 입력해 주세요");
		$("#subject").focus();
		return false;
	}
	
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용을 textarea(id=introduce)에 적용
	if ($("#contents").val().trim() == "" || $("#contents").val() == "<p>&nbsp;</p>") {
		alert("내용 입력해 주세요");
		oEditors.getById["contents"].exec("FOCUS");
		return false;
	}	
	$('#frm').submit();
}
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.html('<img src="' + e.target.result + '" class="listImg" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
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
					<h2>F A Q - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="qnaUpdate.do" enctype="multipart/form-data">
							<input type="hidden" name="num" value="${vo.num}">
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
											<input type="text" id="subject" name="subject" class="w100" title="제목을 입력해주세요" value="${vo.subject}"/>	
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
											<textarea id="contents" name="content" title="내용을 입력해주세요" style="width:100%;" >${vo.content}</textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="file">첨부파일</label></th>
										<td colspan="10">
											<input type="file" id="filename_tmp" name="filename_tmp" class="w100"onchange="getThumbnailPrivew(this,$('#thumb_img1'));" value="${vo.file }"/>	
											<div id="thumb_img1" onfocus="this.value='';">사진을 올려보세요</div>
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
									<a class="btns" style="cursor:pointer;" onClick="save();"><strong>수정완료</strong></a>
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