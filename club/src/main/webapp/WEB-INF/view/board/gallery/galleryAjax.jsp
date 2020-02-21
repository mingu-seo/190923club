<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("aaa", "\r\n"); %>
{
"contents" : "${fn:replace(vo.contents, aaa, "nl")}",
"title" : "${vo.title}",
"regdate" : "${vo.regdate}",
"image" : "${vo.image}",
"image2" : "${vo.image2}",
"image3" : "${vo.image3}",
"post_id" : "${vo.post_id}",
"board_id" : "${vo.board_id}",
"view" : "${vo.view}",
"search_word" : "${vo.search_word}",
"like_cnt" : "${vo.like_cnt}",
"writer" : "${vo.writer}",
"member_id" : "${vo.member_id}"
}