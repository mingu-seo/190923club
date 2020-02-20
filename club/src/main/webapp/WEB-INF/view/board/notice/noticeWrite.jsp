<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="notice.NoticeVO" %>
<%@ page import ="member.MemberVO" %>
<%@ page import ="file.FileVO" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
FileVO fv = (FileVO)request.getAttribute("fv");
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
MemberVO sessVO = (MemberVO)session.getAttribute("sess");//세션객체
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
  	<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"></script>
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
				
				function save(){
					oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);//에디터의 내용을 textarea(id-content)에 적용
				}
				
				function check() {
					if($("#title").val().trim()=="") {
						alert("제목을 입력해 주세요.")
						$("#title").focus();
						return false;
					}
					if($("#file_tmp").val()=="") {
						alert("파일을 선택해 주세요.")
						$("#file_tmp").focus();
						return false;
					}
					oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
					if($("#contents").val().trim()=="" || $("#contents").val() == "<p>&nbsp;</p>") {
						alert("내용을 입력해 주세요.")
						oEditors.getById["contents"].exec("FOCUS"); 
						return false;
					}
					$("#writeForm").submit();
				}
				</script>


</head>
<body>


	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
    <div class="wrap">
	<div class="main">
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
			<!-- 왼쪽메뉴 -->
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	<!-- 오른쪽 contents -->
        	<div class="visualRight">
        		<div class="board_ctg_name"><%=cate_name.getName() %></div>
        		
        		<div>
				<form action="noticeInsert.do" method="post" name="writeForm" id="writeForm" enctype="multipart/form-data" onsubmit="save();">
					<input type="hidden" name="member_id" value="<%=sessVO.getNum()%>">  
					<input type="hidden" name="writer" value="<%=sessVO.getName()%>"> 
					<input type="hidden" name="category_id" value="<%=vo.getCategory_id()%>">
					<input type="hidden" name="spot_num" value="<%=spot_num %>">
					<table id="boardTable">
												
						<tr>		
							<th>제목</th>
								<td class="writing_box">
									<input type="text" name="title" id="title" class="tableRight">
								</td>
						</tr>
						
						
						<tr>		
							<th>첨부파일</th>
								<td class="writing_box">
									<input type="file" name="file_tmp" id="file_tmp">
								</td>
						</tr>
						
						<tr>		
							<td colspan="2">
								<textarea name="contents" id="contents"></textarea>
							</td>
						</tr>
					</table>
						
						<div class="writing_btns">
							<input type="button" value="작성완료" class="btns" onclick="check();">
							<input type="reset" value="다시 작성" class="btns"/>
							<input type="button" value="목록" class="btns" onclick="location.href='noticeList.do?spot_num=<%=spot_num%>&category_id=<%=vo.getCategory_id()%>'">
						</div>
				</form>
			</div>
        </div>
        
        
    </div>
    </div>
    <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
  </div>
</body>
</html>