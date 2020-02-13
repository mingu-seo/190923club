<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@ page import="java.util.List" %>
<%@ page import="adminInfo.AdminInfoVO"%>
<%@ page import="spot.SpotVO" %>   
<% 
	MemberVO vo = (MemberVO)session.getAttribute("sess"); 
	List<SpotVO> spot= (List<SpotVO>)request.getAttribute("spot");
	SpotVO spotvo = (SpotVO)request.getAttribute("spotvo");
	List<AdminInfoVO> infolist = (List<AdminInfoVO>)request.getAttribute("info_article");
	AdminInfoVO infovo = (AdminInfoVO)request.getAttribute("infovo");
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>    
    <script src="/js/swiper.min.js"></script>
    <link rel="stylesheet" href="/css/test/swiper.css">
    <link rel="stylesheet" href="/css/test/reset.css">
    <link rel="stylesheet" href="/css/test/home_loginFormBefore.css">
    <script>
    	$(function() {
    		var swiper = new Swiper('.swiper', {
                slidesPerView: 'auto',
                loop: true,
	            navigation: {
	                nextEl: '.swiper-button-next',
	                prevEl: '.swiper-button-prev',
	            },
	            pagination: {
	                el: '.swiper-pagination'
	            },
        	});
    	});
    </script>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <a href="/member/userLogout.do" style="float: right; padding: 30px;">
            	<input style="padding: 5px 10px;" type="button" value="로그아웃">
            </a>
            <div class="login">
                <div class="loginHeader">
		              <div class="login_after_Form">
		                   <h1 class="login_title">HOT SPOT</h1>
		                   	<div class="lform">
		                      	<div class="member_profile">
		                        	<img src=<%if(vo.getProfile()==null){ %>/css/test/img/profile.jpeg
			                    			<%} else{%>
			                    			/profileImg/<%=vo.getProfile()%>
			                    			<%} %> class="member_img">
			                  	</div>
		                  	</div>
		                  	<div class="rform">
		                      	<div class="member_name">
		                      		<%=vo.getName() %>님
		                      	</div>
		                      	<div class="member_info">
		                      		<a href="/member/mypageView.do">내정보보기</a>
		                      	</div>
			                      	<div class="member_joinspot">
			                            <a href="/spot/spotList.do">My HOT SPOT</a>
			                      	</div>
	                      	</div>
                     </div>
                 </div>      
            </div>
        </div>
        <div class="container"> 
       		<h1 class="hotspot_info">HOT SPOT을 소개합니다.</h1>
        </div>
        <div class="description">
            <div class="visual">
	       	 <div class="swiper swiper-container">
	       	 	<div class="swiper-wrapper">
	                 <%
	               		for(int i=0; i<infolist.size(); i++){ 
	               	 %>
	                  <div class="swiper-slide">
	                      <img src="/upload/images/<%=infolist.get(i).getFile() %>" class="sw_img">
	                      <div class="sw_title"><%=infolist.get(i).getName()%></div>
	                      <div class="sw_content"><%=infolist.get(i).getContent()%></div>
	                  </div>    
	                 <%
	                      }
	                 %>
	       	 	</div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-pagination"></div>
	       	 </div>
	      </div>
        </div>
        <div class="container"> 
       		<h1 class="hotspot_info">당신에게 맞는 HOT SPOT을 찾아보세요!</h1>
       		<a href="/spot/spotList.do" class="hotspot_more">더 보기</a>
        </div>
        <form  action="spotView.do" method="post">
	    <div class="container">
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
	    </div>
	    </form>
	    <div class="container">
			<!-- S T A R T :: footerArea-->
			<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
			<!-- E N D :: footerArea-->
	    </div>
    </div>
</body>
</html>