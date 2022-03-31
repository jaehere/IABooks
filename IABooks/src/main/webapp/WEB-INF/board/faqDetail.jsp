<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	String ctxPath = request.getContextPath();
	
%>
<style type="text/css">

</style>

	  
<meta charset="UTF-8">
<title>상품 Q&A</title>

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/board/jeong_css/semi_style.css" />

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<script type="text/javascript">
	
	$(document).ready(function(){
		
	
	});

</script>


<jsp:include page="/WEB-INF/header.jsp"/>
    


	
 <div class="container">
	
	<div class="content">
	    
	<div class="title" >
		  	<div class="title_icon" ><img src="<%= ctxPath%>/images/board/jeonghm_images/ico_heading.gif" /></div>
		  	<h2>FAQ</h2>
		  	<div class="bar_icon" ><img src="<%= ctxPath%>/images/board/jeonghm_images/bar_eee.gif" /></div>
		  	<span >이용안내 FAQ입니다.</span>
	    
	   </div>
	   			<c:set var="faqVO" value="${requestScope.faqVO}" />
				<table class=" review_table table_content">
				  	<tbody>
				    <tr>
				      <th class="col-2" >제목</th>
				      <td class="col-10 subject" id="td_left" >${faqVO.faq_title}</td>
				    </tr>
				  	
				    <tr>
				      <th>작성자</th>
				      <td class="writer" id="td_left" >${faqVO.faq_writer}</td>
				    </tr>
				    <tr>
				      
				      <td colspan="2" class="td_content">
				      	<div class="detail detail_contents">
				      		<div class="fr-view fr-view-article">
								${faqVO.faq_contents}	
							</div>
				      	</div>
				      
				      </td>
				    
				    
				    </tr>
				    </tbody>
				  
				</table>
			
			<div class="buttons">
				
				<button class="btn btn_list" type="button" onclick="location.href='<%= ctxPath%>/board/faqBoard.book'">목록</button>
				<button class="btn btn_update" type="button" onclick="location.href='<%= ctxPath%>/board/faqUpdate.book'">수정</button>
				<button class="btn btn_delete" type="button" onclick="location.href='<%= ctxPath%>/board/faqDelete.book'">삭제</button>	
				
			</div>
			
			<div class="prev_next table table-responsive">
				<table class="prev_next">
					<tbody>
						<tr>
							<th><img src="<%=ctxPath%>/images/board/jeonghm_images/ico_move_prev.gif" id="img_prev" />
							<a href="<%= ctxPath%>/board/faqDetail.book?pk_faq_board_num=${(board.pk_faq_board_num)-1}">이전글</a></th>
							<td id="td_left" class="board_prev"><a href=""></a></td>
						</tr>
						<tr>
							<th><img src="<%=ctxPath%>/images/board/jeonghm_images/ico_move_next.gif" id="img_next" />
							<a href="<%= ctxPath%>/board/faqDetail.book?pk_faq_board_num=${(board.pk_faq_board_num)+1}">다음글</a></th>
							<td id="td_left" class="board_next"><a href=""></a></td>
						</tr>
					</tbody>
					
				</table>
			</div>
		
	</div>	
			
</div> <!-- container 끝 -->
		
		
		

<jsp:include page="/WEB-INF/footer.jsp"/>

