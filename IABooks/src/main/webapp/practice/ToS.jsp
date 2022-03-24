<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	String ctxPath = request.getContextPath();
	
%>
<style type="text/css">

</style>

	  
<meta charset="UTF-8">
<title>이용약관</title>



<jsp:include page="../header.jsp"/>


<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jaehee_pages/semicss/semi_style.css" />

<style type="text/css">

	#ToS_outer {
		width: 100%;
		border: solid 1px #d7d5d5;
		background-color: #fbfafa;
		min-height: 1000px;
	}
	
	
	#ToS_inner {
		padding: 20px;
	    border: 1px solid #e8e8e8;
	    color: #404040;
	    min-height: 980px;
	}
	
	#ToS_content {
		padding: 20px;
	    border: 1px solid #d7d5d5;
	    background-color: #fff;
	    min-height: 960px;
	    font-size: 14px;
	}
	
	/* ToS.jsp 서식 끝  */

</style>

<script type="text/javascript">
		
		$(document).ready(function(){
			
		});
	
	</script>

 <div class="container">
  	<div class="title" >
	  	<div class="title_icon" ><img src="<%= ctxPath%>/jaehee_pages/semi_images/ico_heading.gif" /></div>
	  	<h2>이용약관</h2>
   
  	</div>
  	
  	<div id="ToS_outer">
  		
  		<div id="ToS_inner">
  			
  			<div id="ToS_content">
  				<p>
  					제1조(목적)
					이 약관은 주식회사 연지출판사(전자상거래 사업자)가 운영하는 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
					※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
  				</p>
  				
  			</div>
  			
  		</div>
  		
  	</div>




</div> <!-- container 끝 -->


<jsp:include page="../footer.jsp"/>