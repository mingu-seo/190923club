<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.HashMap" %>
<%@ page import ="board.BoardVO" %>
<%@ page import ="reply.ReplyVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardVO vo = (BoardVO)request.getAttribute("vo");
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");

//댓글 리스트가져오는거
List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
ReplyVO rVO = (ReplyVO)request.getAttribute("rVO");

%>				


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css"> 

   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
  
	<!-- 삭제 스크립트 -->
<script type="text/javascript">
   function writingDel(post_id, spot_num, category_id) {
	   if(confirm("삭제하시겠습니까?")) { 
		   location.href="/board/writing/boardDelete.do?spot_num="+spot_num+"&category_id="+category_id+"&post_id="+post_id;
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
				'board_id': 2
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
	function likeAjax(id) {
		$.ajax({
			async : false,
			url : '/board/likeInsert.do',
			data : {
				'post_id': id,
				'board_id': 2,
				'member_id':9,
				'tableName':'writing'
			},
			dataType:'HTML',
			success: function(data) {
				//include return.jsp에서 받아온 값이 data
				if(data.trim() == "0") {
					$(".like_cnt").text(Number($(".like_cnt").text())+1); 
				} else {
					$(".like_cnt").text(Number($(".like_cnt").text())-1); 
				}
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
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
    <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
        <div class="visual">
	
        	<div class="visualLeft">
        	<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	<div class="visualRight">
        		<div class="board_ctg_name"><%=cate_name.getName() %></div>
        	<div class="view_wrap">
					<div class="view_tt"><%=vo.getTitle() %>
						<div class="view_info">
							<span>김세영</span>
							<span>|</span> 
							<span><%=vo.getRegdate() %></span>
						</div>
					</div>
					
					<div class="view_ctt">
						<%=vo.getContents() %>
					</div>
					
					<div class="view_repl_info">
						<form id="like_form">
							<input type="hidden" name="post_id" value="<%=vo.getPost_id()%>">
							<input type="hidden" name="board_id" value="<%=vo.getBoard_id()%>">
								<span class="view_like" onclick="likeAjax();">❤ </span> 
								<span class="like_cnt"><%=vo.getLike_cnt() %></span>
						</form>
						 
						<span>조회</span>
						<span><%=vo.getView() %></span>  
					</div>		
				
				<div class="repl_box">
					<div id="replyBox">
						<div id="replyListArea">
						
						</div>
							
							<!-- 댓글 폼 -->
							<form action="/board/reply.do?board_id=2" method="post">
									<input type="hidden" name="post_id" class="post_id" value="<%=vo.getPost_id()%>">
									<input type="hidden" name="board_id" class="board_id" value="<%=vo.getBoard_id()%>">
									<input type="hidden" name="url" value="board/writing/writingReplyAjax.do">
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
			<input type="button" value="삭제" class="btns" onclick="javascript:writingDel('<%=vo.getPost_id()%>','<%=spot_num%>','<%=vo.getCategory_id()%>');">
			<input type="button" value="수정" class="btns" onclick="location.href='/board/writing/boardUpdateForm.do?spot_num=<%=spot_num%>&category_id=<%=vo.getCategory_id() %>&post_id=<%=vo.getPost_id()%>'"> 
			<input type="button" value="목록" class="btns" onclick="location.href='boardList.do?spot_num=<%=spot_num%>&category_id=<%=vo.getCategory_id()%>'">  
        </div>
         
        
    </div>
    <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
</div>
</body>
</html>