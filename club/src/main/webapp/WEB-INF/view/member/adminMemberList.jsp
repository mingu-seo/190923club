<%@page import="joinSpot.JoinSpotVO"%>
<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="util.Page"%>
<% 
List<MemberVO> memberList = (List<MemberVO>)request.getAttribute("memberList");
MemberVO vo = (MemberVO)request.getAttribute("vo");
JoinSpotVO jv = (JoinSpotVO)request.getAttribute("js");
int listcount = (Integer)request.getAttribute("listcount"); // 전체 갯수 (model에 저장한 "listcount")
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체페이지수 (model에 저장한 "totalpage")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function drop() {
	if (confirm("선택된 회원을 회원삭제하겠습니까?")) {
		$("#frm").attr("action", "memberDelete.do");
		$("#frm").submit();
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
					<h2>전체 회원 리트스</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=listcount%>개</strong>  |  <%=vo.getPage()%>/<%=totalpage%>페이지</span></p>
							<form name="frm" id="frm" action="qnaGroupDelete.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w1" />
				                    <col class="w2" />
				                    <col class="w5" />
				                    <col class="w4" />
				                    <col class="w5" />
				                    <col class="w10"/>
				                    <col class="w5" />
				                    <col class="w6" />
				                    <col class="w4" />
								</colgroup>
								<thead>
									<tr>
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
								<%
									if(listcount > 0 ){
								%>
								<%
				                for (int i=0; i<memberList.size(); i++) {
				                %>
			                    <tr>
			                        <td class="first"><input type="checkbox" name="num" id="no" value="<%=memberList.get(i).getNum()%>"/></td>
			                        <td><%=memberList.get(i).getNum()%></td>
			                        <td class="profileImg"><img style="width: 90px; height: 90px;" src="/profileImg/<%=memberList.get(i).getProfile()%>"></td>
			                        <td><%=memberList.get(i).getId() %></td>
			                        <td><%=memberList.get(i).getName() %></td>
			                        <td><%=memberList.get(i).getBirth() %></td>
			                        <td><% if(memberList.get(i).getGender()==1){ %>남자
			                        	<%} else if(memberList.get(i).getGender()==2) { %>여자<%} %>
			                        </td>
			                        <td class="last"><%=memberList.get(i).getTel() %></td>
			                        <td><% if(memberList.get(i).getState()==2){ %>활동중
			                        	<%} else if(memberList.get(i).getState()==3) { %>휴면<%} %>
			                        </td>
			                    </tr>
			                <%
				                }
			                } else {
			                %>
			                	<tr>
			                		<td colspan="9">회원이 없습니다.</td>
			                	</tr>
			                <%} %>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnRight">
									<a class="btns" href="javascript:;" onclick="drop();"><strong>회원삭제</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
								<div style="text-align: center">
									<%=Page.getMemberPageList(vo.getPage(), totalpage, "adminMemberList.do?searchword="+vo.getSearchword()+"&stype="+vo.getStype()) %>
								</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="adminMemberList.do" method="post">
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