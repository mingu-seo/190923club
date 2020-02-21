<%@page import="gallery.GalleryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="notice.*" %>
<%@ page import="gallery.*" %>
<%@ page import="member.*" %>
<%@ page import="board.*" %>
<%@ page import="category.*" %>
<%

//공지사항 리스트
List<NoticeVO> nList = (List<NoticeVO>)request.getAttribute("nlist");

//갤러리 리스트
List<GalleryVO> gList=(List<GalleryVO>)request.getAttribute("glist");

//자유게시판 리스트 
List<BoardVO> bList = (List<BoardVO>)request.getAttribute("bList");
SpotVO spot_vo = (SpotVO)request.getAttribute("spot_vo"); 

//min 
CategoryVO cate_minNum = (CategoryVO)request.getAttribute("cate_minNum");
MemberVO sessVO = (MemberVO)session.getAttribute("sess");

int joinSpotCnt = (Integer)request.getAttribute("joinSpotCnt");
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

</head>
<body>
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
    <div class="wrap">
	<!-- S T A R T :: headerArea-->
	<!-- E N D :: headerArea-->
	<div class="main">
        <%@ include file="menu.jsp" %>
       
      
        <div class="visual">
	
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="submainLeft.jsp" %>
        	<!-- /왼쪽메뉴 -->
        	
        	<div class="visualRight">
        	<%
       			if(joinSpotCnt==0) {
        	%>
       			<div class="noMemberView"> 
       				<div class="txt">멤버만 게시글을 볼 수 있습니다.<br> SPOT에 가입해 보세요 !</div> 
       			</div>
       		<%
       			} else if(joinSpotCnt ==1){  
   			%>
        	  
        	<% 
        		if(sessVO != null && (sessVO.getNum()==lvo.getNum())) {
        	%> 
        		<div id="preview">
        		미리보기<a href="admincategory.do?spot_num=<%=spot_vo.getNum()%>"><img src="/img/board/set.png"></a>
        		</div>
        	<%
        		}
        	%>
	        	
        		<div><!-- 갤러리, 게시판, 공지 div를 감싸고 있음 -->
        		<div class="pre-board">
        		<div class="preBoard-name">갤러리</div>
        		<div class=rightBoard>
        		
        			<div class="galarybox">
        				<div id="mm"><a href="/board/gallery/galleryList.do?spot_num=<%=spot_vo.getNum() %>&category_id=<%=cate_minNum.getCategory_id1()%>&board_id=1"><button class="view-more">더보기</button></a></div>
        			
        			<%
					if(gList.isEmpty()) { 
					%>
						<div class="contents_empty">
							
							<img class="contents_empty_img" src="/img/board/color.png"><br>
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
        		<div id="mm"><a href="/board/writing/boardList.do?spot_num=<%=spot_vo.getNum() %>&category_id=<%=cate_minNum.getCategory_id2()%>"><button class="view-more">더보기</button></a></div> 
        		<table class="preboard">

					<%
					if(bList.isEmpty()) { 
					%>
						<div class="contents_empty">
							
								<img class="contents_empty_img" src="/img/board/pen.png"><br>
							등록된 내용이 없습니다.
						</div>
					<%
					} else {
						for (int i=0; i<bList.size(); i++) {
					%>
					
        			<tr class="preboard_tr"> <!-- 최대 갯수 지정 -->
        				<td>★</td>
        				<td class="preboard-tt"> 
        					<a href="/board/writing/boardWriteView.do?spot_num=<%=spot_vo.getNum() %>&post_id=<%=bList.get(i).getPost_id() %>&category_id=<%=bList.get(i).getCategory_id()%>">
        						<%=bList.get(i).getTitle() %>
        					</a>
        				</td> 
        				<td><%=bList.get(i).getWriter() %></td>
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
        		<div id="mm"><a href="/board/notice/noticeList.do?spot_num=<%=spot_vo.getNum() %>&category_id=<%=cate_minNum.getCategory_id3()%>"><button class="view-more">더보기</button></a></div>
        		<table class="preboard">
        		
        			<%
        			if(nList.isEmpty()) { 
        			%>
        				<div class="contents_empty">
							 
								<img class="contents_empty_img" src="/img/board/pen.png"><br>
							등록된 내용이 없습니다.
						</div>
        			<%}
        			else {
        			for (int i=0; i<nList.size(); i++) {
        			%> 
        			
        			<tr class="preboard_tr"> <!-- 최대 갯수 지정(7개정도) -->
        				<td>★</td>
        				<td class="preboard-tt">
        					<a href="/board/notice/noticeWriteView.do?spot_num=<%=spot_vo.getNum() %>&category_id=<%=nList.get(i).getCategory_id() %>&post_id=<%=nList.get(i).getPost_id()%>">
        						<%=nList.get(i).getTitle() %>  
        					</a></td>
        				<td><%=nList.get(i).getWriter() %></td> 
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
        
        
        <%
        	}
        %>
    </div>
   </div>
   </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
		
		
 </div>
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
	                <a id="preHref" href="#;" onclick="preHref();"><img src="/img/board/leftArrow.png" style="max-height: 30px; max-width: 30px;"></a>
	                <img class="paper-each2" src="/upload/${gallery.image }" style="max-height: 700px;"> 
	                <a id="nextHref" href="#;" onclick="nextHref();"><img src="/img/board/rightArrow.png" style="max-height: 30px; max-width: 30px;"></a>
                </div> 
                
                
                <div class="paper-contents"></div>  
	          	
	          	<div class="view_repl_info"> 
					<form id="like_form"> 
						<input type="hidden" name="post_id" class="post_id" value="">
						<input type="hidden" name="member_id" class="member_id" value=""> 
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
</body>
</html>