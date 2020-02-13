<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="notice.NoticeVO" %>
<%@ page import ="reply.ReplyVO" %>
<%@ page import ="member.MemberVO" %>
<%@ page import="file.FileVO" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/writing.css"> 
<%
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
NoticeVO nvo = (NoticeVO)request.getAttribute("nvo");
FileVO fv = (FileVO)request.getAttribute("fv");
List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
ReplyVO rVO = (ReplyVO)request.getAttribute("rVO");
MemberVO sessVO = (MemberVO)session.getAttribute("sess");//세션객체
%>

<!-- 삭제 스크립트 -->
<script type="text/javascript">
   function noticeDel(post_id,spot_num, category_id) {
	   if(confirm("삭제하시겠습니까?")) { 
		   location.href="/board/notice/noticeDelete.do?spot_num="+spot_num+"&category_id="+category_id+"&post_id="+post_id;
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
		getReplyList($(".post_id").val());
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
				$("#replyListArea").html(data);
			},
			error:function(data) {
				console.log(data);
			}
		});
	}
	
	//좋아요 ajax
	function likeAjax() { 
	 	$.ajax({
	 		async : false,
	 		url : '/board/likeInsert.do', 
	 		data : {
	 			'post_id' : $(".post_id").val(), 
	 			'board_id' : $(".board_id").val(),
	 			'member_id' : $(".member_id"),val(),
	 			'tableName' : 'notice'
	 		},
	 		dataType :'HTML',
	 		success : function(data) {
	 			if (data.trim() == "0") {
	 				$(".like_cnt").text(Number($(".like_cnt").text())+1);
	 			} else {
	 				$(".like_cnt").text(Number($(".like_cnt").text())-1);
	 			}
	 		},
	 		error:function(data) {
	 			alert("ajax실패")
	 		}
	 	});
	}

   </script>
</head>
<body>


    <div class="wrap">
    	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
       
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
	
		
        	<div class="visualLeft">
        	
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>

        	</div>
        	<div class="visualRight">
        		<div class="board_ctg_name"><%=cate_name.getName() %></div>
        	<div class="view_wrap">
					<div class="view_tt"><%=nvo.getTitle() %>
						<div class="view_info">
							<span>김세영</span>
							<span>|</span> 
							<span><%=nvo.getRegdate() %></span>  
						</div>
					</div>
					<div class="view_file">
						<% if (fv != null) { %>
							<a href="/smarteditor/file_load/file_down.jsp?file_name=<%=fv.getServer_name() %>&orgName=<%=fv.getFront_name()%>"><%=fv.getFront_name()%></a><br>
						<% } %>
					</div>
					<div class="view_ctt">
						<%=nvo.getContents()%> 
					</div>
					
					<div class="view_repl_info">
						<form id="like_form">
							<input type="hidden" name="post_id" value="<%=nvo.getPost_id()%>">
							<input type="hidden" name="board_id" value="<%=nvo.getBoard_id()%>">
							<input type="hidden" name="board_id" value="<%=nvo.getMember_id()%>">
								<span class="view_like" onclick="likeAjax()">❤ </span> 
								<span class="like_cnt"><%=nvo.getLike_cnt() %></span>
						</form> 
						 
						<span>조회</span>
						<span><%=nvo.getView() %></span>  
					</div>		
				
				<div class="repl_box">
					<div id="replyBox">
						<div id="replyListArea">
						
						</div>
						
						<!-- 댓글 폼 -->
						<form action="/board/reply.do?board_id=3" method="post">
								<input type="hidden" name="post_id" class="post_id" value="<%=nvo.getPost_id() %>">
								<input type="hidden" name="board_id" class="board_id" value="<%=nvo.getBoard_id()%>">
								<input type="hidden" name="url" value="board/notice/noticeReplyAjax.do">
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
										'g_id':$("#g_id").val(),
									},
									dataType:'HTML',
									success:function(data) {
										//댓글이 정상적으로 저장되었을때
										$(".replyText").val("");
										getReplyList($(".post_id").val());
									},
									error:function(data) {
										console.log(data);
									}
								});
							}
							
							function replyAjax2(formId) {
								$.ajax({
									async:false,
									url:'/board/replyReply.do',
									method:'POST',
									data: $("#"+formId).serialize(),
									dataType:'HTML',
									success:function(data) {
										//댓글이 정상적으로 저장되었을때
										getReplyList($(".post_id").val());
									}, 
									error:function(data) {
										console.log(data);
									}
								});
							}
						</script>
						  
					</div> 
				</div>
			</div>
			<%
				if(sessVO.getNum()==nvo.getMember_id()) {
			%>
				<input type="button" value="삭제" class="btns" onclick="javascript:noticeDel('<%=nvo.getPost_id()%>','<%=spot_num%>','<%=nvo.getCategory_id()%>');">
				<input type="button" value="수정" class="btns" onclick="location.href='noticeUpdateForm.do?spot_num=<%=spot_num%>&category_id=<%=nvo.getCategory_id()%>&post_id=<%=nvo.getPost_id() %>'">
				<input type="button" value="목록" class="btns" onclick="location.href='noticeList.do?spot_num=<%=spot_num%>&category_id=<%=nvo.getCategory_id() %>'"> 
        	<%
				} else {
        	%>
        		<input type="button" value="목록" class="btns" onclick="location.href='noticeList.do?spot_num=<%=spot_num%>&category_id=<%=nvo.getCategory_id() %>'">
        	<%
				} 
        	%>
        </div>
        
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
  </div>
</body>
</html>