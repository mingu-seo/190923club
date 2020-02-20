<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="joinSpot.JoinSpotVO"%>
<%@page import="util.Page"%>
<%@page import="java.util.List"%>
<% 
List<MemberVO> memberList = (List<MemberVO>)request.getAttribute("memberList");
MemberVO vo = (MemberVO)request.getAttribute("vo");
JoinSpotVO jv = (JoinSpotVO)request.getAttribute("js");
int listcount = (Integer)request.getAttribute("listcount"); // 전체 갯수 (model에 저장한 "listcount")
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체페이지수 (model에 저장한 "totalpage")
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
<link rel="stylesheet" href="/css/test/board.css"> 
<link rel="stylesheet" href="/css/test/memberList.css">
<script>
function sleep() {
	if (confirm("선택된 회원을 휴면처리하겠습니까?")) {
		$("#frm").attr("action", "spotMemberSleep.do");
		$("#frm").submit();
	}
}
function wake() {
	if (confirm("선택된 회원을 활성화하겠습니까?")) {
		$("#frm").attr("action", "spotMemberWake.do");
		$("#frm").submit();
	}
}
function drop() {
	if (confirm("선택된 회원을 강제탈퇴하겠습니까?")) {
		$("#frm").attr("action", "spotMemberDelete.do");
		$("#frm").submit();
	}
}
</script>
</head>
<body>
	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
    <div class="wrap">
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
        <div class="visual">
        	<!-- 왼쪽메뉴 -->
        	<%@ include file="/WEB-INF/view/board/submain/submainLeft.jsp" %>
        	<!-- 왼쪽메뉴 -->
        	<div class="visualRight">
        		<div class="content">
            		<form name="frm" id="frm" action="spotMemberSleep.do" method="post">
            			<input type="hidden" name="spot_num" value="<%=spot_num%>">
			            <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
			                <colgroup>
			                    <col class="w5" />
			                    <col class="w5" />
			                    <col class="w5" />
			                    <col class="w4" />
			                    <col class="w5" />
			                    <col class="w10"/>
			                    <col class="w5" />
			                    <col class="w6" />
			                    <col class="w4" />
			                </colgroup>
			                <thead>
			                    <tr class="tableTitle">
			                        <th scope="col" class="first">선택</th>
			                        <th scope="col">번호</th>
			                        <th scope="col">사진</th> 
			                        <th scope="col">아이디</th> 
			                        <th scope="col">이름</th> 
			                        <th scope="col">생년월일</th> 
			                        <th scope="col">성별</th> 
			                        <th scope="col">휴대전화</th>
			                        <th scope="col" class="last">상태</th>
			                    </tr>
			                </thead>
			                <tbody>
			                <%
			                for (int i=0; i<memberList.size(); i++) {
			                %>
			                    <tr>
			                        <td class="first"><input type="checkbox" name="joinspot_num" id="no" value="<%=memberList.get(i).getJoinspot_num()%>"/></td>
			                        <td><%=memberList.get(i).getJoinspot_num()%></td>
			                        <td class="profileImg"><img src="/profileImg/<%=memberList.get(i).getProfile()%>"></td>
			                        <td><%=memberList.get(i).getId() %></td>
			                        <td><%=memberList.get(i).getName() %></td>
			                        <td><%=memberList.get(i).getBirth() %></td>
			                        <td><% if(memberList.get(i).getGender()==1){ %>남자
			                        	<%} else if(memberList.get(i).getGender()==2) { %>여자<%} %>
			                        </td>
			                        <td class="last"><%=memberList.get(i).getTel() %></td>
			                        <td><% if(memberList.get(i).getJoinspot_grade()==2){ %>활동중
			                        	<%} else if(memberList.get(i).getJoinspot_grade()==3) { %>휴면<%} %>
			                        </td>
			                    </tr>
			                <%
			                }
			                %>
			                </tbody>
			            </table>
		            </form>
					<!-- 페이징 처리 -->
						<div class='page'>
							<%=Page.getMemberPageList(vo.getPage(), totalpage, "memberList.do?spot_num="+request.getAttribute("spot_num")+"&searchword="+vo.getSearchword()+"&stype="+vo.getStype()) %>
						</div> 
					<!--btn-->
		            <div class="btn">
						<div class="btnRight">
							<a class="btns" href="javascript:;" onclick="drop();"><strong>강제 탈퇴</strong> </a>
							<a class="btns" href="javascript:;" onclick="sleep();"><strong>휴면</strong> </a>
							<a class="btns" href="javascript:;" onclick="wake();"><strong>활성화</strong> </a>
						</div>
						<!-- 페이징 처리 -->
						<form name="searchForm" id="searchForm" action="memberList.do?spot_num=<%=spot_num %>" method="post">
							<div class="search">
								<select name="stype" title="검색을 선택해주세요">
									<option value="all"<%if("all".equals(vo.getStype())) { %>selected<%} %>>전체</option>
									<option value="name"<%if("name".equals(vo.getStype())) { %>selected<%} %>>이름</option>
									<option value="id"<%if("id".equals(vo.getStype())) { %>selected<%} %>>아이디</option>
								</select>
								<input type="text" name="searchword" value="<%=vo.getSearchword()==null ? "" : vo.getSearchword() %>" title="검색할 내용을 입력해주세요" />
								<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
							</div>
						</form>  
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