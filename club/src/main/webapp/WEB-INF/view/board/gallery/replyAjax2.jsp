<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function() {
	$(".re_btn").click(function() {
		var idx = $(this).index(".re_btn");
		$(".re_tr").eq(idx).show();
	});
});
</script>


<table id="reply">
<c:forEach var="re" items="${list}">
	<form action="/board/galleryReply.do" method="post">
		<input type="hidden" name="board_id" value="${re.board_id } ">
		<input type="hidden" name="post_id" value="${re.post_id }">
		<input type="hidden" name="reply_num" value="${re.reply_num }">
		<input type="hidden" name="g_id" value="${re.g_id }">
		<input type="hidden" name="g_lev" value="${re.g_lev }">
		<input type="hidden" name="g_seq" value="${re.g_seq }">
		
		<tr> 
			<th class="repl_date">${re.writer }</th>
			<td class="reply-contents">${re.contents }</td>
			<td><a href="#;" class="re_btn">답글</a></td>
			<th class="repl_date">${re.regdate }</th>
			<td><input type="button" class="repl_del" value="삭제"></td>
		</tr>
	</form>
</c:forEach>
</table>

										