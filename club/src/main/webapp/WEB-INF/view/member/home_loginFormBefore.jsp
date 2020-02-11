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
	            <a href="/member/joinForm1.do" style="float: right; padding: 30px;"><input style="padding: 5px 10px;" type="button" value="회원가입"></a>
	            	<div class="login">
		                <table>
		                    <th class="loginHeader" colspan="2">로그인</th class="loginHeader">
		                    <tr>
		                        <td><label for="id" style="font-size:20px">아이디</label></td>
		                        <td><input type="text" id="id" name="id"></td>
		                    </tr>
		                    <tr>
		                        <td><label for="password" style="font-size:20px">비밀번호</label></td>
		                        <td><input type="password" id="password" name="password"></td>
		                    </tr>
		                    <tr>
		                        <td colspan="2">
		                            <div class="loginBtnArea">
		                                <a href="script:login()">
		                                	<input style="float: left; margin: 0 10px; padding: 5px; width: 85px;" type="submit" id="userLogin" value="로그인">
		                                </a>
		                                <input style="float: right; margin: 0 10px; padding: 5px; width: 85px;" type="button" value="비밀번호 찾기">
		                            </div>
		                        </td>
		                    </tr>
		                </table>
		            </div>
		        </div>
            </form>
        <div class="description">
            <div class="visual">
	       	 <div class="swiper swiper-container">
	       	 	<div class="swiper-wrapper">
	                 <%
	               		for(int i=0; i<infolist.size(); i++){ 
	               	 %>
	                  <div class="swiper-slide">
	                      <img src="/upload/images/<%=infolist.get(i).getFile() %>"></br></br><%=infolist.get(i).getName()%><%=infolist.get(i).getContent()%>
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