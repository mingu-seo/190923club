<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="spot.SpotVO"%>
<%
//SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo");
String spot_num = (String)request.getAttribute("spot_num");
%>
 <div class="menu">
     <ul class="depth1">
     
        <li> <a href="/board/submain/submain.do?spot_num=<%=spot_num%>"><img src="/img/board/main.png"></a></li>
        <li><a href="/board/submain/boardmain.do?spot_num=<%=spot_num%>"><img src="/img/board/board.png"></a></li>
        <li> <a href=""><img src="/img/board/calendar.png"></a>
       	<li> <a href="/member/memberList.do?spot_num=<%=spot_num%>"><img src="/img/board/address.png"></a>
   	 	  
   	 </ul>
</div>  