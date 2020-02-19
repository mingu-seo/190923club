<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function() {
	$(".re_btn").click(function() {
		var idx = $(this).index(".re_btn");
		$(".re_tr").eq(idx).toggle();
	});
	
});
</script>


<table id="reply">
<c:forEach var="re" items="${list}">

	<tr> 
		<th class="repl_date">${re.writer }</th>
		<td class="reply-contents">
		<c:forEach var="cnt" begin="1" end="${re.g_lev }" step="1">
			&nbsp;&nbsp;
		</c:forEach>
			${re.contents }
		</td>
		<td><a href="#;" class="re_btn">답글</a></td>
		<th class="repl_date">${re.regdate }</th>
		<td><input type="button" class="repl_del" id="deleteReply" value="삭제" onclick="deleteReply(${re.reply_num});"></td>
	</tr>
	<tr class=re_tr>
		<td id="dndn">└</td>
		<td colspan="3">
	<form id="form_${re.reply_num}">
	<input type="hidden" name="g_id" value="${re.g_id }">
	<input type="hidden" name="g_lev" value="${re.g_lev }">
	<input type="hidden" name="g_seq" value="${re.g_seq }">
	<input type="hidden" name="post_id" value="${re.post_id }">
	<input type="hidden" name="board_id" value="${re.board_id }"> 
	<input type="hidden" name="member_id" value="${sessionScope.num }">
	<input type="hidden" name="writer" value="${sessionScope.name}">  
	 
		<textarea class="re_reply" name="contents"></textarea>
	</form> 
		</td>
		<td><input type="button" class="repl_btn" value="등록" onclick="replyAjax2('form_${re.reply_num}');"></td>
	</tr>
</c:forEach>
</table>

										