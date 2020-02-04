<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="/js/jquery.1.2.3.js"></script>
    <script src="/js/swiper.min.js"></script>
    <link rel="stylesheet" href="/css/test/swiper.css">
    <link rel="stylesheet" href="/css/test/reset.css">
    <link rel="stylesheet" href="/css/test/home_loginFormAfter_admin.css">    
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
            <a href="" style="float: right; padding: 30px;"><input style="padding: 5px 10px;" type="button" value="로그아웃"></a>
            <div class="login">
                <table>
                    <tr>
                        <td><div><img style="width: 100px; height: 100px;" src="/css/test/img/person.png"></div></td>
                        <td style="font-size: 20px; text-align: left;"><a href="">관리자</a><br><br><a href="">내정보보기</a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input style="margin: 0 auto; padding: 5px 45px;" type="button" value="관리자 설정"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="description">
            <div class="visual">
	       	 <div class="swiper swiper-container">
	       	 	<div class="swiper-wrapper">
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('/css/test/img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 	</div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-pagination"></div>
	       	 </div>
	      </div>
        </div>
        <div class="container">
            <div class="content">
                <div class="club">
                    <a href=""><img scr=""><div class=club_description></div></a>
                </div>
                <div class="club">
                    <a href=""><img scr=""></a>
                </div>
                <div class="club">
                    <a href=""><img scr=""></a>
                </div>
                <div class="club">
                    <a href=""><img scr=""></a>
                </div>
                <div class="club">
                    <a href=""><img scr=""></a>
                </div>
                <div class="club">
                    <a href=""><img scr=""></a>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="size">
               <div class="info">
                   <p>구디아카데미</p>
                   <p>서울시 서울구 서울로 서울동 서울호</p>
                   <p>02-2000-2000 | 010-2222-2222</p>
                   <p>대표자 김철수 | 책임자 김수철</p>
                   <p>사업자등록번호 111-11-22222</p>
               </div>
               <div class="sns_area">
                   <a href=""><img src="/css/test/img/facebook.png"></a>
                   <a href=""><img src="/css/test/img/instar.png"></a>
                   <a href=""><img src="/css/test/img/blog.png"></a>
               </div>
            </div>
       </div>
    </div>
</body>
</html>