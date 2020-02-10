<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="category.CategoryVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
List<CategoryVO> gcList = (List<CategoryVO>)request.getAttribute("gcList"); 
List<CategoryVO> wcList = (List<CategoryVO>)request.getAttribute("wcList"); 
List<CategoryVO> ncList = (List<CategoryVO>)request.getAttribute("ncList"); 
%>
<!DOCTYPE html>
<html> 
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/board/writing.css"> 
   <%@ include file="/WEB-INF/view/board/include/headHtml.jsp" %>
</head>
<script>
function addBox(idx) {
	var txt = '<div class="boardAdd">';
	txt += '<input class="addBox" type="text" name="name" placeholder="추가하세요!">&nbsp;';
	txt += '<input class="categoryBtn deleteBtn" type="button" value="삭제">';
	txt += '<input type="hidden" name="category_ids" value="">';
	txt += '</div>';
	$(".boardBox").eq(idx).append(txt);
	
	//이벤트 중첩 방지 
	$(".deleteBtn").off("click");
	
	$(".deleteBtn").click(function() {
		console.log("click");
		var idx = $(this).index(".deleteBtn");
		$(".boardAdd").eq(idx).remove();
	});
}

$(function() {
	$(".deleteBtn").click(function() {
		if(confirm("삭제하시면 해당 카테고리 안의 내용이 모두 삭제됩니다. 그래도 삭제하시겠습니까?")) {
			$.ajax({
				async : false,
				url : '삭제url',
				data : {
					'spot_num': spot_num,
					'board_id': 3
				},
				dataType:'HTML',
				success: function(data) {
					var idx = $(this).index(".deleteBtn");
					$(".boardAdd").eq(idx).remove();
				},
				error:function(data) {
					console.log(data);
				}
			});
		}else {
			return false;
		}
		
	});
});
</script>
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
        		<div class="visualRightInner">
        			<div id="categorySet">카테고리 설정
        			
        			</div>
        			
        			<div class="boardTitle">
        				<h1>▼ 갤러리</h1>
        			</div>
        			
        			<form action="/board/categoryInsert.do" method="post"> 
        				<input type="hidden" name="board_id" value="1">
        				<input type="hidden" name="spot_num" value="<%=spot_num%>">
        				
	        			<div class="boardBox"> 
	        				<div> 
	        				<a href="javascript:;" onclick="addBox(0)"><img class="add" src="/img/board/plus.png"></a>
	        				<span class="cgAdd">카테고리 추가</span> 
	        				</div> 
	        				<%
	        				for(int i=0; i<gcList.size(); i++) {
	        				%>
	        				<div class="boardAdd"> 
		        				<input class="addBox" type="text" name="name" value="<%=gcList.get(i).getName()%>"> 
		        				<input class="categoryBtn deleteBtn" type="button" value="삭제">
	        				</div>
	        				<%
	        				}
	        				%>
	        				
	        			</div>
	        			
	        			<div class=""><input class="btns" type="submit" value="저장"></div>
        			</form>
        		<hr>
        		
        		<!-- 자유게시판 영역 -->
        		<div class="boardTitle">
        				<h1>▼ 자유게시판</h1>
        			</div>
        			<form action="/board/categoryInsert.do" method="post">
        			<input type="hidden" name="board_id" value="2"> 
        			<input type="hidden" name="spot_num" value="<%=spot_num%>">
        			
	        			<div class="boardBox">
	        				<div>
	        				<a href="javascript:;" onclick="addBox(1)"><img class="add" src="/img/board/plus.png"></a> 
	        				<span class="cgAdd">카테고리 추가</span> 
	        				</div>
	        				
	        				<%
	        				for(int i=0; i<wcList.size(); i++) {
	        				%>
	        				<div class="boardAdd"> 
		        				<input class="addBox" type="text" name="name" value="<%=wcList.get(i).getName()%>">
		        				<input type="hidden" name="category_ids" value="<%=wcList.get(i).getCategory_id()%>">  
		        				<input class="categoryBtn deleteBtn" type="button" value="삭제">
	        				</div>
	        				<%
	        				}
	        				%>
	        				 
	        			</div>
	        			<div class=""><input class="btns" type="submit" value="저장"></div>
        			</form>
        		<hr>
        		
        		<!-- 공지사항 영역 -->
        		<div class="boardTitle">
        				<h1>▼ 공지사항</h1> 
        			</div>
        			<form action="/board/categoryInsert.do" method="post">
        			<input type="hidden" name="board_id" value="3">
        			<input type="hidden" name="spot_num" value="<%=spot_num%>">
	        			<div class="boardBox">
	        				<div>
	        				<a href="javascript:;" onclick="addBox(2)"><img class="add" src="/img/board/plus.png"></a>
	        				<span class="cgAdd">카테고리 추가</span> 
	        				</div>
	        				<%
		        				for(int i=0; i<ncList.size(); i++) {
		        				%>
		        				<div class="boardAdd"> 
			        				<input class="addBox" type="text" name="name" value="<%=ncList.get(i).getName()%>">
			        				<input type="hidden" name="category_ids" value="<%=ncList.get(i).getCategory_id()%>">
			        				<input class="categoryBtn deleteBtn" type="button" value="삭제">
		        				</div>
		        				<%
		        				}
		        				%>
	        			</div>
	        			<div class=""><input class="btns" type="submit" value="저장"></div>
        			</form>
        		</div> 
        </div>
       
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
   </div>
</body>
</html>