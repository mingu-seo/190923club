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
</head>
<body>
<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
     <h3>카테고리 선택 후, 나만의 SPOT을 만들어보세요!</h3>
<!-- E N D :: headerArea-->
<div class="wrap">
  	<form  action="process.do" method="post">
    <div class="categorycontainer">

        <div class="center">
        	<%
			for (int i=0; i<list.size(); i++){
			%>
            <div class="button">
                <a href="/spot/spotRegist.do?num=<%=list.get(i).getNum() %>" class="categorybox"><%=list.get(i).getName()%></a> 
            </div>    
           	<%
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