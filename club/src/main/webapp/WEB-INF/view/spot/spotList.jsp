<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spotCategory.SpotCategoryVO" %>
<%@ page import="java.util.List" %>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>    
<%
	List<SpotCategoryVO> list= (List<SpotCategoryVO>)request.getAttribute("list");
	SpotCategoryVO vo = (SpotCategoryVO)request.getAttribute("vo");
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
      </script>     
</head>
<body>
<div class="wrap">
  	<form  action="process.do" method="post">
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/user/include/top.jsp" %>
	<!-- E N D :: headerArea-->
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
                             		for(int i=0; i<list.size(); i++){ 
                             	%>
                                <div class="swiper-slide">
                                    <div class="circle"></div>
                                    <div class="circle_title"><%=list.get(i).getName() %></div>
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
    <div class="container">
        <div class="lcontents1">
           LOCNTENTS
        </div>
        <div class="content1">
          CONTENTS
        </div>
    </div>
    <div class="container">
        <div class="lcontents2">
           LOCNTENTS
        </div>
        <div class="content2">
          CONTENTS
        </div>
    </div>
    <div class="container">
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/user/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
    </div>
    </form>
</div>
</body>
</html>