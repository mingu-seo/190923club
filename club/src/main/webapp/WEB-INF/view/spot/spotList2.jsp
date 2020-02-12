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
    <div class="container">
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
</div>
</body>
</html>