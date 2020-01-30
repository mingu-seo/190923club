<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="notice.NoticeVO" %>
<%@ page import ="reply.ReplyVO" %>
<%@ page import="file.FileVO" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String filename1=request.getParameter("filename1");
	String filename2=request.getParameter("filename2");
	String origfilename1=request.getParameter("origfilename1");
	String origfilename2=request.getParameter("origfilename2");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/writing.css"> 
<%
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
ReplyVO rVO = (ReplyVO)request.getAttribute("rVO");
%>

<!-- 삭제 스크립트 -->
<script type="text/javascript">
   function noticeDel(post_id) {
	   if(confirm("삭제하시겠습니까?")) { 
		   location.href="/board/notice/noticeDelete.do?post_id="+post_id;
	   } else
		   return false;
		   
   }
   
   function replDel(reply_num) {
		if(confirm("삭제하시겠습니까?")) {
			location.href="/board/replyDelete.do?reply_num="+reply_num;
		} else
			return false;
   }
   
	$(function() {
		$(".re_btn").click(function() {
			var idx = $(this).index(".re_btn");
			$(".re_tr").eq(idx).toggle();
		});
	});
	
	//댓글 리스트 ajax 
	function getReplyList(id) {
		$.ajax({
			async : false,
			url : '/board/replyListAjax.do',
			data : {
				'post_id': id,
				'board_id': 3
			},
			dataType:'HTML',
			success: function(data) {
				console.log(data);
				$("#replyListArea").html(data);
			},
			error:function(data) {
				console.log(data);
			}
		});
	}

   </script>
</head>
<body>


    <div class="wrap">
    	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
       
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>

        	</div>
        	<div class="visualRight">
        		<div class="board_ctg_name">게시판 목록</div>
        	<div class="view_wrap">
					<div class="view_tt"><%=vo.getTitle() %>
						<div class="view_info">
							<span>김세영</span>
							<span>|</span> 
							<span><%=vo.getRegdate() %></span>
						</div>
					</div>
					<div class="view_file">
						<a href="file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %>
						<%=origfilename1 %></a><br>
					</div>
					<div class="view_ctt">
						<%=vo.getContents() %>
					</div>
					
					<div class="view_repl_info">
						<span class="view_like">❤︎ 좋아요</span>
						<span>35</span> 
						<span>조회</span>
						<span><%=vo.getView() %></span>  
					</div>		
				
				<div class="repl_box">
					<div id="replyBox">
						<div id="replyListArea">
						
						</div>
						
						<!-- 댓글 폼 -->
						<form action="/board/reply.do?board_id=3" method="post">
								<input type="hidden" name="post_id" class="post_id" value="<%=vo.getPost_id() %>">
								<input type="hidden" name="board_id" class="board_id" value="<%=vo.getBoard_id()%>">
							<table>
								<tr>
									<td class="repForm">   
										<textarea class="replyText" name="contents"></textarea>
									</td>
									<td class="repForm_sub"> 
										<input type="button" class="repl_btn" value="등록" onclick="replyAjax()"> 
									</td>
								</tr>
							</table>
						</form>
						
						<script>
							function replyAjax() {
								$.ajax({
									async:false,
									url:'/board/reply.do',
									data: {
										'post_id':$(".post_id").val(),
										'board_id':$(".board_id").val(),
										'contents':$(".replyText").val(),
									},
									dataType:'HTML',
									success:function(data) {
										//댓글이 정상적으로 저장되었을때
										$(".replyText").val("");
										getReplyList($(".post_id").val());
									},
									error:function(date) {
										console.log(data);
									}
								});
							}
							
							function replyAjax2() {
								$.ajax({
									async:false,
									url:'/board/reply.do',
									data: {
										'post_id':$(".post_id").val(),
										'board_id':$(".board_id").val(),
										'contents':$(".replyText").val(),
									},
									dataType:'HTML',
									success:function(data) {
										//댓글이 정상적으로 저장되었을때
										$(".replyText").val("");
										
										getReplyList($(".post_id").val());
									}, 
									error:function(date) {
										console.log(data);
									}
								});
							}
						</script>
						  
					</div> 
				</div>
			</div>
			  
			<input type="button" value="삭제" class="btns" onclick="javascript:noticeDel('<%=vo.getPost_id()%>');">
			<input type="button" value="수정" class="btns" onclick="location.href='noticeUpdateForm.do?board_id=3&post_id=<%=vo.getPost_id() %>'">
			<input type="button" value="목록" class="btns" onclick="location.href='noticeList.do?board_id=3'"> 
        
        </div>
        
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
  </div>
</body>
</html>