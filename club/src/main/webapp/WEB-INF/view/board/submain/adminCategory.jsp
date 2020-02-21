<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="category.CategoryVO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
List<CategoryVO>[] categoryList = (List<CategoryVO>[])request.getAttribute("categoryList"); 
int joinSpotCnt = (Integer)request.getAttribute("joinSpotCnt");
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
	
	//DB에 저장되지 않은 카테고리 삭제하는 기능
	$(".deleteBtn").click(function() {
		console.log("click");
		var idx = $(this).index(".deleteBtn");
		$(".boardAdd").eq(idx).remove();
	});
}
//DB에 저장되어있는 카테고리와 정보들을 삭제하는 기능
$(function() {
	$(".deleteBtn").click(function() {
		var idx = $(this).index(".deleteBtn"); 
		if(confirm("카테고리를 삭제하시면 해당 카테고리 안의 내용을 모두 잃게됩니다.\n그래도 삭제하시겠습니까?")) {
			$.ajax({
				async : false,
				url : '/board/categoryDelete.do',
				data : { //input태그이면서 name이 category_ids인 인덱스 몇번째의 데이터를 가져오는것
					'category_id': $("input[name='category_ids']").eq(idx).val(), 
				},
				dataType:'HTML',
				success: function(data) {
					$(".boardAdd").eq(idx).remove();
					alert("삭제되었습니다.");
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
/* 
function check() {
	if($(".addBox").val().trim()=="") {
		alert("카테고리명을 작성해주세요.")
		$(".addBox").focus();
		return false;
	}
	$(".category_form").submit();
} */
</script>
<body>


	<!-- S T A R T :: headerArea-->
	<%@ include file="/WEB-INF/view/board/include/newheader.jsp" %>
	<!-- E N D :: headerArea-->
    <div class="wrap">
	
	<div class="main">
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
	        				<a href="javascript:;" onclick="addBox(0)"><img class="add" src="/img/board/plus1.png"></a>
	        				<span class="cgAdd">카테고리 추가</span> 
	        				</div> 
	        				<%
	        				for(int i=0; i<categoryList[0].size(); i++) {
	        				%>
	        				<div class="boardAdd">  
		        				<input class="addBox" type="text" name="name" value="<%=categoryList[0].get(i).getName()%>">
		        				<input type="hidden" name="category_ids" value="<%=categoryList[0].get(i).getCategory_id()%>">  
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
	        				<a href="javascript:;" onclick="addBox(1)"><img class="add" src="/img/board/plus1.png"></a> 
	        				<span class="cgAdd">카테고리 추가</span> 
	        				</div>
	        				
	        				<%
	        				for(int i=0; i<categoryList[1].size(); i++) {
	        				%>
	        				<div class="boardAdd"> 
		        				<input class="addBox" type="text" name="name" value="<%=categoryList[1].get(i).getName()%>">
		        				<input type="hidden" name="category_ids" value="<%=categoryList[1].get(i).getCategory_id()%>">  
		        				<input class="categoryBtn deleteBtn" type="button" value="삭제">
	        				</div>
	        				<%
	        				}
	        				%>
	        				 
	        			</div>
	        			<div class=""><input type="submit" class="btns" value="저장"></div>
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
	        				<a href="javascript:;" onclick="addBox(2)"><img class="add" src="/img/board/plus1.png"></a>
	        				<span class="cgAdd">카테고리 추가</span>  
	        				</div> 
	        				<%
		        				for(int i=0; i<categoryList[2].size(); i++) {
		        				%>
		        				<div class="boardAdd"> 
			        				<input class="addBox" type="text" name="name" value="<%=categoryList[2].get(i).getName()%>">
			        				<input type="hidden" name="category_ids" value="<%=categoryList[2].get(i).getCategory_id()%>">
			        				<input class="categoryBtn deleteBtn" type="submit" value="삭제"> 
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
    </div>
		<!-- S T A R T :: footerArea-->
		<%@ include file="/WEB-INF/view/board/include/bottom.jsp" %>
		<!-- E N D :: footerArea-->
   </div>
</body>
</html>