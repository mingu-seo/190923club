<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="spot.SpotVO"%>
<%
//SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo");
String spot_num = (String)request.getAttribute("spot_num");
%>
<script>
/* 	$(function() {
		var color = '#';
		var letters = ['f6c9cc', 'a8c0c0', 'FEBF36', 'FF7238', '6475A0', 'acc7bf', '5e5f67', 'c37070', 'eae160', 'bf7aa3', 'd7d967'];
		 
		color += letters[Math.floor(Math.random()* letters.length)]; 
		document.getElementById('color').style.background = color;
	})
	 */
	

</script> 
 <div class="menu">  
     <ul class="depth1">
      
        <li> <a href="/board/submain/submain.do?spot_num=<%=spot_num%>"><img src="/img/board/house.png"></a></li>
        <li><a href="/board/submain/boardmain.do?spot_num=<%=spot_num%>"><img src="/img/board/files-and-folders.png"></a></li>
        <li> <a href="/calendar/calendarmain.do?spot_num=<%=spot_num%>"><img src="/img/board/events.png"></a> </li>
       	<li> <a href="/member/memberList.do?spot_num=<%=spot_num%>"><img src="/img/board/notebook.png"></a> </li>
   	 	  
   	 </ul>
</div>  