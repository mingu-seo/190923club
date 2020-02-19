<%@page import="util.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import ="gallery.GalleryVO" %>
<%@ page import ="category.CategoryVO" %>
<%@ page import ="member.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="reply.ReplyVO" %>
<%@ page import="spot.*"%>

<%
List<GalleryVO> list = (List<GalleryVO>)request.getAttribute("list");
GalleryVO vo = (GalleryVO)request.getAttribute("vo");
//GalleryVO gVO = (GalleryVO)request.getAttribute("gVO");
SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo");
CategoryVO cate_name = (CategoryVO)request.getAttribute("cate_name");
MemberVO sessVO = (MemberVO)session.getAttribute("sess");
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
        
      //좋아요 ajax
    	function likeAjax() { 
    	 	$.ajax({
    	 		async : false,
    	 		url : '/board/likeInsert.do', 
    	 		data : {
    	 			'post_id' : $(".post_id").val(), 
    	 			'board_id' : 1,
    	 			'member_id' : $(".member_id").val(),
    	 			'tableName' : 'gallery' 
    	 		},
    	 		dataType :'HTML',
    	 		success : function(data) {
    	 			if (data.trim() == "0") {
    	 				$(".like_cnt").text(Number($(".like_cnt").text())+1);
    	 			} else {
    	 				$(".like_cnt").text(Number($(".like_cnt").text())-1);
    	 			}
    	 		},
    	 		error:function(data) {
    	 			alert("ajax실패")
    	 		}
    	 	});
    	}
        
        </script>
        
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
	                		$(".like_cnt").text(data.like_cnt);
		                	$(".paper-each2").attr("src", "/upload/"+data.image);
		                	$("#prePost").attr("onclick", "moveView("+data.post_id+", 'prev')");
		                	$("#nextPost").attr("onclick", "moveView("+data.post_id+", 'next')");
		                	$("#deleteHref").attr("href", "/board/gallery/galleryDelete.do?spot_num=<%=spot_vo.getNum()%>&board_id=1&category_id=<%=vo.getCategory_id()%>&post_id="+id);
		                	$("#detailHref").attr("href", "/board/gallery/galleryEdit.do?spot_num=<%=spot_vo.getNum()%>&board_id=1&category_id=<%=vo.getCategory_id()%>&post_id="+id);
		               		//$("#readCount").text(data.readcount);
		               		$("#viewCnt").text(data.view); //조회수
		               		$("#reply_post_id").val(id);
		               		$("#date_info").text(data.regdate); // 날짜 넘겨주기
		               		$("#writer_info").text(data.writer); // 작성자 넘겨주기  
		               		$(".post_id").val(id); // post_id넘겨주기 
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
			               		//$("#readCount").text(data.readcount);
			               		$("#reply_post_id").val(data.post_id);
			               		$("#date_info").text(data.regdate); // 날짜 넘겨주기
			               		$("#writer_info").text(data.writer); // 작성자 넘겨주기  
			               		$("#viewCnt").text(data.view); //조회수
			               		$(".like_cnt").text(data.like_cnt); // 좋아요
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
      
</head>
<body>


    	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
    <div class="wrap">
    	<div class="main">
	        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
	        <div class="visual">
	        	<div class="visualLeft">
	        <%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
 
        </div>
        	
        	
        <div class="visualRight">
       		<div class="board_ctg_name"><%=cate_name.getName() %></div>
			<div class="board_writing">
				<a href="galleryWrite.do?spot_num=<%=spot_vo.getNum() %>&board_id=1&category_id=<%=vo.getCategory_id()%>">
				<button class="goWriting">글작성</button></a>  
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
				 <p class="paper-description"><%=util.Function.getYmd(list.get(i).getRegdate()) %></p> 
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
	</section>
	</div>
		 	 <div class="boardSearch2">
			 	<form action="/board/gallery/galleryList.do?spot_num=<%=spot_vo.getNum() %>&board_id=1" method="post">
				<input type="search" name="search_word" id="boardSearch" value="${gallery.serch_word }">
				<input id="board_search_btn" type="submit" value="검색">
				</form>
			</div>
	 
	
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
                    	<div class=paper-text2 style="font-weight: bold; font-size:20px;"></div> 
                        <div id="writer_info" style="font-weight: bold; font-size:18px;"></div>
                        <div id="date_info" style="font-size:15px;"></div> 
                    </div> 
                </div>
                   
                <hr class="lightbox-splitter">
                
                <div class="galleryImage"> 
	                <a id="prePost" href="#;"><img src="/img/board/leftDoubleArrow.png" style="max-height: 30px; max-width: 30px;"></a> 
	                <a id="preHref" href="#;" onclick="preHref();"><img src="/img/board/leftArrow.png" style="max-height: 30px; max-width: 30px;"></a>
	                <img class="paper-each2" src="/upload/${gallery.image }" style="max-height: 700px;"> 
	                <a id="nextHref" href="#;" onclick="nextHref();"><img src="/img/board/rightArrow.png" style="max-height: 30px; max-width: 30px;"></a>
	                <a  id="nextPost"  href="#;"><img src="/img/board/rightDoubleArrow.png" style="max-height: 30px; max-width: 30px;"></a> 
                </div>  
                 
                
                <div class="paper-contents" style="font-size:20px; padding:10px 40px;"></div>  
	          	
	          	
	          	<div class="view_repl_info"> 
					<form id="like_form">
						<input type="hidden" name="post_id" class="post_id" value="<%=vo.getPost_id()%>">
						<input type="hidden" name="member_id" class="member_id" value="<%=sessVO.getNum()%>">
						<span class="view_like" onclick="likeAjax();">❤ </span> 
						<span class="like_cnt"></span> 
					</form> 
					
					<span>조회</span> 
					<span id="viewCnt"></span>  
					
				</div> 
				<div class="repl_box">	 
				<div id="replyBox">  
					<div id="replyListArea">
					
					</div>
					
					<!-- 댓글 폼 -->
						<form action="/board/galleryReply.do" method="post"> 
								<input type="hidden" name="post_id" id="reply_post_id" value="<%=vo.getPost_id()%>">
								<input type="hidden" name="board_id" id="reply_board_id" value="1">
								<input type="hidden" name="member_id" id="member_id" value="<%=sessVO.getNum()%>">
								<input type="hidden" name="writer" id="writer" value="<%=sessVO.getName()%>"> 
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
                			'member_id':$("#member_id").val(),
                			'writer':$("#writer").val(), 
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
				
				
				function replyAjax2(form_Id) {
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