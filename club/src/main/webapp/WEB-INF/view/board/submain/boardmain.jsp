<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.HashMap" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="notice.*" %>
<%
List<NoticeVO> nList = (List<NoticeVO>)request.getAttribute("list");
NoticeVO vo = (NoticeVO)request.getAttribute("vo");
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
   <link rel="stylesheet" type="text/css" href="/css/board/boardmain.css">
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
        		미리보기<a href="admincategory.do"><img src="/img/board/set.png"></a>
        		</div>
	        	
        		<div><!-- 갤러리, 게시판, 공지 div를 감싸고 있음 -->
        		<div class="pre-board">
        		<div class="preBoard-name">갤러리</div>
        		<div class=rightBoard>
        		
        			<div class="galarybox">
        				<div id="mm"><a href="/board/gallery/galleryList.do?board_id=1"><button class="view-more">더보기</button></a></div>
					<div class="pregalary-info">
					<a href=""><img class="pregalary-img" src="/img/board/gal2.PNG"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title"><a href="">이번에 홍천 비발디파크에서 스키탄거 </a></div>
					<div class="pregalary-writer">홍길동</div>
					<div class="pregalary-dn">
					<span class="pregalary-day">2020-12-28</span>&nbsp;&nbsp;<span class="pregalary-num">조회수 285</span>
					</div>
					</div> 
					
					<div class="pregalary-info">
					<a href=""><img  class="pregalary-img" src="/img/board/gal1.PNG"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title"><a href="">블랙위도우</a></div>
					<div class="pregalary-writer">김길동</div>
					<div class="pregalary-dn">
					<span class="pregalary-day">2020-01-08</span>&nbsp;&nbsp;<span class="pregalary-num">조회수 285</span>
					</div>
					</div>
					
					<div class="pregalary-info">
					<a href=""><img class="pregalary-img" src="/img/board/gal3.PNG"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title"><a href="">엠티가서 찍은 사진 다들 구경해라 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a></div>
					<div class="pregalary-writer">최길동</div>
					<div class="pregalary-dn">					
					<span class="pregalary-day">2020-01-22</span>&nbsp;&nbsp;<span class="pregalary-num">조회수 285</span>
					</div>
					</div>
					
					<div class="pregalary-info">
					<a href=""><img  class="pregalary-img" src="https://via.placeholder.com/150"></a><!-- 갤러리 클릭했을 때 해당 이미지 ajax -->
					<div class="pregalary-title"><a href="">블랙위도우</a></div>
					<div class="pregalary-writer">김길동</div>
					<div class="pregalary-dn">
					<span class="pregalary-day">2020-01-08</span>&nbsp;&nbsp;<span class="pregalary-num">조회수 285</span>
					</div>
					</div>
					
        			</div>
        		</div>
        		</div>
        		
        		<div class="pre-board">
        		<div class="preBoard-name">게시판</div>
        		<div class=rightBoard>
        		<div id="mm"><a href="/board/writing/boardList.do?board_id=2"><button class="view-more">더보기</button></a></div>
        		<table class="preboard">
					
        			<tr> <!-- 최대 갯수 지정 -->
        				<td>★</td>
        				<td class="preboard-tt">해외여행 VS 국내여행 진짜 고민이예요.. 조언좀</td>
        				<td>35</td>
        			</tr>
        			
        			<tr>
        				<td>★</td>
        				<td class="preboard-tt">여기 어딘지 아시는 분~</td>
        				<td>77</td>
        			</tr>
        			<tr>
        				<td>★</td>
        				<td class="preboard-tt">빚있는분들 보통 월급에서 얼마내세요?</td>
        				<td>77</td>
        			</tr>
        			<tr>
        				<td>★</td>
        				<td class="preboard-tt">워크샵간다~</td>
        				<td>77</td>
        			</tr>
        			<tr>
        				<td>★</td>
        				<td class="preboard-tt">이런남자 어떤가요?</td>
        				<td>53</td>
        			</tr>
        			<tr>
        				<td>★</td>
        				<td class="preboard-tt">사랑의 불시착 재미있어요?</td>
        				<td>53</td>
        			</tr>
        			<tr>
        				<td>★</td>
        				<td class="preboard-tt">저 회사에서 첨으로 울었어요...ㅋㅋㅋㅋㅋㅋㅋㅋ</td>
        				<td>53</td>
        			</tr>
        		</table>
        		</div>
        		</div>

        		<div class="pre-board">
        		<div class="preBoard-name">공지</div>
        		<div class=rightBoard>
        		<div id="mm"><a href="/board/notice/noticeList.do?board_id=3"><button class="view-more">더보기</button></a></div>
        		<table class="preboard">
        			<!--  -->
        			<%
        			for (int i=0; i<nList.size(); i++) {
        			%>
        			
        			<tr> <!-- 최대 갯수 지정(7개정도) -->
        				<td>★</td>
        				<td class="preboard-tt">
        					<a href="/board/notice/noticeWriteView.do?board_id=3&post_id=<%=nList.get(i).getPost_id()%>">
        						<%=nList.get(i).getTitle() %>  
        					</a></td>
        				<td>홍길동</td>
        				<td><%=nList.get(i).getView() %></td>
        			</tr>
        			
        			<%  
        			}
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
 </div>
</body>
</html>