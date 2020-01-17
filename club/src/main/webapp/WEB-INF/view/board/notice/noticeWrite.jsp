<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	<!-- 오른쪽 contents -->
        	<div class="visualRight">
        		<div class="board_ctg_name">공지사항 목록</div>
        		
        		<div>
				<form action="boardInsert.do" method="post" name="writeForm" enctype="multipart/form-data" onsubmit="save();">
					<table id="boardTable">
												
						<tr>		
							<th>제목</th>
								<td class="writing_box">
									<input type="text" name="title" class="tableRight">
								</td>
						</tr>
						
						<tr>		
							<td colspan="2">
								<textarea name="contents" id="contents"></textarea>
							</td>
						</tr>
					</table>
						
						<div class="writing_btns">
							<input type="submit" value="작성완료" class="btns">
							<input type="reset" value="다시 작성" class="btns"/>
							<input type="button" value="목록" class="btns">
						</div>
				</form>
			</div>
        </div>
        
        
    </div>
    <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
  </div>
</body>
</html>