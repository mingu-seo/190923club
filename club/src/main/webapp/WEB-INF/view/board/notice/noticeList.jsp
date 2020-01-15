<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/club/css/board/writing.css">
   <%@ include file="/WEB-INF/view/board/submain/head.jsp" %>
</head>
<body>


    <div class="wrap">
    	<%@ include file="/WEB-INF/view/board/submain/header.jsp" %>
       
        <%@ include file="/WEB-INF/view/board/submain/menu.jsp" %>
       
      
        <div class="visual">
		
        	<div class="visualLeft">
        		<%@ include file="/WEB-INF/view/board/submain/boardLeft.jsp" %>
        	</div>
        	
        	
	        <div class="visualRight">
		        	<div class="board_ctg_name">게시판 목록</div><!-- 카테고리 이름 -->
					<div class="board_writing"><a href="noticeWrite.do">글작성</a></div>
			
					<div class="board_seq">
					<select>
						 	<option value="최신순">최신순</option>
						 	<option value="좋아요순">좋아요순</option>
						 	<option value="조회수순">조회수순</option>
					</select>
					
					<select>
						 	<option value="오름차순">오름차순</option>
						 	<option value="내림차순">내림차순</option>
					</select>
					</div>
		
		
					<div class="board_list_box">
						<table id="boardList">
							<tr class="board_top">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>좋아요</th>
								<th>조회</th>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>10</td>
								<td class="art_title">가나다라마바사아자차카타파하언제까지길게써야되는거야 아...</td>
								<td>조한빈</td>
								<td>2020.01.15.</td>
								<td>11</td>
								<td>24</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>9</td>
								<td class="art_title">오빠따라서 방콕을 갈까 말까 </td>
								<td>김세영</td>
								<td>2020.01.11.</td>
								<td>21</td>
								<td>365</td>
							</tr> 
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>8</td>
								<td class="art_title">제목 불러오기</td>
								<td>조한빈</td>
								<td>2020.01.29.</td>
								<td>55</td>
								<td>451</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>7</td>
								<td class="art_title">제목 불러오기</td>
								<td>손슬기</td>
								<td>2020.01.01.</td>
								<td>61</td>
								<td>3</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>6</td>
								<td class="art_title">제목 불러오기</td>
								<td>김세영</td>
								<td>2020.01.14.</td>
								<td>77</td>
								<td>755</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>5</td>
								<td class="art_title">제목 불러오기</td>
								<td>서주찬</td>
								<td>2020.01.05.</td>
								<td>14</td>
								<td>65</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>4</td>
								<td class="art_title">제목 불러오기</td>
								<td>김세영</td>
								<td>2020.01.08.</td>
								<td>98</td>
								<td>91</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>3</td>
								<td class="art_title">제목 불러오기</td>
								<td>손슬기</td>
								<td>2020.01.14.</td>
								<td>61</td>
								<td>22</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>2</td>
								<td class="art_title">제목 불러오기</td>
								<td>서주찬</td>
								<td>2020.01.14.</td>
								<td>8</td>
								<td>2354</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							<tr class="board_art">
								<td>1</td>
								<td class="art_title">제목 불러오기</td>
								<td>조한빈</td>
								<td>2020.01.14.</td>
								<td>1</td>
								<td>575</td>
							</tr>
							
							<tr>
								<td colspan="6" class="board_line"></td>
							</tr>
							
							
						</table>
					</div>
	
				 <div class="boardSearch">
					 	<select class="search_ctg">
					 	<option value="작성자">작성자</option>
					 	<option value="제목">제목</option>
					 	<option value="내용">내용</option>
					 	</select>
					 	
						<input type="text" name="boardSearch" id="boardSearch">
						 
						<input id="board_search_btn" type="submit" value="검색">
				</div>	
	
				<div id="pageList">
					<span>[이전]</span>
					<span><a href="">1</a></span>
					<span><a href="">2</a></span>
					<span><a href="">3</a></span>
					<span><a href="">4</a></span>
					<span>[다음]</span>
				</div>
				
	        </div>
   		</div>
        
       
        
    </div>
     <%@ include file="/WEB-INF/view/board/submain/footer.jsp" %>
</body>
</html>