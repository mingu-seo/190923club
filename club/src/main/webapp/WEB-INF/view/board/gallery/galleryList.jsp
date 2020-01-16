<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/submain/head.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
   
   
 		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="/js/jquery.imagesloaded.min.js"></script>
        <script src="/js/jquery.masonry.min.js"></script> 


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
        			
                    
        
                    $('.galleryClose').click(function(){hideLightBox();});
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
                height:100%;
                display:none;
                background:rgba(0,0,0,0.9);
                z-index:10000;
                overflow-y:scroll;
                width:100%;
                text-align:center;
            }
			
			#lb_wrap {
				width:850px;
            	margin:0 auto;
            	background: #f2f4ef;
				
			}
        	#lightbox{
                max-width:800px;
                margin:5px auto; padding:10px;
                border:1px solid #333333;
                border-radius:5px;
                background: white;
                box-shadow: 0 5px 5px rgba(34,25,25,0.4);
                }
            .user-information{overflow:hidden; text-align: left;}
            .user-information-image{float:left; width:70px;}
            .user-information-text{float:right; width:620px;}
            .lightbox-splitter{margin:10px 0;}
            
        </style>
</head>
<body>


    <div class="wrap">
    	<%@ include file="/WEB-INF/view/board/submain/header.jsp" %>
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
       
        <div class="visual">
        	<div class="visualLeft">
        <%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>

        </div>
        	
        	
        <div class="visualRight">
       		<div class="board_ctg_name">게시판 목록</div><!-- 카테고리 이름 -->
			<div class="board_writing"><a href="boardWrite.do">글작성</a></div>
	
			<div class="board_seq">
				<select>
					 	<option value="최신순">최신순</option>
					 	<option value="좋아요순">좋아요순</option>
					 	<option value="조회수순">조회수순</option>
				</select>
				
				<select>
					 	<option value="오름차순">오름차순</option>
					 	<option value="내림차순">내림차순</option>
				</select>
			</div>
		
			<div class="board_seq">
			 	<select>
			 	<option value="작성자">작성자</option>
			 	<option value="제목">제목</option>
			 	<option value="내용">내용</option>
			 	</select>
			 	
				 <input type="text" name="boardSearch" class="g_s">
				 <input type="submit" value="검색" class="g_s">
			</div>
			
	<div id=section>
	 <section id="main-section">
        
        <div class="paper">
                    <div class="paper-holder">
                        <a><img width="190" src="http://placekitten.com/130/206"></a>
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
                        <a><img width="190" src="http://placekitten.com/130/206"></a>
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
                        <a><img width="190" src="http://placekitten.com/130/206"></a>
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
                        <a><img width="190" src="http://placekitten.com/130/206"></a>
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
                        <a><img width="190" src="http://placekitten.com/130/206"></a>
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
                        <a><img width="190" src="http://placekitten.com/130/206"></a>
                    </div>
                    <p class="paper-description">로렘 어쩌구</p>
                    <div class="paper-content">
                      <a class="paper-link" href="#">
                      <img src="http://placekitten.com/30/30">
                      </a>
                      <p class="paper-text">로렘 어쩌구</p>
                     </div>
          </div>
			
        
      <!--라이트박스-->
	</section>
	</div>
		 


        	
        </div>
   </div>
        
       
        
    </div>
     <%@ include file="/WEB-INF/view/board/submain/footer.jsp" %>
</body>

      <div id="lb_wrap">
       <div id="darken-background">
       <p class="galleryClose"></p>
            <div id="lightbox">
            	<div>
					<span class="galleryClose">X</span>     
				</div>
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
                    
          	<div class="view_repl_info">
				<span class="view_like">♥</span>
				<span>이 글을 N명이 좋아합니다.</span>
			</div>
					
			<div id="replyBox">
						<table id="reply">
							<tr> 
								<th class="repl_date">홍길동</th>
								<td>어케 댓글창 만들지</td>
								<th class="repl_date">2020-01-05</th>
							</tr>
							<tr>
								<th class="repl_date">김길동</th>
								<td>클낫다 클낫어</td>
								<th class="repl_date">2020-01-06</th>
							</tr>
							<tr>
								<th class="repl_date">박길동</th>
								<td>대댓글창도 만들어야 하는디</td>
								<th class="repl_date">2020-01-07</th>
							</tr>
							
							<tr>
								<td colspan="2">
									<textarea id="replyText">댓글을 입력하세요</textarea>
								</td>
								<td> 
									<input type="submit" id="repl_btn" value="등록"> 
								</td>
							</tr>
						</table>
					</div>
        </div>
            
       
        </div>
       </div>
</html>