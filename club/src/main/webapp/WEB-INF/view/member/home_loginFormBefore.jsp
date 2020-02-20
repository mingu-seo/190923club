<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adminInfo.AdminInfoVO"%>
<%@ page import="spot.SpotVO" %>   
<%
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
    	
    	function login() {	// 로그인 버튼
    		if ($("#id").val().trim() == "") {
    			alert("아이디를 입력해 주세요");
    			$("#id").focus();
    			return false;
    		} else if ($("#password").val() == "") {
    			alert("비밀번호를 입력해 주세요");
    			$("#password").focus();
    			return false;
    		}
    		$("#userLogin").submit();
    	}
    </script>
</head>
<body>
    <div class="wrap">
        <form id="userLogin" action="userLogin.do" post="post">
	        <div class="header">
	            <a href="/member/joinForm1.do" style="float: right; padding: 30px; font-size: 18px; font-weight: bold;" >회원가입</a>
	            	<div class="login">
		                    <div class="loginHeader">
		                    	<div class="loginForm">
		                    		<h1 class="login_title">HOT SPOT</h1>
			                        <div class="login_id"><input type="text" id="id" name="id" placeholder="아이디를 입력하세요"></div>
			                        <div class="login_password"><input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요"></div>
			                        <div class="loginBtnArea">
			                                <a href="script:login()">
			                                	<input type="submit" id="userLogin" value="로그인"> 
			                                </a>
			                                <input type="button" value="비밀번호 찾기">
			                        </div>
		                        </div>
		                    </div>
		            </div>
		        </div>
            </form>
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