<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $(document).ready(function(){
        $('.outer-menu-item').hover(function(){
            $(this).find('.inner-menu').stop().slideDown();
        },function(){
            $(this).find('.inner-menu').stop().slideUp();
        });
    });
</script>

<div id="header">
     <nav id="main-navigation">
         <div class="pull-left">
             <div class="search-bar">
                 <div class="headerLeft">
                 	<div class="header_logo">
                 		<a href=""><img src="/img/board/logo.png"></a>
                 	</div>
                 	<div class="header_search">
	                    <input type="text" class="input-search">
	                    <input type="submit" class="input-search-submit" value="검색">
	                </div>
                 </div>
             </div>
         </div>
         <div class="pull-right">
             <ul class="outer-menu">
                 <li class="outer-menu-item">
                     <span class="menu-title"><img src="/img/board/myPage.png"></span>
                     <ul class="inner-menu">
                         <li class="inner-men	u-item"><a href="#">내 정보</a></li>
                         <li class="inner-menu-item"><a href="#">내가 쓴 글</a></li>
                         <li class="inner-menu-item"><a href="#">공지사항</a></li>
                         <li class="inner-menu-item"><a href="#">로그아웃</a></li>
                     </ul>
                 </li>
             </ul>
         </div>
     </nav>
</div>
<!-- //header -->