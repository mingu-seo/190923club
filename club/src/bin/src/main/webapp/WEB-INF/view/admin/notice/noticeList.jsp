<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="adminNotice.AdminNoticeVO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.Page"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
    int listcount = (Integer)request.getAttribute("listCount"); 
	List<AdminNoticeVO> list= (List<AdminNoticeVO>)request.getAttribute("list");
	AdminNoticeVO vo = (AdminNoticeVO)request.getAttribute("vo");
	int totalpage = (Integer)request.getAttribute("totalpage");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
					<h2>공지사항 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=listcount%>개</strong>  |  <%=vo.getPage()%>/<%=totalpage%>페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
								<%
									if(list !=null && listcount > 0 ){
								%>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th> 
										<th scope="col">작성자</th> 
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<%
								for (int i=0; i<list.size(); i++){
								%>
								<tbody>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td><%=list.get(i).getNotice_num()%></td>
										<td class="title"><a href="noticeDetail.do?notice_num=<%=list.get(i).getNotice_num()%>&page=<%=vo.getPage()%>">
										<%=list.get(i).getNotice_subject() %></a></td>							
										<td><%=list.get(i).getNotice_date() %></td>
										<td><%=list.get(i).getNotice_name() %></td>
										<td class="last"><%=list.get(i).getNotice_readcount() %></td>
									</tr>
									<%
										}
									}
									%>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="noticeWrite.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
								<div class='page'><%=Page.getPageList(vo.getPage(), totalpage, "noticeList.do")%></div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="noticeList.do"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all"<c:if test="${vo.searchOption == 'all'}">selected</c:if>>전체</option>
										<option value="title"<c:if test="${vo.searchOption == 'title'}">selected</c:if>>제목</option>
										<option value="contents"<c:if test="${vo.searchOption == 'contents'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="sval" value="${vo.keyword}" title="검색할 내용을 입력해주세요" />
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
</div>
<!--//wrap -->

</body>
</html>