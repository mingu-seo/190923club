<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="board.BoardVO" %>
<%@ page import ="reply.ReplyVO" %>
<%@ page import ="member.MemberVO" %>
<%@ page import="file.FileVO" %>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("list");
ReplyVO rVO = (ReplyVO)request.getAttribute("vo");
MemberVO sessVO = (MemberVO)session.getAttribute("sess");
%>

<script>
	$(function() {
		$(".re_btn").click(function() {
			var idx = $(this).index(".re_btn");
			$(".re_tr").eq(idx).toggle();
		});
	});
</script>

<table id="reply">
			<% 
			for(int i=0; i<list.size(); i++) {  
			%>
			
				<tr id="re_info"> 
					<th class="repl_date">홍길동</th>
					<td>
					<% if (list.get(i).getG_lev() > 0) { %>
					<% for (int j=0; j<list.get(i).getG_lev(); j++) { %>
					&nbsp;&nbsp;
					<% } %>└
					<% } %>
					<%=list.get(i).getContents() %> <a href="#;" class="re_btn">답글</a></td> 
					<th class="repl_date"><%=list.get(i).getRegdate() %></th>
					<td id="repl_del">
						<input type="button" value="삭제" onclick="location.href='/board/replyDelete.do?reply_num=<%=list.get(i).getReply_num() %>&post_id=<%=list.get(i).getPost_id()%>'">
					</td>
				</tr>
				
				
				<tr class="re_tr">
				
					<td id="dndn">└</td>
					<td>
					<form id="replyForm<%=i%>" >
					<input type="hidden" name="board_id" value="<%=rVO.getBoard_id()%>"> 
					<input type="hidden" name="post_id" value="<%=rVO.getPost_id()%>">
					<input type="hidden" name="reply_num" value="<%=list.get(i).getReply_num()%>">
					<input type="hidden" name="member_id" class="member_id" value="<%=sessVO.getNum()%>">
					<input type="hidden" name="writer" class="writer" value="<%=sessVO.getName()%>"> 
					<input type="hidden" name="g_id" id="g_id" value="<%=list.get(i).getG_id()%>">
					<input type="hidden" name="g_lev" id="g_lev" value="<%=list.get(i).getG_lev()%>">
					<input type="hidden" name="g_seq" id="g_seq" value="<%=list.get(i).getG_seq()%>">
						<textarea class="re_reply" name="contents"></textarea>
					</form>
					</td>
					<td> 
						<input type="button" class="repl_btn" value="등록" onclick="replyAjax2('replyForm<%=i%>');"> 
					</td>
				</tr>
			
			<%
			}
			%>
		</table>
