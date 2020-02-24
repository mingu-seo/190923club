<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% 
MemberVO vo = (MemberVO)session.getAttribute("sess");
List<Map> writtenList = (List<Map>)request.getAttribute("list");
int totalpage = (int)request.getAttribute("totalpage");
int totalcount = (int)request.getAttribute("totalcount");
MemberVO searchvo = (MemberVO)request.getAttribute("searchvo");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
<link rel="stylesheet" href="/css/test/mypage.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/test/board.css"> 
<link rel="stylesheet" href="/css/test/memberList.css">
</head>
<body>
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->  
    <div class="wrap">
        <div class="visual">
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="mypageLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	<div class="visualRight">
	        	<div class="content">
	        		<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
			                <colgroup>
			                    <col style="width:15%;" />
			                    <col class=""/>
			                    <col style="width:10%;" />
			                    <col style="width:8%;" />
			                    <col style="width:8%;" />
			                </colgroup>
			                <thead>
			                    <tr class="tableTitle">
			                        <th scope="col">SPOT</th> 
			                        <th scope="col">제목</th> 
			                        <th scope="col">작성일</th> 
			                        <th scope="col">조회수</th> 
			                        <th scope="col" class="last">좋아요</th>
			                    </tr>
			                </thead>
			                <tbody>
			                <%
			                for (int i = 0; i<writtenList.size(); i++) {
			                	Map map = writtenList.get(i);
			                %>
			                    <tr class="listCss">
			                        <td><%=map.get("spot_name")%></td>
			                        <td style="text-align:left;padding-left:5px;"><%=map.get("title") %></td>
			                        <td><%=String.valueOf(map.get("regdate")).substring(0,10) %></td>
			                        <td><%=map.get("view") %></td>
			                        <td class="last"><%=map.get("like_cnt") %></td>
			                    </tr>
			                 <%
			                }
			                 %>
			                </tbody>
			            </table>
			            <div class='page'>
							<%=util.Page.getMemberPageList(vo.getPage(), totalpage, "mypageWritten.do?searchword="+vo.getSearchword()+"&stype="+vo.getStype()) %>
						</div> 
	        	</div>
        		
    		</div>       	
        </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
</body>
</html>