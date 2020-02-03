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

	<tr> 
		<th class="repl_date">${re.writer }</th>
		<td class="reply-contents">${re.contents }</td>
		<td><a href="#;" class="re_btn">답글</a></td>
		<th class="repl_date">${re.regdate }</th>
		<td><input type="button" class="repl_del" value="삭제"></td>
	</tr>
	<tr class=re_tr> 
		<td id="dndn">└</td>
		<td colspan="3"><textarea class="re_reply" name="contents"></textarea></td>
		<td><input type="submit" class="repl_btn" value="등록" onclick="replyAjax2();"></td> 
	</tr>
</c:forEach>
</table>

										