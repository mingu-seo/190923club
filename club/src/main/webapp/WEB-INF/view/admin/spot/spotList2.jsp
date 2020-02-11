<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spotCategory.SpotCategoryVO" %>
<%@ page import="spot.SpotVO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.Page"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
    int listcount = (Integer)request.getAttribute("listCount"); 
	List<SpotCategoryVO> list= (List<SpotCategoryVO>)request.getAttribute("list");
	SpotCategoryVO vo = (SpotCategoryVO)request.getAttribute("vo");
	List<SpotVO> spot= (List<SpotVO>)request.getAttribute("spot");
	SpotVO spotvo = (SpotVO)request.getAttribute("spotvo");
	int totalpage = (Integer)request.getAttribute("totalpage");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function check(){
	if($("#allChk").prop("checked")){
		$("input[name='num']").prop("checked", true);
	}else{
		$("input[name='num']").prop("checked", false);
	}
}
function deleteConfirm() {
	if (confirm("삭제하시겠습니까?")) {
		$("#frm").submit();
	}
}

function showLightBox(){
    //라이트박스를 보이게 합니다.
    $('#darken-background').show();
    $('#darken-background').css('top',$(window).scrollTop());
    //스크롤을 못하게 합니다.
    $('body').css('overflow','hidden');
}
function ajax(x){
	link = x.url;
	//성공했다면
	x.success();
}
function hideLightBox(){
    //라이트 박스를 보이지 않게 합니다.
    $('#darken-background').hide();
    
    //스크롤을 하게 합니다.
    $('body').css('overflow','');
}

//라이트박스
$(function(){
    
    
    //라이트 박스 제거 이벤트
    $('#darken-background').click(function(){
    	console.log(1);
        hideLightBox();
    });
    
$('#lightbox').click(function(event){
    event.stopPropagation()
});
}); 
function showLightBox(){
//라이트박스를 보이게 합니다.
$('#darken-background').show();
$('#darken-background').css('top',$(window).scrollTop());
//스크롤을 못하게 합니다.
$('body').css('overflow','hidden');
}
function ajaxView(num){
    $.ajax({
		url : 'categoryAjax.do',
		async: false, //싱크를 맞춰줌
		data : {
		'num' : num
	},
	dataType : 'JSON',
	success : function(data){
		$("#name").text(data.name);
		$("#file").attr("src","/upload/images/"+data.file);
		$("#category_name").text(data.category_name);
		$("#num").val(num);
		$("#editBtn").attr("onclick","updateConfirm("+num+");");
		$("#delBtn").attr("onclick","deleteConfirm("+num+");");
	},
	error : function(data){
		console.log(data)
	}
});
     	showLightBox();
     }
     
function updateConfirm(num) {
	if (confirm("수정하시겠습니까?")) {
		location.href="categoryUpdateForm.do?num="+num;
	}
}
function deleteConfirm(num) {
	if (confirm("삭제하시겠습니까?")) {
		location.href="categoryDelete.do?num="+num;
	}
}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>SPOT</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							     <form  action="spotView.do" method="post">
								    <div class="container">
								        <div class="lcontents1">
								        	<%
											for (int j=0; j<spot.size(); j++){
												if(j %2 == 0){
											%>
									            <div class="button">
									                <a href="/board/submain/submain.do?spot_num=<%=spot.get(j).getNum() %>" target="_blank">
									              		<img class="img" src="/upload/images/<%=spot.get(j).getFile()%>">
									               		<div class="spotname"> 
									                		<%=spot.get(j).getName()%>
									                	</div>
									                	<div class="spotcontent">  
									                		<%=spot.get(j).getContent()%>
									                	</div>
									                	<span class="spotuser">
									                		회원수 : 00명
									                	</span>
									                	<span class="spotleader">리더 : 홍길동</span>
									                </a> 
									                
									            </div>    
								           	<%
												}
											}
											%>
								        </div>
								        <div class="content1">
								            <%
											for (int j=0; j<spot.size(); j++){
												if(j %2 == 1){
											%>
									            <div class="button">
									                <a href="/board/submain/submain.do?spot_num=<%=spot.get(j).getNum() %>" target="_blank">
									              		<img class="img" src="/upload/images/<%=spot.get(j).getFile()%>">
									               		<div class="spotname"> 
									                		<%=spot.get(j).getName()%>
									                	</div>
									                	<div class="spotcontent">
									                		<%=spot.get(j).getContent()%>
									                	</div>
									                	<span class="spotuser">
									                		회원수 : 00명
									                	</span>
									                	<span class="spotleader">리더 : 홍길동</span>
									                </a> 
									                
									            </div>    
								           	<%
												}
											}
											%>
								        </div>
								    </div>
								    </form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="deleteConfirm();"><strong>삭제</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<form name="searchForm" id="searchForm" action="spotList.do"  method="post">
								<div class="search">
									<select name="searchOption" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="category" <c:if test="${spotvo.searchOption == 'category'}">selected</c:if>>카테고리</option>
										<option value="name" <c:if test="${spotvo.searchOption == 'name'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${spotvo.searchOption == 'content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="keyword" value="${spotvo.keyword}" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
							
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
		
	</div>
	<!--//canvas -->
    <div id="darken-background">
	    <div id="lightbox">
		    <form action="spotUpdateForm.do" method="post">
		    <input type="hidden" id="num" name="num" value="0"> 
	           <div class="user-information">
	               <div class="user-information-text">
	                   <span id="name"></span>
	               </div>
	                <hr class="lightbox-splitter">
	           			<div class="user-infomation-img">
	                		<img id="file" src="http://placehold.it/600x750">
	        			</div> 
	                	<div id="category_name">
	                		카테고리 :
	                	</div>
					</div>
	  		</form>
			<input type="button" value="목록" onclick="location.href='categoryList.do';">
			<input type="button" id="editBtn" value="수정" onclick="updateConfirm(num);">
			<input type="button" id="delBtn" value="삭제" onclick="deleteConfirm(num);">
		</div>  
   	</div>
</div>
<!--//wrap -->

</body>
</html>