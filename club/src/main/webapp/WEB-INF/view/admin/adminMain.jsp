<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <mata name="viewport" content="user-scalable=no,initial-scale=1,maximum-scale=1">
	<%@ include file="head.jsp" %>
 	<style>
 	</style>
    <script>
    </script>    
</head>
<body>
<div class="divPop">
	<img src="/club/img/event_popup.png" ><br/>
	<div><span class="closeBtn">닫기</span></div>
</div>
    <div class="wrap">
		<%@ include file="header.jsp" %>
        
        <div class="visual">
			<div class="swiper swiper-container">    
			    <div class="swiper-wrapper">
			    	<div class="swiper-slide" style="background-image:url('/club/img/visual1.png')"></div>
			    	<div class="swiper-slide" style="background-image:url('/club/img/visual2.png')"></div>
			    	<div class="swiper-slide" style="background-image:url('/club/img/visual3.png')"></div>
			    	<div class="swiper-slide" style="background-image:url('/club/img/visual4.png')"></div>
			    </div>
			    
			    <div class="swiper-pagination"></div>
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-button-next"></div>
			    </div>
        </div>
        <div class="container">
            <div class="size">
           		<div class="section">
           			<img src="/club/img/section1_1.png">
           		</div>
           		<div class="section">
           			<img src="/club/img/section1_2.png">
           		</div>
           		<div class="section">
           			<img src="/club/img/section1_3.png">
           		</div>
           		<div class="section">
           			<img src="/club/img/section1_4.png">
           		</div>
           		<div class="section">
           			<img src="/club/img/section1_5.png">
           		</div>
           		<div class="section">
           			<img src="/club/img/section1_6.png">
           		</div>
            </div>
        </div>
        <div class="info">
        	<div class="contents">
        		<div class="board_area">
        			<div class="board_title on">공지사항</div>
        			<div class="board_title">자료실</div>
        			<!-- 공지사항 -->
        			<div class="board_contents" id="board_notice">
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>공지사항입니다. <span>2019-11-29</span></li>
        				</ul>
        			</div>
        			<!-- 자료실 -->
        			<div class="board_contents" id="board_data">
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        				<ul>
        					<li>자료실입니다. <span>2019-11-29</span></li>
        				</ul>
        			</div>
        		</div>
        	</div>
        	<div class="contents">
        		<div class="video_container">
        			<iframe width="100%" height="400" src="https://www.youtube.com/embed/FNMOf8tlOVM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>></iframe>
        		</div>
        	</div>
        </div>
        <div class="banner">
        	<div class="swiper-container banner-swiper">
        		<div class="swiper-wrapper">
        			<div class="swiper-slide">
        				<div class="img">
        					<img src="/club/img/partner_1.png">
        				</div>
        			</div>
        			<div class="swiper-slide">
        				<div class="img">
        					<img src="/club/img/partner_2.png">
	        			</div>
        			</div>
        			<div class="swiper-slide">
        				<div class="img">
    	    				<img src="/club/img/partner_3.png">
	        			</div>
        			</div>
        			<div class="swiper-slide">
        				<div class="img">
        					<img src="/club/img/partner_4.png">
	        			</div>
        			</div>
        			<div class="swiper-slide">
        				<div class="img">
        					<img src="/club/img/partner_5.png">
 		       			</div>
        			</div>
        		</div>
        	</div>
        </div>
		<%@ include file="footer.jsp" %>
        <div class="quickMenu">
        	<div><img src="/club/img/quick_01.jpg"></div>
        	<div><img src="/club/img/quick_02.jpg"></div>
        	<div><img src="/club/img/quick_03.jpg"></div>
        	<div><img src="/club/img/quick_04.jpg"></div>
        	<div><a href="javascript:;" class="goTop"><img src="/club/img/quick_05.jpg"></a></div>
        </div>
    </div>
</body>
</html>
