<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/club/js/swiper.min.js"></script>
    <link rel="stylesheet" href="swiper.css"/>
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
                    el: '.swiper-pagination',
                },
                });
            });
      </script>     
</head>
<body>
    <div class="container">
        <div class="header">
            HEADER 
        </div>
    </div>
    <div class="boxcontainer">
        <div class="center">
            <div class="button">
                <a href="#" class="box1" img="#">SPOT 만들기</a> 
            </div>    
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
        </div>
    </div>   
        <div class="container">
            <div class="circlecontainer">
                        <div class="swiper-container banner-swiper">    
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="circle">카테고리1</div>
                                </div>    
                                <div class="swiper-slide">
                                    <div class="circle">카테고리2</div>
                                </div>
                                <div class="swiper-slide">      
                                    <div class="circle">카테고리3</div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="circle">카테고리4</div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="circle">카테고리5</div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="circle">카테고리6</div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="circle">카테고리7</div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="circle">카테고리8</div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="circle">카테고리9</div>    
                                </div>
                            </div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                            </div>
                    
            </div>
        </div>
    <div class="container">
        <div class="lcontents1">
           LOCNTENTS
        </div>
        <div class="content1">
          CONTENTS
        </div>
    </div>
    <div class="container">
        <div class="lcontents2">
           LOCNTENTS
        </div>
        <div class="content2">
          CONTENTS
        </div>
    </div>
    <div class="container">
        <div class="footer">
            FOOTER
        </div>
    </div>
</body>
</html>