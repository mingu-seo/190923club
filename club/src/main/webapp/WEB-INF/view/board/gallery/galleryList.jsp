<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import ="gallery.GalleryVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<GalleryVO> list = (List<GalleryVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/writing.css">
   
        <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
        <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

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
                    
              	//라이트박스 제거 이벤트
	                $('#darken-background').click(function() {
	                    hideLightBox();
	                })
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
                cursor:pointer;
            }

            .paper-content{
                margin:0 -15px;
                padding:10px 15px;
                background:#f2f0f0;
                overflow:hidden;
            }
            .paper-description{
                margin : 5px;
                font-size:15px;
                font-weight:bold;
                text-align: right;
            }

            .paper-link{
                display:block;
                float:left;
            }
            
            .paper-text{
                float:left;
                width:150px;
                margin-left:10px;
                font-size:15px;
                font-weight:bold;
				overflow:hidden;
				text-overflow:ellipsis;
				white-space: nowrap;
				display:inline-block;
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
    	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
        <div class="visual">
        	<div class="visualLeft">
        <%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>

        </div>
        	
        	
        <div class="visualRight">
       		<div class="board_ctg_name">갤러리 목록</div><!-- 카테고리 이름 -->
			<div class="board_writing"><a href="galleryWrite.do">글작성</a></div>
	
			<div class="board_seq">
			 	<select>
			 	<option value="작성자">작성자</option>
			 	<option value="제목">제목</option>
			 	<option value="내용">내용</option>
			 	</select>
			 	
				 <input type="text" name="boardSearch" class="g_s">
				 <input type="submit" value="검색" class="g_s">
			</div>
			<div id="horizen"></div>
	<div id=section>
	 <section id="main-section">
     	
     	<%
		for (int i=0; i<list.size(); i++) {
		%>
     	<div class="paper">
          <div class="paper-holder">
             <a><img width="190" src="http://placekitten.com/130/181"></a>
          </div>
     	
		
		 <p class="paper-description"><%=util.Function.getYmd(list.get(i).getRegdate()) %></p><!-- 날짜 불러오기 -->
                    <div class="paper-content">
	                      <a class="paper-link" href="#">
	                      <img src="/upload/<%=list.get(i).getImage()%>">
	                      </a>
                      	  <p class="paper-text"><%=list.get(i).getTitle()%></p>
                     </div>
          </div>
	
		<%
		}
		%>
         
          
        
      <!--라이트박스-->
	</section>
	</div>
		 


        	
        </div>
   </div>
        
       
        
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
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
                        <div class="paper-text">제목 불러오기</div>
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
									<textarea id="replyText" onfocus="this.value='';">댓글을 입력하세요</textarea>
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