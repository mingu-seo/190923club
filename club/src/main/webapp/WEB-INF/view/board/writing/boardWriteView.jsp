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

//댓글 리스트가져오는거
List<ReplyVO> rList = (List<ReplyVO>)request.getAttribute("rList");
%>				


<!DOCTYPE html>
<html>
<head>
<!-- 삭제 스크립트 -->
<script type="text/javascript">
   function writingDel(post_id) {
	   if(confirm("삭제하시겠습니까?")) { 
		   location.href="/board/writing/boardDelete.do?post_id="+post_id;
	   } else
		   return false;
		   
   }
</script>
<meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css"> 

   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
  

</head>
<body>
 


    <div class="wrap">
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/user/include/top.jsp" %>
	<!-- E N D :: headerArea-->
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
					
					<div class="view_ctt">
						<%=vo.getContents() %>
					</div>
					
					<div class="view_repl_info">
						<span class="view_like">❤︎ 좋아요</span>
						<span>35</span> 
						<span>조회</span>
						<span>11</span>  
					</div>		
				
				<div class="repl_box">
					<div id="replyBox">
						<table id="reply">
								<% 
								for(int i=0; i<rList.size(); i++) {
								%>
									<tr id="re_info"> 
										<th class="repl_date">홍길동</th>
										<td>
										<% if(rList.get(i).getG_lev() > 0) {%>
										<% for(int j=0; j<rList.get(i).getG_lev(); j++) {%>
										&nbsp;&nbsp;
										<% }%>└
										<% }%>
										<%=rList.get(i).getContents() %> <a href="#;" class="re_btn">답글</a></td>
										<th class="repl_date"><%=rList.get(i).getRegdate() %></th>
										<td id="repl_del">
											<input type="button" value="삭제" onclick="location.href='/board/replyDelete.do?reply_num=<%=rList.get(i).getReply_num() %>&post_id=<%=rList.get(i).getPost_id()%>'">
										</td>
									</tr>
									
									<form action="/board/replyReply.do" method="post">
										<input type="hidden" name="board_id" value="<%=vo.getBoard_id()%>">
										<input type="hidden" name="post_id" value="<%=vo.getPost_id()%>">
										<input type="hidden" name="reply_num" value="<%=rList.get(i).getReply_num()%>">
										<input type="hidden" name="g_id" value="<%=rList.get(i).getG_id()%>">
										<input type="hidden" name="g_lev" value="<%=rList.get(i).getG_lev()%>">
										<input type="hidden" name="g_seq" value="<%=rList.get(i).getG_seq()%>"> 
									<table>
										<tr class="re_tr">
											<td id="dndn">└</td>
											<td>
												<textarea class="re_reply" name="contents"></textarea>
											</td>
											<td> 
												<input type="submit" class="repl_btn" value="등록" > 
											</td>
										</tr>
										</table>
									</form>
								<%
								}
								%>
							</table>
							
							<!-- 댓글 폼 -->
							<form action="/board/reply.do?board_id=2" method="post">
									<input type="hidden" name="post_id" value="<%=vo.getPost_id()%>">
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
			<input type="button" value="삭제" class="btns" onclick="javascript:writingDel('');">
			<input type="button" value="목록" class="btns" onclick="location.href='boardList.do'"> 
        </div>
        
        
    </div>
    <%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
</div>
</body>
</html>