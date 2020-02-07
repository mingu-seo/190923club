<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import ="gallery.GalleryVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="reply.ReplyVO" %>
<%@ page import="spot.*"%>

<%
List<GalleryVO> list = (List<GalleryVO>)request.getAttribute("list");
GalleryVO vo = (GalleryVO)request.getAttribute("vo");
SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo");
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
                		url:'galleryAjax.do',
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
                		url:'replyAjax.do',
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
    	<%@ include file="/WEB-INF/view/board/include/top.jsp" %>
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
        <div class="visual">
        	<div class="visualLeft">
        <%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
 
        </div>
        	
        	
        <div class="visualRight">
       		<div class="board_ctg_name">갤러리 목록</div><!-- 카테고리 이름 -->
			<div class="board_writing"><a href="galleryWrite.do?spot_num=<%=spot_vo.getNum() %>&board_id=1">글작성</a></div>
	
			
		 	 <div class="boardSearch2">
			 	<form action="/board/gallery/galleryList.do?spot_num=<%=spot_vo.getNum() %>&board_id=1" method="post">
				<input type="search" name="search_word" id="boardSearch" value="${gallery.serch_word }"> 
				<input id="board_search_btn" type="submit" value="검색">
				</form>
			</div>
				 
				 
			<div id="horizen"></div>
	<div id=section>
	 <section id="main-section">
     	
     	<%
		for (int i=0; i<list.size(); i++) {
		%>
     	<div class="paper" onclick="ajaxView('<%=list.get(i).getPost_id()%>');">
	          <div class="paper-holder">
	             <p><%=list.get(i).getWriter()%></p>
				 <p class="paper-description"><%=util.Function.getYmd(list.get(i).getRegdate()) %></p><!-- 날짜 불러오기 -->
		     </div>
	         <div class="paper-content">
	            <a class="paper-link">
	            <img class = "paper-each" src="/upload/<%=list.get(i).getImage()%>">
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
               <form action="/board/gallery/galleryEdit.do?spot_num=<%=spot_vo.getNum() %>&board_id=1" method="post">
               <input type="hidden" id="post_id" name="post_id">
                 <input type="hidden" id="board_id" name="board_id">
                 <input type="hidden" id="spot_num" name="<%=spot_vo.getNum() %>" >
               
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
						<form action="/board/galleryReply.do?spot_num=<%=spot_vo.getNum() %>&board_id=1" method="post">
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
</html>