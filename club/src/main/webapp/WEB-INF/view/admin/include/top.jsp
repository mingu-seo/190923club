<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<script>

function OpenWinCount(URL,width,height) {

	var str,width,height;
	str="'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,";
	str=str+"width="+width;
	str=str+",height="+height+"',top=100,left=100";

	window.open(URL,'remote',str);
}

//$(window).load(function(){
$(function() {
	// 1depth 메뉴들
	var parent = $(".parent");
	
	//현재 주소
	// 주소중 manage이후 폴더 경로 자르기 ex) /admin/board/index.jsp -> board
	var curUrl = document.location.pathname;
	curUrl = curUrl.substring(curUrl.indexOf("admin")+10,curUrl.length);
	console.log(curUrl);
	if (curUrl.indexOf("/") > 0) {
		curUrl = curUrl.substring(curUrl,curUrl.indexOf("/"));
	}
	parent.each(function(){
		$(this).find("span").removeClass("bg");

		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		// 주소중 manage이후 폴더 경로 자르기 ex) /admin/board/index.jsp -> board
		href = href.substring(href.indexOf("admin")+6,href.length);
		href = href.substring(href,href.indexOf("/"));
		
		// 현재 주소에서 href가 포함 되어 있으면 그 메뉴에 배경색 지정
		if(curUrl == href){
			$(this).find("span").addClass("bg");
		}
	});
	
	// 방문자 통계 클릭시 메뉴 유지
	parent.click(function(){
		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		if(href.indexOf("OpenWinCount") >= 0){
			parent.find("span").removeClass("bg");
			$(this).find("span").addClass("bg");
		}
	});
	
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});
</script>
<div id="header">
	<div class="header_inner">
		<h1>HOT SPOT</h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
				<li class="frist"><a href="#" onclick="">Home</a></li>
				<li><a href="/admin/logout.do">LogOut</a></li>
			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><span>기본 설정</span>
					<div class="standard_left">
					<ul>
						<li><a href="/admin/info/infoList.do"><span>HOTSPOT 정보</span></a></li>
						<li><a href="/admin/board/hotspotSetting.do"><span>꾸미기 설정</span></a></li>
					</ul>
					</div>
				</li>
				<li><a href="/admin/product/index.do" class="parent"><span>회원관리</span></a></li>
				<li><span>게시판</span>
					<div class="standard_left">
					<ul>
						<li><a href="/admin/notice/noticeList.do"><span>공지사항</span></a></li>
						<li><a href="/admin/qna/qnaList.do"><span>Q&A</span></a></li>
					</ul>
					</div>
				</li>
				<li><span>관리자관리</span>
					<div class="standard_right">
					<ul>
						<li><a href="/admin/board/post.do"><span>게시글</span></a></li>
						<li><a href="/admin/spot/spotList.do"><span>동아리</span></a></li>
						<li><a href="/admin/category/categoryList.do"><span>카테고리</span></a></li>
					</ul>
					</div>
				</li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->