<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
 		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="/club/js/jquery.imagesloaded.min.js"></script>
        <script src="/club/js/jquery.masonry.min.js"></script> 


        
       
            
        <!--라이트박스-->
        <style>

            #darken-background{
                position:absolute;
                top:0; left:0; right:0;
				max-height:auto;
                background:rgba(0,0,0,0.9);
                z-index:10000;
                overflow:scroll;
            }

            #lightbox{
                width:80%;
                margin:20px auto; padding:15px;
                border:1px solid #333333;
                border-radius:5px;
                background: white;
                box-shadow: 0 5px 5px rgba(34,25,25,0.4);
                text-align: center;
            }

            .user-information{overflow:hidden; text-align: left;}
            .user-information-image{float:left; width:70px;}
            .user-information-text{float:right; width:620px;}
            .lightbox-splitter{margin:10px 0;}
            
            .replyBox{
			background: #f5f5f5;
			}
			
			.reply{
			padding: 30px;
			}
			
			.replyInput{
			margin:20px 0;
			text-align: center;
			}
			
			.replyInput th{
			width:100px;
			}
			
			.replyText{
			width:100%;
			background:#f2f2f2;
			}
		
        </style>
</head>
<body>
  <!--라이트박스-->
       <div id="darken-background">
       <p class="gallaryClose">X&nbsp&nbsp&nbsp&nbsp</p>
            <div id="lightbox">
                <div class="user-information">
                    <a class="user-information-image" href="#">
                        <img src="http://placekitten.com/70/70">
                    </a>
                    <div class="user-information-text">
                        <h3>작성자</h3>
                        <p>로렘 어쩌구</p>
                    </div>
                </div>
                    <hr class="lightbox-splitter">
                    <a href="">◀</a>
                    <img src="http://placekitten.com/700/700">
                    <a href="">▶</a>
                    <div class="like">♥ 0명이 이 글을 좋아합니다.</div>
            </div>
            
       <h4>댓글 </h4>
			<div class="replyBox">
				<table class="reply">
					<tr>
						<th> 홍길동</th>
						<td> 어케 댓글창 만들지</td>
						<td> 20-01-05</td>
					</tr>
					<tr>
						<th> 김길동</th>
						<td>클낫다 클낫어</td>
						<td> 20-01-06</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 대댓글창도 만들어야 하는디</td>
						<td> 20-01-07</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 대댓글창도 만들어야 하는디</td>
						<td> 20-01-07</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 대댓글창도 만들어야 하는디</td>
						<td> 20-01-07</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 테스트중</td>
						<td> 20-01-07</td>
					</tr>
					<tr>
						<th> 박길동</th>
						<td> 테스트중</td>
						<td> 20-01-07</td>
					</tr>
				</table>
			</div>
			
			
			<div>
			
			<table class="replyInput">
				<tr>
					<th> 이름</th>
					<td><input type="text" name="reply" class="replyText"></td>
					<td><input type="submit" value="작성"></td>
			</table>
			<p class="gallaryClose">[닫기]</p>     
			</div>
        </div>
	

    
    
    
       
  
</body>
</html>