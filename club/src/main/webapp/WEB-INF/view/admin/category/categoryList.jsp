<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spotCategory.SpotCategoryVO" %>
<%@ page import="java.util.List" %>
<%@ include file="/WEB-INF/view/admin/include/categoryheadHtml.jsp" %>  
<%
  	List<SpotCategoryVO> list= (List<SpotCategoryVO>)request.getAttribute("list");
  	SpotCategoryVO vo = (SpotCategoryVO)request.getAttribute("vo");
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
		url : 'categoryAjax.do',
		async: false, //싱크를 맞춰줌
		data : {
		'num' : num
	},
	dataType : 'JSON',
	success : function(data){
		$("#name").text(data.name);
		$("#file").attr("src","/upload/images/"+data.file);
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
     </script>
<script>
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
<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<!-- E N D :: headerArea-->
<div class="wrap">
  	<form  action="process.do" method="post">
    <div class="categorycontainer">
		<div class="center" >
			<h3><a class="wbtn" href="categoryRegistForm.do">카테고리 등록</a></h3>
		</div>
        <div class="center">
        	<%
			for (int i=0; i<list.size(); i++){
			%>
            <div class="button">
                <a href="javascript:ajaxView('<%=list.get(i).getNum() %>');"  data-num="<%=list.get(i).getNum() %>" class="categorybox"><%=list.get(i).getName()%></a> 
            </div>    
           	<%
			}
			%>	
        </div>
    </div>  
    </form>
    <div id="darken-background">
        <div id="lightbox">
		    <form action="categoryUpdateForm.do" method="post">
		    <input type="hidden" id="num"name="num" value="0"> 
            <div class="user-information">
                <div class="user-information-text">
                    <span id="name"></span>
                </div>
	                <hr class="lightbox-splitter">
	            <div>
	                <img id="file" src="http://placehold.it/600x750">
	        	</div> 
			</div>
   			</form>
				<input type="button" value="목록" onclick="location.href='categoryList.do';">
				<input type="button" id="editBtn" value="수정" onclick="updateConfirm(num);">
				<input type="button" id="delBtn" value="삭제" onclick="deleteConfirm(num);">
		    </div>  
    </div>
</div>
</body>
</html>