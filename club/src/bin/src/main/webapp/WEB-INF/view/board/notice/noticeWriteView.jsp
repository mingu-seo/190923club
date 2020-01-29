<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="notice.NoticeVO" %>
<%@ page import ="reply.ReplyVO" %>
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
			$(".re_tr").eq(idx).show();
		});
	});

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
						<%=vo.getFile() %>
					</div>
					<div class="view_ctt">
						<%=vo.getContents() %>
					</div>
					
					<div class="view_repl_info">
						<span class="view_like">♥</span>
						<span>이 글을 N명이 좋아합니다.</span>
					</div>		
				
				<div class="repl_box">
					<div id="replyBox">
						
							<table id="reply">
								<%
								for(int i=0; i<rList.size(); i++) {  
								%>
									<tr id="re_info"> 
										<th class="repl_date">홍길동</th>
										<td><%=rList.get(i).getContents() %> <a href="#;" class="re_btn">답글</a></td>
										<th class="repl_date"><%=rList.get(i).getRegdate() %></th>
										<td id="repl_del"><input type="button" value="수정"></td>
										<td id="repl_del"><input type="button" value="삭제"></td>
									</tr>
										<form action="/board/reply.do" method="post">
										<input type="hidden" name="board_id" value="<%=vo.getBoard_id()%>">
										<input type="hidden" name="post_id" value="<%=vo.getPost_id()%>">
										<input type="hidden" name="reply_num" value="<%=rList.get(i).getReply_num()%>">
										<input type="hidden" name="g_id" value="<%=rList.get(i).getG_id()%>">
										<input type="hidden" name="g_lev" value="<%=rList.get(i).getG_lev()%>">
										<input type="hidden" name="g_seq" value="<%=rList.get(i).getG_seq()%>">
										<tr class="re_tr">
											<td id="dndn">└</td>
											<td>
												<textarea class="re_reply" name="contents"></textarea>
											</td>
											<td> 
												<input type="submit" class="repl_btn" value="등록" > 
											</td>
										</tr>
									</form>
								<%
								}
								%>
							</table>
						
						
						<!-- 댓글 폼 -->
						<form action="/board/reply.do?board_id=3" method="post">
								<input type="hidden" name="post_id" value="<%=vo.getPost_id() %>">
								<input type="hidden" name="board_id" value="<%=vo.getBoard_id()%>">
							<table>
								<tr>
									<td class="repForm">   
										<textarea class="replyText" name="contents"></textarea>
									</td>
									<td class="repForm_sub"> 
										<input type="submit" class="repl_btn" value="등록"> 
									</td>
								</tr>
							</table>
						</form> 
						  
					</div> 
				</div>
			</div>
			  
			<input type="button" value="삭제" class="btns" onclick="javascript:noticeDel('<%=vo.getPost_id()%>');">
			<input type="button" value="수정" class="btns" onclick="location.href='noticeUpdateForm.do?post_id=<%=vo.getPost_id() %>'">
			<input type="button" value="목록" class="btns" onclick="location.href='noticeList.do?board_id=3'"> 
        
        </div>
        
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
  </div>
</body>
</html>