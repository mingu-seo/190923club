<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	int joinSpotCnt = (Integer)request.getAttribute("joinSpotCnt");
	List<Map> unionList = (List<Map>)request.getAttribute("unionList");
	int listcount = (Integer)request.getAttribute("listcount");
%>
<!DOCTYPE html> 
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/boardmain.css">

   
</head>
<body>

	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>

    <div class="wrap">
       
	<!-- S T A R T :: headerArea-->
	<!-- E N D :: headerArea-->
	<div class="main">
        <%@ include file="menu.jsp" %>

        <div class="visual">
        	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        		
        		<%
        			if(joinSpotCnt==0) {
        		%>
        			<div class="noMemberView"> 
        				<div class="txt">멤버만 게시글을 볼 수 있습니다.<br> SPOT에 가입해 보세요 !</div> 
        			</div>
       			<%
        			} else if(joinSpotCnt ==1){
        				if(unionList.isEmpty()) {
       			%>
       				<div class="unionListEmpty" style="margin:50px 0; font-size: 38px; font-weight: bold;">
       					게시물이 없습니다.
       				</div>
       			<%
        				}else{
        				for (int i=0; i<unionList.size(); i++) {
       			%>
       			<div style="margin:50px 0;">
        		<div class="main_post_div">
        			<div class="main_post_writer">
        				<span>작성자 |</span>
        				<span><%=unionList.get(i).get("writer") %></span>
        			</div>
        			<div class="main_post_info">
        				<span><%=unionList.get(i).get("regdate") %></span>
        			</div>
        			<div class="main_post"> 
        				<% if(!"".equals(unionList.get(i).get("image"))) { //이미지가 있으면%>
        					<img src="/upload/<%= unionList.get(i).get("image")%>" style="max-height: 450px;"><br>
        				<%
        				} else { 
        					if (!"".equals(unionList.get(i).get("image2"))) {//이미지가 없고, 이미지2가 있으면 
        				%>
        					<img src="/upload/<%= unionList.get(i).get("image2") %>" style="max-height: 450px;"><br>
        				<%
        					} else {
        						if(!"".equals(unionList.get(i).get("image3"))) { //이미지2없고, 이미지3있으면
        				%>
							<img src="/upload/<%= unionList.get(i).get("image3") %>" style="max-height: 450px;"><br>
						<%
        						}
        					}
        				}
						%>        					
        					
        				<%=unionList.get(i).get("contents") %>
        			</div>
        		</div> 
        			<div class="main_post_click" style="margin:0 40px; background-color: lightgray; height:40px;">
        				<span><img src="/img/board/like.png" style="max-height: 30px;">&nbsp;좋아요&nbsp;<%=unionList.get(i).get("like_cnt") %> </span>   
        				<span><img src="/img/board/comment.png" style="max-height: 30px;">&nbsp;댓글 </span>
        			</div>
        		</div>
        		
        		<%
        				}
        			}
        		}
        		%>
        		</div>

        		
        	</div>        	
        </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
	</div>
</body>
</html>