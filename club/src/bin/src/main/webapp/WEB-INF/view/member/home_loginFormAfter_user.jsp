<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="js/jquery.1.2.3.js"></script>
    <script src="js/swiper.min.js"></script>
    <script src="js/script.js"></script>
    <link rel="stylesheet" href="swiper.css">
    <link rel="stylesheet" href="reset.css">
    <style>
        .wrap {
            width:1200px;
            margin:0 auto;
        }
        .header {
            background-color:#433727;
            height:500px;
            width:1200px;
            position: relative;
            color:black;
            text-align:center;
        }
        .login > table {
            width:300px;
            height:200px;
            position: absolute;
            background-color: white;
            border-radius: 10px;
            left:450px;
            top: 250px;
        }
        .joined_club{
            float: right;
            margin: 5px;
        }
        .container {
            width:100%;
            position: relative;
            background-color:#a5c2a7;
            overflow: hidden;
            height:auto;
        }
        .container > .content {
            width:1130px;
            height:600px;
            margin: 0 auto;
            line-height:500px;
        }
        .container > .content > .club{
            border: solid 2px black;
            float:left;
            width: 350px;
            height: 220px;
        	margin:1%;
        }
        .description {
            width:100%;
            position: relative;
            background-color:#f5cfa8;
            height:500px;
            float:left;
            text-align:center;
        }
        .description > .swiper-slide{
            position: absolute;
            margin: 0 auto;
        }
        .visual{
        	clear:both;
        	height: 500px;
        	width: 100%;
        	color: #ffffff;
            text-align: center;
            z-index: 1;
        }
        .swiper {
        	height:500px;
        }
        .footer {
            position: relative;
            overflow: hidden;
            width:100%;
            background-color:#221f1f;
			color:#999;
			padding:20px 0;
        }
        .footer > .size{
        	width:1200px;
        	margin:0 auto;
        }
        .footer > .size > .sns_area{
        	position:absolute;
        	bottom: 10px;
        	right:0;
        }
         .footer > .size > .info > p{
            width:50%;
         	line-height: 22px;
         }
         .footer > .size > .sns_area > a{
         	margin: 10px;
         }
         
    </style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <a href="" style="float: right; padding: 30px;"><input type="button" value="로그아웃"></a>
            <div class="login">
                <table>
                    <tr>
                        <td><div><img style="width: 100px; height: 100px;" src="img/person.png"></div></td>
                        <td>이름<br>내정보보기<br><br>더보기</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="login_club-swiper-slide">
                                <div class="swiper-wrapper">
                                    <div class="joined_club"><img style="width: 90px; height: 90px;" src="img/jam.jpg"></div>
                                    <div class="joined_club"><img style="width: 90px; height: 90px;" src="img/jam.jpg"></div>
                                    <div class="joined_club"><img style="width: 90px; height: 90px;" src="img/jam.jpg"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="description">
            <div class="visual">
	       	 <div class="swiper swiper-container">
	       	 	<div class="swiper-wrapper">
	       	 		<div class="swiper-slide" style="background-image:url('img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
	       	 		<div class="swiper-slide" style="background-image:url('img/sample.jpg');background-repeat: no-repeat;background-position: center;"></div>
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
                   <a href=""><img src="img/facebook.png"></a>
                   <a href=""><img src="img/instar.png"></a>
                   <a href=""><img src="img/blog.png"></a>
               </div>
            </div>
       </div>
    </div>
</body>
</html>