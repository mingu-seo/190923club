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
                <a href="categoryDetail.do?num=<%=list.get(i).getNum() %>" class="categorybox"><%=list.get(i).getName()%></a> 
            </div>    
           	<%
			}
			%>	
        </div>
    </div>  
    </form>

</div>
</body>
</html>