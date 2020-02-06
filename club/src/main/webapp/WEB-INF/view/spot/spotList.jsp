<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spotCategory.SpotCategoryVO" %>
<%@ page import="spot.SpotVO" %>
<%@ page import="java.util.List" %>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>    
<%
	List<SpotCategoryVO> list= (List<SpotCategoryVO>)request.getAttribute("list");
	SpotCategoryVO vo = (SpotCategoryVO)request.getAttribute("vo");
	List<SpotVO> spot= (List<SpotVO>)request.getAttribute("spot");
	SpotVO spotvo = (SpotVO)request.getAttribute("spotvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/js/swiper.min.js"></script>
    <link rel="stylesheet" href="/css/swiper.css"/>
<script>
$(function() {
      var swiper = new Swiper('.banner-swiper', {
          loop: true,
          slidesPerView:6,
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
      pagination: {
          el: '.swiper-pagination',
      },
      });
  });

$(function(){
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
	<%@ include file="/WEB-INF/view/user/include/top.jsp" %>
	<!-- E N D :: headerArea-->
<div class="wrap">
  	<form  action="process.do" method="post">
    <div class="boxcontainer">
        <div class="center">
            <div class="button">
                <a href="/spot/categoryCheck.do" class="box1" img="#">SPOT 만들기</a> 
            </div>    
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
            <div class="box2">가입한 SPOT</div>
        </div>
    </div>   
    <div class="container">
        <div class="circlecontainer">
              <div class="swiper-container banner-swiper">    
	              <div class="swiper-wrapper">
	                  <%
	               		for(int i=0; i<list.size()-1; i++){ 
	               	%>
	                  <div class="swiper-slide">
	                      <div class="circle"><img src="/upload/images/<%=list.get(i).getFile() %>"></br></br><%=list.get(i).getName()%></div>
	                  </div>    
	                 <%
	                      }
	                 %>
	              </div>
	              <div class="swiper-button-prev"></div>
	              <div class="swiper-button-next"></div>
              </div>
         </div>
     </div>
     </form>
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
    <div class="container">
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
</div>
</body>
</html>