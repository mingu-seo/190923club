<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="../head.jsp" %>
   
   
 		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="/club/js/jquery.imagesloaded.min.js"></script>
        <script src="/club/js/jquery.masonry.min.js"></script> 


        <script>
        //페이지
        $(document).ready(function(){
            $('#main-section').imagesLoaded(function(){
                $('#main-section').masonry({
                    itemSelector:'.paper',
                    columnWidth:230,
                    isAnimated:true
                });
            });
        });
        </script>
        
        <script>
                //라이트박스
                $(document).ready(function(){
                    function showLightBox(){
                        $('#darken-background').show();
                        $('#darken-background').css('top', $(window).scrollTop());
                        $('body').css('overflow', 'hidden');
                    }
                    function hideLightBox(){
                        $('#darken-background').hide();
                        $('body').css('overflow', '');
                    }
        			
                    
        
                    $('.gallaryClose').click(function(){hideLightBox();});
                    $('.paper').click(function(){showLightBox();});
                    $('#lightbox').click(function(event){event.stopPropagation();
                    });
                });
        </script>
     <!--종이스타일-->
        <style>

            .paper{
                width:190px;
                margin-top:10px;
                padding:15px 15px 0;
                font-size:11px;
                background:#ffffff;
                box-shadow: 0 1px 3px rgba(34,25,25,0.4);
            }

            .paper-content{
                margin:0 -15px;
                margin-top:10px;
                padding:10px 15px;
                background:#f2f0f0;
                overflow:hidden;
            }
            .paper-description{
                margin : 10px 0;
            }

            .paper-link{
                display:block;
                float:left;
            }
            
            .paper-text{
                float:left;
                width:150px;
                margin-left:10px;
            }
         </style>
            
        <!--섹션-->
        <style>
            #main-section{
                width:100%;
                margin:0 auto;
            }
            
        </style>
        
           
        <!--라이트박스-->
        <style>

            #darken-background{
                position:absolute;
                top:0; left:0; right:0;
				max-height:50%;
                display:none;
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
            
        </style>
</head>
<body>


    <div class="wrap">
    	<%@ include file="../header.jsp" %>
        <%@ include file="../menu.jsp" %>
       
       
        <div class="visual">
        	<div class="visualLeft">
        <%@ include file="../boardLeft.jsp" %>

        </div>
        	
        	
        <div class="visualRight">
	        		<h1>갤러리 목록</h1>
			<h2><a href="gallaryWrite.do">갤러리글쓰기</a></h2>
			
			<div class="boardAlign">
				<select id="boardAlign1">
					 	<option value="최신순">최신순</option>
					 	<option value="좋아요순">좋아요순</option>
					 	<option value="조회수순">조회수순</option>
				</select>
				<select id="boardAlign2">
					 	<option value="오름차순">오름차순</option>
					 	<option value="내림차순">내림차순</option>
				</select>
			</div>
		
			<div id="gallarySearch">
			 	<select id="gallarySearchCategory">
			 	<option value="작성자">작성자</option>
			 	<option value="제목">제목</option>
			 	<option value="내용">내용</option>
			 	</select>
			 	
				 <input type="text" name="boardSearch" id="boardSearch">
				 
				 <input type="submit" value="검색">
			
			</div>
			
	<div id=section>
	 <section id="main-section">
    <!-- 나중에 여기부터 삭제 -->    
        <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/140/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/40/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
            
     	 <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/160/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/170/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/180/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/190/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/106"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/96"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/26"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/86"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/76"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/150/56"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/180/246"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/158/277"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
          
          
	   <!-- 나중에 여기까지 삭제 -->    		
        
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
	
	</section>
	</div>
		 


        	
        </div>
   </div>
        
       
        
    </div>
     <%@ include file="../footer.jsp" %>
</body>
</html>