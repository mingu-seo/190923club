<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
    $(document).ready(function(){
        $('.slide-menu').hover(function(){
            $(this).find('.inner-menu').stop().slideDown();
        },function(){
            $(this).find('.inner-menu').stop().slideUp();
        });
    });
</script> 
<meta charset="UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/admin/layout.css">
</head>
<body>
<div id="header">
	<div class="header_inner">
		<h1>HOT SPOT</h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util"> 
			<ul>
				<li class="slide-menu"><a href="#">MyPage</a>
					 <ul class="inner-menu">
	                     <li class="inner-menu-item"><a href="#">내 정보</a></li>
	                     <li class="inner-menu-item"><a href="#">내가 쓴 글</a></li>
	                     <li class="inner-menu-item"><a href="#">공지사항</a></li>
	                 </ul> 
                 </li>
			</ul>
			<ul>
				<li class="frist"><a href="/member/loginFormAfter_user.do" onclick="">Home</a></li>
				<li><a href="#">LogOut</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>