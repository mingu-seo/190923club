<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="spot.SpotVO"%>
<%
SpotVO list = (SpotVO)request.getAttribute("spot_vo");
%>
<div class="visualLeft">
        	<input type="hidden" name="num" value="<%=list.getNum()%>">
        	<div class="visualLeftInner">
        		<div>
        			<!--<br><br>동아리 소개 사진  -->
	        		<img id="clubImage" src="/upload/images/<%=list.getFile()%>"><br>
		        		<div id="clubName">
			        		<%=list.getName()%>
			        	</div>
			        	<div class="clubInfo">
			        		멤버 00명<br>
			        		회장 홍길동
			        	</div>
        		</div>
        		<div class="clubIntro">
					<%=list.getContent() %>
        		</div> 
        		
        		<div class="clubInfo">
        			<a href="/spotJoin/spotJoinForm.do?spot_num=<%=list.getNum()%>">가입신청</a>
        		</div>
        		<div class="clubInfo">
        			동아리 설정
        		<a href="/spot/spotSetting.do?spot_num=<%=list.getNum()%>"><img src="/img/board/set.png"></a>
        		</div>
        	</div>
        	</div>
