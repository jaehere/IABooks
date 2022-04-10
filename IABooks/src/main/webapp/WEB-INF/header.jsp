<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

	<title>header</title>
	
	<%-- Required meta tags --%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<%-- Bootstrap CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<%-- Bootstrap Icons --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	
	<%-- Font Awesome 5 Icons --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<%-- 직접 만든 CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/product/style_header_footer.css" />
	
	<%-- Optional JavaScript --%>
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	
	<script type="text/javascript">	
		$(document).ready(function() {
 			
			$("input#searchWord").bind("keyup", function(event) {
				if(event.keyCode == 13) {
					goSearch();
				}
			});//end of $("input#searchWord").bind("keyup", function(event)
			 
		});//end of $(document).ready(function()
 		
		function goSearch() {
			if($("input#searchWord").val().trim() == "") {
				alert("검색어를 입력하세요.");
				return; 
			}
			const frm = document.searchBarForm;
			frm.action = "<%= ctxPath%>/product/search.book";
			frm.method = "get";
			frm.submit();
						
		}//end of function goSearch()	
		
		function goCart() {
			const frm = document.createElement('form');
			document.body.appendChild(frm);
			frm.action = "<%= ctxPath%>/product/cart.book";
			frm.method = "post";
			frm.submit();
		};
	</script>
	
</head>

<body>

<%-- Header--%>
<%-- 상단nav : 로그아웃, 관리자 부분추가필요 (장바구니 갯수 보이게수정)--%>
<header>

	<div class="container">
		<nav id="navbar" class="navbar">
			<ul class="justify-content-end ml-auto"> 
          		<c:if test="${empty sessionScope.loginuser}"><li class="bar"><a class="nav-link scrollto" href="<%= ctxPath%>/login/join.book">로그인</a></li></c:if>
          		<c:if test="${not empty sessionScope.loginuser}"><li class="bar"><a class="nav-link scrollto" href="<%= ctxPath%>/login/logout.book">로그아웃</a></li></c:if>
          		<c:if test="${empty sessionScope.loginuser}"><li class="bar bulkhead"><a class="nav-link scrollto" href="<%= ctxPath%>/member/memberRegister.book">회원가입</a></li></c:if>
          		<c:if test="${not empty sessionScope.loginuser}"><li class="bar bulkhead"><a class="nav-link scrollto" href="<%= ctxPath%>/member/memberUpdate.book">정보수정</a></li></c:if>
				<li class="bar bulkhead"><a class="" onclick="goCart()"style="cursor: pointer;">장바구니</a></li>
           		<c:if test="${not empty sessionScope.loginuser and sessionScope.loginuser.userid eq 'admin'}"> <%-- admin으로 로그인했으면 --%>
					<li class="dropdown bulkhead"><a href="#" >관리자전용<i class="bi bi-chevron-down dropdown-indicator" ></i></a>
						<ul>
							<li><a href="<%= ctxPath%>/member/memberList.book">회원목록</a></li>
							<li><a href="<%= ctxPath%>/product/admin/productRegister.book">제품등록</a></li>
							<li><a href="#">전체주문내역</a></li>
							<li><a href="<%= ctxPath%>/board/admin/adminBoard.book">게시판관리</a></li>
						</ul>
					</li>
				</c:if>
           		
           		<li class="dropdown bulkhead"><a href="<%= ctxPath%>/member/myPage.book" >마이페이지<i class="bi bi-chevron-down dropdown-indicator" ></i></a>
					<ul>
						<li><a href="#">주문조회</a></li>
						<li><a href="#">배송조회</a></li>
						<li><a href="#">관심상품</a></li>
						<li><a href="<%= ctxPath%>/member/myBoard.book">내게시물</a></li>
            		</ul>
          		</li>
          
				<li class="dropdown bulkhead"><a href="#">고객센터<i class="bi bi-chevron-down dropdown-indicator"></i></a>
            		<ul>
              			<li><a href="<%= ctxPath%>/board/faqAccordion.book">자주 묻는 질문</a></li>
						<li><a href="<%= ctxPath%>/board/qnaBoard.book">1:1문의</a></li>
					</ul>
				</li>	
			</ul>
        	<i class="bi bi-list mobile-nav-toggle d-none"></i>
		</nav>
	</div>
</header>

<div class="divClear"></div>

<%-- 로고 및 검색바 : 디자인수정--%>
	<br>
	<br>
	<div class="container">    
		<div class="d-none d-lg-block">
			<a href="<%= ctxPath%>/index.book" style="display: inline-block;">
				<img src="<%= ctxPath%>/images/product/logo.png" alt="로고"/>
	    	</a>
	       
			<div class="search_section">
				<form class="searchBarForm" name="searchBarForm" >
		      		<input type="text" class="inputTypeText" id="searchWord" name="searchWord" >
		      		<input type="text" style="display: none;" />	
				</form> 
				<input type="image" class="inputTypeImage" onclick="goSearch()" src="<%= ctxPath%>/images/product/search_btn.png"> 	
			</div>
		</div>	
	</div>	

<%-- 중앙nav : 디자인수정 리뷰게시판 위치 수정--%>
<div class="container">
	<div id="categorie">
		<nav id="navbar2" class="navbar">
			<ul class="justify-content-start">     
				<li class="dropdown"><a class="" href="#">카테고리 전체보기<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="<%= ctxPath%>/product/showBookList.book?category=total">종합</a></li>
						<li><a href="<%= ctxPath%>/product/showBookList.book?category=humanities">인문</a></li>
						<li><a href="<%= ctxPath%>/product/showBookList.book?category=society">사회</a></li>
						<li><a href="<%= ctxPath%>/product/showBookList.book?category=science">과학</a></li>
						<li><a href="<%= ctxPath%>/product/showBookList.book?category=other">기타</a></li>
						<li><a href="<%= ctxPath%>/board/reviewBoard.book">리뷰</a></li>
            		</ul>
          		</li>		
				
          		<li class=""><a class="" href="<%= ctxPath%>/product/showBest20.book">Best 20</a></li>
				<li class="bulkhead"><a class="" href="<%= ctxPath%>/product/showNewBook.book">신간</a></li>
				<li class="bulkhead"><a class="" href="<%= ctxPath%>/product/showRestock.book">재입고</a></li>
          		<li class="bulkhead"><a class="" href="<%= ctxPath%>/product/showOldBook.book">구간의 재발견</a></li>	
			</ul>
		</nav>
	</div>
</div>
