<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="adminInfo.AdminInfoVO"%>
<%@ page import="java.util.List" %>
<%@ include file="/WEB-INF/view/admin/include/infoheadHtml.jsp" %>  


<%
	List<AdminInfoVO> infolist = (List<AdminInfoVO>)request.getAttribute("info_article");
	AdminInfoVO infovo = (AdminInfoVO)request.getAttribute("infovo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>    
    <meta name="viewport" content="user-scalable=no,initial-scale=1,maximum-scale=1">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/js/jquery.masonry.min.js"></script>
    <script src="/js/jquery.imagesloaded.min.js"></script>
<script>
//풀 다운 메뉴
$(document).ready(function(){
    //풀 다운 메뉴
    $('.outer-menu').hover(function(){
        $(this).find('.inner-menu').css('display','block');
    },function(){
        $(this).find('.inner-menu').css('display', 'none');
    });
});
//페이지
$(function(){
    //이미지 로드 확인
    $('#main-section').imagesLoaded(function(){
        //jQuery Masonry 플러그인 적용
        $('#main-section').masonry({
            itemSelector: '.paper',
            columnwidth: 230,
            isAnimated: true
        });
    });
});

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
		url : 'infoAjax.do',
		async: false, //싱크를 맞춰줌
		data : {
		'num' : num
	},
	dataType : 'JSON',
	success : function(data){
		$("#name").text(data.name);
		$("#info_content").text(data.content);
		$("#info_file").attr("src","/upload/images/"+data.file);
		$("#regdate").text(data.regdate);
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
		location.href="infoUpdateForm.do?num="+num;
	}
}
function deleteConfirm(num) {
	if (confirm("삭제하시겠습니까?")) {
		location.href="infoDelete.do?num="+num;
	}
}
</script>
</head>
<body>
<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<!-- E N D :: headerArea-->
  	<div class="info_title">
  		<h2>HOT SPOT 정보</h2>
  	</div>
  	<div class="info_content">
  		<h2>메인 페이지에 HOT SPOT의 기능과 이미지를 등록해보세요!</h2>
  	</div>
<div class="wrap">
  	<form  action="infoView.do" method="post">
    <div class="categorycontainer">
		<div class="center_title" >
			<a href="infoRegistForm.do" class="wbtn">정보 등록</a>
		</div>
        <div class="center">
        	<%
			for (int i=0; i<infolist.size(); i++){
			%>
            <div class="button">
                <a href="javascript:ajaxView('<%=infolist.get(i).getNum() %>');"  data-num="<%=infolist.get(i).getNum() %>" class="info_box"><%=infolist.get(i).getName()%></a> 
            </div>    
           	<%
			}
			%>	
        </div>
    </div>  
    </form>
    <div id="darken-background">
        <div id="lightbox">
		    <form action="infoUpdateForm.do" method="post">
		    <input type="hidden" id="num" name="num" value="0"> 
	           <div class="spot-information">
	               <div class="spot-information-text">
	                   	제목: <span id="name"></span>
	               </div>
	                <hr class="lightbox-splitter">
	           			<div class="spot-infomation-img">
	                		<img id="info_file" src="http://placehold.it/300x300">
	        			</div> 
		        		<div class="spot_content">
		                	<p>내용 : <span id="info_content"></span></p>
		                	<p>작성일 : <span id="regdate"></span></p>
		                </div>
				</div>
	  		</form>
				<input type="button" value="목록" onclick="location.href='infoList.do';">
				<input type="button" id="editBtn" value="수정" onclick="updateConfirm(num);">
				<input type="button" id="delBtn" value="삭제" onclick="deleteConfirm(num);">
		    </div>  
    </div>
</div>
</body>
</html>