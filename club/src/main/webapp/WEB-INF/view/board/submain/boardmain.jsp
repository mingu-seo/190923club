<%@page import="gallery.GalleryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="notice.*" %>
<%@ page import="gallery.*" %>
<%@ page import="board.*" %>
<%

//공지사항 리스트
List<NoticeVO> nList = (List<NoticeVO>)request.getAttribute("nlist");
//공지사항 속성
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
//갤러리 리스트
List<GalleryVO> gList=(List<GalleryVO>)request.getAttribute("glist");
GalleryVO gvo = (GalleryVO)request.getAttribute("gvo");

//자유게시판 리스트
List<BoardVO> bList = (List<BoardVO>)request.getAttribute("bList");
SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo");
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/boardmain.css">
   <link rel="stylesheet" type="text/css" href="/css/board/writing.css">

  <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
        <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

        <script>
        var images = []; // 이미지 담을 배열
        var imageIdx = 0; // 이미지 현재 인덱스
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

       <!-- 삭제확인 --> 
       <script>
       $(function() {
    		$('#deleteHref').on("click", function(){  
    			if(confirm("삭제하시겠습니까?")==true){
    			 } else {
    			 return false;
    			    }
    	    });    
    	});
       </script>
        
        
        
        <script>
        function showLightBox(){
            $('#darken-background').show();
            $('#darken-background').css('top', $(window).scrollTop());
            $('body').css('overflow', 'hidden');
        }
        function hideLightBox(){
            $('#darken-background').hide();
            $('body').css('overflow', '');
        }
                //라이트박스
                $(document).ready(function(){
                    
        			
                    
        
                    $('.galleryClose').click(function(){hideLightBox();});
                    $('.paper').click(function(){showLightBox();});
                    $('#lightbox').click(function(event){event.stopPropagation();
                    });
                    
              	//라이트박스 제거 이벤트
	                $('#darken-background').click(function() {
	                    hideLightBox();
	                })
	            });
                
                
                function ajaxView(id){
                	$.ajax({
                		async :false,
                		url:'/board/gallery/galleryAjax.do',
                		data :{
                			'id':id
	                	},
	                	dataType:'JSON',
	                	success : function(data){
	                		console.log(data);
	                		images = [];
	                		if (data.image != '') images.push(data.image);
	                		if (data.image2 != '') images.push(data.image2);
	                		if (data.image3 != '') images.push(data.image3);
	                		//images = [data.image, data.image2, data.image3];
	                		$(".paper-text2").text(data.title);	
	                		$(".paper-contents").text(data.contents);
		                	$(".paper-each2").attr("src", "/upload/"+data.image);
		                	$("#prePost").attr("onclick", "moveView("+data.post_id+", 'prev')");
		                	$("#nextPost").attr("onclick", "moveView("+data.post_id+", 'next')");
		                	$("#deleteHref").attr("href", "/board/gallery/galleryDelete.do?spot_num=<%=spot_vo.getNum()%>&board_id=1&post_id="+id);
		                	$("#detailHref").attr("href", "/board/gallery/galleryEdit.do?spot_num=<%=spot_vo.getNum()%>&board_id=1&post_id="+id);
		               		$("#readCount").text(data.readcount);
		               		$("#reply_post_id").val(id);
		               		showLightBox();
		               		getReplyList(id);
	                	},
	                	error:function(data){
	                		console.log(data);
                		}
                	});
	                	
                }
                
                function replyView(id){
                	$.ajax({
                		async :false,
                		url:'/board/gallery/replyAjax.do',
                		data :{
                			'id':id
	                	},
	                	dataType:'JSON',
	                	success : function(data){
	                		console.log(data);
	                		$(".reply-contents").text(data.contents);
		               		showLightBox();
	                	},
	                	error:function(data){
	                		console.log(data);
                		}
                	});
	                	
                }
                
                function getReplyList(id) {
                	$.ajax({
                		async :false,
                		url:'/board/replyList.do',
                		data :{
                			'post_id':id,
                			'board_id':1
	                	},
	                	dataType:'HTML',
	                	success : function(data){
	                		$("#replyListArea").html(data);
	                	},
	                	error:function(data){
	                		console.log(data);
                		}
                	});
                }
                
                function preHref() {
                	console.log("pre");
                	imageIdx--;
                	if (imageIdx == -1) imageIdx = images.length-1;
                	$(".paper-each2").attr("src", "/upload/"+images[imageIdx]);
                	
                };
                function nextHref() {
                	imageIdx++;
                	if (imageIdx >= images.length) imageIdx = 0;
                	$(".paper-each2").attr("src", "/upload/"+images[imageIdx]);
                };
                
                function moveView(id, type){
                	var url = "";
                	if (type == "prev") {
                		url = "galleryNext.do";
                	} else {
                		url = "galleryPre.do";
                	}
                	$.ajax({
                		async :false,
                		url:url,
                		data :{
                			'post_id':id
	                	},
	                	dataType:'JSON',
	                	success : function(data){
	                		console.log(data);
	                		if (data.post_id) {
	                			images = [];
		                		if (data.image != '') images.push(data.image);
		                		if (data.image2 != '') images.push(data.image2);
		                		if (data.image3 != '') images.push(data.image3);
		                		//images = [data.image, data.image2, data.image3];
		                		$(".paper-text2").text(data.title);	
		                		$(".paper-contents").text(data.contents);
			                	$(".paper-each2").attr("src", "/upload/"+data.image);
			                	$("#prePost").attr("onclick", "moveView("+data.post_id+", 'prev')");
			                	$("#nextPost").attr("onclick", "moveView("+data.post_id+", 'next')");
			                	$("#deleteHref").attr("href", "galleryDelete.do?post_id="+data.post_id);
			                	$("#detailHref").attr("href", "galleryEdit.do?post_id="+data.post_id);
			               		$("#readCount").text(data.readcount);
			               		$("#reply_post_id").val(data.post_id);
			               		showLightBox();
			               		getReplyList(id);
	                		} else {
	                			alert("마지막 글입니다.");
	                		}
	                	},
	                	error:function(data){
	                		console.log(data);
	                		alert("에러");
                		}
                	});
	                	
                }
                
                
                
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
                width:100%;
                text-align: center;
            }
            
           .paper-each{
            	width:100%;
            	text-align:center;
            }
            
           .paper-each2{
            	width:auto;
            	max-width:90%;
            	text-align:center;
            	box-sizing: border-box;
            	
            }
            
            
            .paper-holder  p{
            	float:left;
            	margin : 5px;
                font-size:15px;
                font-weight:bold;
            }
            

            .paper-link{
                display:block;
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
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
	<!-- E N D :: headerArea-->  
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight"> 
        		<div id="preview">
        		미리보기<a href="admincategory.do?spot_num=<%=spot_num%>"><img src="/img/board/set.png"></a>
        		</div>
	        	
        		<div><!-- 갤러리, 게시판, 공지 div를 감싸고 있음 -->
        		<div class="pre-board">
        		<div class="preBoard-name">갤러리</div>
        		<div class=rightBoard>
        		
        			<div class="galarybox">
        				<div id="mm"><a href="/board/gallery/galleryList.do?spot_num=<%=spot_num %>&board_id=1"><button class="view-more">더보기</button></a></div>
        			
        			<%
					if(gList.isEmpty()) { 
					%>
						<div class="contents_empty">
							<a href="/board/gallery/galleryWrite.do?spot_num=<%=spot_num%>&board_num=1"><img class="contents_empty_img" src="/img/board/color.png"></a><br>
							등록된 내용이 없습니다.
						</div>
        			
        			<%}
					else {
        			for (int i=0; i<gList.size(); i++) { 
        				%> 
        			<div class="pregalary-info">
					<img class="pregalary-img" src="/upload/<%=gList.get(i).getImage()%>" onclick="ajaxView('<%=gList.get(i).getPost_id()%>');"><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title"><%=gList.get(i).getTitle() %></div>
					<div class="pregalary-writer">작성자 <%=gList.get(i).getWriter()%> </div>
					<div class="pregalary-dn">
					<span class="pregalary-day"><%=util.Function.getYmd(gList.get(i).getRegdate())%></span>&nbsp;&nbsp;<span class="pregalary-num">조회수 <%=gList.get(i).getView()%></span>
					</div> 
					</div>
        			
        			<%
        				}
					}
        			%>
					
					
					
        			</div>
        		</div>
        		</div>
        		
        		<div class="pre-board">
        		<div class="preBoard-name">게시판</div> 
        		<div class=rightBoard>
        		<div id="mm"><a href="/board/writing/boardList.do?spot_num=<%=spot_num %>&board_id=2"><button class="view-more">더보기</button></a></div> 
        		<table class="preboard">

					<%
					if(bList.isEmpty()) { 
					%>
						<div class="contents_empty">
							<img class="contents_empty_img" src="/img/board/pen.png"> <br>
							등록된 내용이 없습니다.
						</div>
					<%
					} else {
						for (int i=0; i<bList.size(); i++) {
					%>
					
        			<tr> <!-- 최대 갯수 지정 -->
        				<td>★</td>
        				<td class="preboard-tt">
        					<a href="/board/writing/boardWriteView.do?spot_num=<%=spot_num %>&board_id=2&post_id=<%=bList.get(i).getPost_id() %>">
        						<%=bList.get(i).getTitle() %>
        					</a>
        				</td>
        				<td>홍길동</td>
        				<td><%=bList.get(i).getView() %></td>
        			</tr>
        			
					
					<%
						} //else닫기
					}
					%>        			
        			
        		</table>
        		</div>
        		</div> 

        		<div class="pre-board">
        		<div class="preBoard-name">공지</div>
        		<div class=rightBoard>
        		<div id="mm"><a href="/board/notice/noticeList.do?spot_num=<%=spot_num %>&board_id=3"><button class="view-more">더보기</button></a></div>
        		<table class="preboard">
        		
        			<%
        			if(nList.isEmpty()) {
        			%>
        				<div class="contents_empty">
							<img class="contents_empty_img" src="/img/board/pen.png"> <br>
							등록된 내용이 없습니다.
						</div>
        			<%}
        			else {
        			for (int i=0; i<nList.size(); i++) {
        			%>
        			
        			<tr> <!-- 최대 갯수 지정(7개정도) -->
        				<td>★</td>
        				<td class="preboard-tt">
        					<a href="/board/notice/noticeWriteView.do?spot_num=<%=spot_num %>&board_id=3&post_id=<%=nList.get(i).getPost_id()%>">
        						<%=nList.get(i).getTitle() %>  
        					</a></td> 
        				<td>홍길동</td>
        				<td><%=nList.get(i).getView() %></td>
        			</tr>
        			
        			<%   
        				} //for 닫기
        			} //else 닫기
        			%>
        		</table>
        		</div>
        	</div>
        	</div>
        
       
        
    </div>
   </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
		
		<div id="lb_wrap">
       <div id="darken-background">
       <p class="galleryClose"></p>
            <div id="lightbox">
            	<div>
					<span class="galleryClose">X</span>     
				</div>
               <form action="/board/gallery/galleryEdit.do?spot_num=<%=spot_vo.getNum() %>&board_id=1" method="post">
               <input type="hidden" id="post_id" name="post_id">
                 <input type="hidden" id="board_id" name="board_id">
               
                <div class="user-information">
                    <a class="user-information-image" href="#">
                        <img src="http://placekitten.com/70/70">
                    </a>    
                    <div class="user-information-text">
                        <h3>작성자</h3>
                        <div class="paper-text2">${gallery.title }</div>
                    </div>
                </div>
                   
                <hr class="lightbox-splitter">
                
                <div class="galleryImage"> 
	                <a id="prePost" href="#;">◁</a>
	                <a id="preHref" href="#;" onclick="preHref();">◀</a>
	                <img class="paper-each2" src="/upload/${gallery.image }">
	                <a id="nextHref" href="#;" onclick="nextHref();">▶</a>
	                <a  id="nextPost"  href="#;">▷</a>
                </div>  
                
                </form>
                
                <div class="paper-contents"></div>  
	          	
	          	<div class="view_repl_info">
					<span class="view_like">♥</span>
					<span>이 글을 N명이 좋아합니다.</span>
				</div>
				<div class="repl_box">	
				<div id="replyBox">
					<div id="replyListArea">
					
					</div>
					
					<!-- 댓글 폼 -->
						<form action="/board/galleryReply.do" method="post">
								<input type="hidden" name="post_id" id="reply_post_id" value="">
								<input type="hidden" name="board_id" id="reply_board_id" value="1">
								<input type="hidden" name="reply_num" id="reply_num" value="">
							<table>
								<tr>
									<td class="repForm" colspan="2">   
										<textarea class="replyText" name="contents" placeholder="댓글을 입력하세요"></textarea>
									</td>
									
									<td class="repForm_sub"> 
										<input type="button" class="repl_btn" value="등록" onclick="replyAjax();"> 
									</td>
									
								</tr>
							</table>
						</form> 
				<script>
				function replyAjax() {
					$.ajax({
                		async :false,    
                		url:'/board/galleryReply.do',
                		data :{
                			'post_id':$("#reply_post_id").val(),
                			'board_id':$("#reply_board_id").val(),
                			'contents':$(".replyText").val(),
	                	},
	                	dataType:'HTML',
	                	success : function(data){
	                		// 댓글이 정상적으로 저장됐을때
	                		$(".replyText").val("");
	                		getReplyList($("#reply_post_id").val());
	                	},
	                	error:function(data){
	                		console.log(data);
                		}
                	});
				}
				
				
				function replyAjax2(formId) {
					var data = $("#"+formId).serialize();
					$.ajax({
						async :false,
						url:'/board/reReply.do',
						data :data,
				    	dataType:'HTML',
				    	success : function(data){
				    		// 댓글이 정상적으로 저장됐을때
				    		$(".replyText").val("");
				    		getReplyList($("#reply_post_id").val());
				    	},
				    	error:function(data){
				    		console.log(data);
						}
					});
				}				
				
				
				function deleteReply(res_num) {
					$.ajax({
						async :false,
						url:'/board/reDelete.do',
						data :{reply_num : res_num},
				    	dataType:'HTML',
				    	success : function(data){
				    		// 댓글이 정상적으로 저장됐을때
				    		getReplyList($("#reply_post_id").val());
				    	},
				    	error:function(data){
				    		console.log(data);
						}
					});
				}
				
				</script>		  
					</div> 
				</div>
				<a id="deleteHref"><input type="button" value="삭제" class="btns" ></a>
				<a id="detailHref"><input type="button" value="수정" class="btns" ></a>
      	  </div>
         
        </div>
       </div>
 </div>
</body>
</html>