<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>   
<% 
	MemberVO headsess = (MemberVO)session.getAttribute("sess"); 

%>
<script>
    $(document).ready(function(){
        $('.slide-menu').hover(function(){
            $(this).find('.inner-menu').stop().slideDown();
        },function(){
            $(this).find('.inner-menu').stop().slideUp();
        });
    });
</script> 
<link rel="stylesheet" type="text/css" href="/css/admin/layout.css">
<div id="header">
	<div class="header_inner">
		<h1>HOT SPOT</h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util"> 
			<%if(headsess != null){ %>
			<ul>
				<li class="slide-menu"><a href="#">MyPage</a>
					 <ul class="inner-menu">
	                     <li class="inner-menu-item"><a href="/member/mypageView.do">내 정보</a></li>
	                     <li class="inner-menu-item"><a href="#">내가 쓴 글</a></li>
	                     <li class="inner-menu-item"><a href="#">공지사항</a></li>
	                 </ul> 
                 </li>
			</ul>
			<ul>
				<li class="frist"><a href="/member/loginFormAfter_user.do">Home</a></li>
				<li><a href="/member/userLogout.do">LogOut</a></li>
			</ul>
			<%}else{ %>			
			<ul>
				<li class="frist"><a href="/member/loginFormBefore.do">Home</a></li>
				<li><a href="/member/loginFormBefore.do">Login</a></li>				
			</ul>
			<%} %>
		</div>
	</div>
</div>
