<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spotCategory.SpotCategoryVO" %>
<%@ page import="spot.SpotVO" %>
<%@ page import="java.util.List" %>
<%
List<SpotVO> spot= (List<SpotVO>)request.getAttribute("spot");
			%>
		<div class="lcontents1">
        	<%
			for (int j=0; j<spot.size(); j++){
				if(j %2 == 0){
			%>
	            <div class="button">
	                <a href="/board/submain/submain.do?spot_num=<%=spot.get(j).getNum() %>" target="_blank">
	              		<img class="img" src="/upload/images/<%=spot.get(j).getFile()%>">
	               		<div class="spotname"> 
	                		<%=spot.get(j).getName()%>
	                	</div>
	                	<div class="spotcontent">  
	                		<%=spot.get(j).getContent()%>
	                	</div>
	                	<span class="spotuser">
	                		회원수 : 00명
	                	</span>
	                	<span class="spotleader">리더 : 홍길동</span>
	                </a> 
	                
	            </div>    
           	<%
				}
			}
			%>
        </div>
        <div class="content1">
            <%
			for (int j=0; j<spot.size(); j++){
				if(j %2 == 1){
			%>
	            <div class="button">
	                <a href="/board/submain/submain.do?spot_num=<%=spot.get(j).getNum() %>" target="_blank">
	              		<img class="img" src="/upload/images/<%=spot.get(j).getFile()%>">
	               		<div class="spotname"> 
	                		<%=spot.get(j).getName()%>
	                	</div>
	                	<div class="spotcontent">
	                		<%=spot.get(j).getContent()%>
	                	</div>
	                	<span class="spotuser">
	                		회원수 : 00명
	                	</span>
	                	<span class="spotleader">리더 : 홍길동</span>
	                </a> 
	                
	            </div>    
           	<%
				}
			}
			%>
        </div>