<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
	String ctxPath = request.getContextPath();
%>
<title>적립금</title>

<jsp:include page="/WEB-INF/header.jsp"/>


	<!-- 내가만든 CSS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/member/style_member.css" />

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css">
	
	<!-- Optional JavaScript-->
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">


	
</script>

<style type="text/css">

td.pointTable {
	padding: 50px;
}

table.pointTable tbody > tr > td:first-child {
	text-align: right;
}

span.pointTable {
	font-size: 16pt;
	font-weight: bold;
	text-align: left;
	color: #00bbcc;
}

</style>


<div class="container">
	<br>
	&nbsp;<strong style="font-size: 16pt;"><img src="<%= ctxPath%>/images/member/ico_heading.gif" style="width: 6px; height: 20px;"  /> 적립금 </strong> &nbsp;
	<img src="<%= ctxPath%>/images/bar_eee.gif" style="width: 2px; height: 20px;" /> &nbsp; 고객님의 사용가능한 적립금 입니다.
	<hr style="border: solid 2px #e8e8e8;">
	
	<table class="pointTable">
			<tr >
				<td class="pointTable" width="50%;">
					<strong><img src="<%= ctxPath%>/images/member/arrow_menu.gif" /> 보유 적립금</strong>
				</td>
				<td class="pointTable" >
					<span class="pointTable"><fmt:formatNumber type="number" pattern="###,###">${requestScope.mileage}</fmt:formatNumber>원</span>
				</td>
			</tr>
	</table>
		
		
		<!-- 여기부터 탭  -->	
	
		<!-- 탭을 토글 가능하게 만들려면 각 링크에 data-toggle="tab" 속성을 추가하십시오. 
		         그런 다음 모든 탭에 대해 고유한 ID가 있는 .tab-pane 클래스를 추가하고 .tab-content 클래스가 있는 <div> 요소 안에 래핑합니다.
        -->
		
		<ul class="nav nav-tabs navbar-expand-sm bg-light navbar-light">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="tab" href="#menu1">전체</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#menu2">적립</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="tab" href="#menu3">사용</a>
		  </li>
		</ul>
		
		<!-- Tab panes -->
		<div class="tab-content py-3">
		  <!-- 적립내역보기 -->
		  <div class="tab-pane container active" id="menu1">
		    <table class="point_menu">
		    	<thead>
		    		<tr align="center">
						<td>번호</td>
						<td>유형</td>
						<td>주문날짜</td>
						<td>적립금</td>
						<td>관련주문</td>
						<td>내용</td>
		    		</tr>
		    	</thead>
		    	<tbody>
		    		 <c:if test="${not empty requestScope.mileageList}">
				   	  	  <c:forEach var="map" items="${requestScope.mileageList}" varStatus="i">
				   	  	  	  <tr align="center">
					   	  	  	 <td>${i.index+1}</td>
				   	  	  	  	 <td>	
					   	  	  	  	<c:choose>
					   	  	  	  	  <c:when test="${map.MILEAGEINFO > 0}">
					   	  	  	  			<span style="color:blue;">적립</span>
					   	  	  	  	  </c:when>
					   	  	  	  	  <c:otherwise>
					   	  	  	  			<span style="color:red;">사용</span>
					   	  	  	  	  </c:otherwise>
					   	  	  	  	</c:choose> 
				   	  	  	  	  </td>
				   	  	  	  	  <td>
				   	  	  	  	  <c:choose>
					   	  	  	  	  <c:when test="${map.MILEAGEINFO > 0}">
					   	  	  	  			<span style="color:blue;">${map.MILEAGEINFO}</span>
					   	  	  	  	  </c:when>
					   	  	  	  	  <c:otherwise>
					   	  	  	  			<span style="color:red;">${map.MILEAGEINFO}</span>
					   	  	  	  	  </c:otherwise>
					   	  	  	  </c:choose> 
				   	  	  	  	  </td>
				   	  	  	  	  <td>${map.ODRCODE}</td>
				   	  	  	  	  <td>${map.PRO_NAME}</td>
				   	  	  	  	  <td>${map.ODR_DATE}</td>
				   	  	  	  </tr>
				   	  	  </c:forEach>
			   	  	  </c:if>
			   	  	  <c:if test="${empty requestScope.mileageList}">
			    		<tr>
			    			<td colspan="5" align="center"><span>적립금내역이없습니다.</span></td>
			    			<!-- 나중에 데이터값에 따라 태그 수정 -->
			    		</tr>
		    		  </c:if>
		    	</tbody>
		    </table>
			    <nav class="my-5">
				   	<div style="display: flex; width: 100%;">
			    		<ul class="pagination" style='margin:auto;'>
			    			${requestScope.pageBar}
			    		</ul>
			    	</div>
			    </nav>    
		 	 </div>
		  
		  <!-- 적립 -->
		  <div class="tab-pane container" id="menu2">
		     <table class="point_menu">
		    	<thead >
		    		<tr align="center">
						<td>번호</td>
						<td>유형</td>
						<td>주문날짜</td>
						<td>적립금</td>
						<td>관련주문</td>
						<td>내용</td>
		    		</tr>
		    	</thead>
		    	<tbody class="menu">
		    		<c:if test="${not empty requestScope.mileageList2}">
				   	  	  <c:forEach var="map" items="${requestScope.mileageList2}" varStatus="i">
				   	  	  	  <tr align="center">
				   	  	  	  	<td>${i.index+1}</td>
				   	  	  	  	 <td>	
					   	  	  	  	<c:choose>
					   	  	  	  	  <c:when test="${map.MILEAGEINFO > 0}">
					   	  	  	  			<span style="color:blue;">적립</span>
					   	  	  	  	  </c:when>
					   	  	  	  	  <c:otherwise>
					   	  	  	  			<span style="color:red;">사용</span>
					   	  	  	  	  </c:otherwise>
					   	  	  	  	</c:choose> 
				   	  	  	  	  </td>
				   	  	  	  	  <td>
				   	  	  	  	  <c:choose>
					   	  	  	  	  <c:when test="${map.MILEAGEINFO > 0}">
					   	  	  	  			<span style="color:blue;">${map.MILEAGEINFO}</span>
					   	  	  	  	  </c:when>
					   	  	  	  	  <c:otherwise>
					   	  	  	  			<span style="color:red;">${map.MILEAGEINFO}</span>
					   	  	  	  	  </c:otherwise>
					   	  	  	  </c:choose> 
				   	  	  	  	  </td>
				   	  	  	  	  <td>${map.ODRCODE}</td>
				   	  	  	  	  <td>${map.PRO_NAME}</td>
				   	  	  	  	  <td>${map.ODR_DATE}</td>
				   	  	  	  </tr>
				   	  	  </c:forEach>
			   	  	  </c:if>
			   	  	  <c:if test="${empty requestScope.mileageList2}">
			    		<tr>
			    			<td colspan="5" align="center"><span>적립금내역이없습니다.</span></td>
			    			<!-- 나중에 데이터값에 따라 태그 수정 -->
			    		</tr>
		    		  </c:if>
		    	</tbody>	
		    </table>
		    <nav class="my-5">
				<div style="display: flex; width: 100%;">
			 		<ul class="pagination" style='margin:auto;'>
			   			${requestScope.pageBar2}
			   		</ul>
			   	</div>
			 </nav> 
		   </div>
		  
		  <!-- 사용 -->
		  <div class="tab-pane container" id="menu3">
		     <table class="point_menu">
		    	<thead >
		    		<tr align="center">
						<td>번호</td>
						<td>유형</td>
						<td>주문날짜</td>
						<td>적립금</td>
						<td>관련주문</td>
						<td>내용</td>
		    		</tr>
		    	</thead>
		    	<tbody class="menu">
		    		<c:if test="${not empty requestScope.mileageList3}">
				   	  	  <c:forEach var="map" items="${requestScope.mileageList3}" varStatus="i">
				   	  	  	  <tr align="center">
				   	  	  	  	 <td>${i.index+1}</td>
				   	  	  	  	 <td>	
					   	  	  	  	<c:choose>
					   	  	  	  	  <c:when test="${map.MILEAGEINFO > 0}">
					   	  	  	  			<span style="color:blue;">적립</span>
					   	  	  	  	  </c:when>
					   	  	  	  	  <c:otherwise>
					   	  	  	  			<span style="color:red;">사용</span>
					   	  	  	  	  </c:otherwise>
					   	  	  	  	</c:choose> 
				   	  	  	  	  </td>
				   	  	  	  	  <td>
				   	  	  	  	  <c:choose>
					   	  	  	  	  <c:when test="${map.MILEAGEINFO > 0}">
					   	  	  	  			<span style="color:blue;">${map.MILEAGEINFO}</span>
					   	  	  	  	  </c:when>
					   	  	  	  	  <c:otherwise>
					   	  	  	  			<span style="color:red;">${map.MILEAGEINFO}</span>
					   	  	  	  	  </c:otherwise>
					   	  	  	  </c:choose> 
				   	  	  	  	  </td>
				   	  	  	  	  <td>${map.ODRCODE}</td>
				   	  	  	  	  <td>${map.PRO_NAME}</td>
				   	  	  	  	  <td>${map.ODR_DATE}</td>
				   	  	  	  </tr>
				   	  	  </c:forEach>
			   	  	  </c:if>
			   	  	  <c:if test="${empty requestScope.mileageList3}">
			    		<tr>
			    			<td colspan="5" align="center"><span>적립금내역이없습니다.</span></td>
			    			<!-- 나중에 데이터값에 따라 태그 수정 -->
			    		</tr>
		    		  </c:if>
		    	</tbody>
		    </table>
    			<nav class="my-5">
			    	<div style="display: flex; width: 100%;">
			    		<ul class="pagination" style='margin:auto;'>
			    			${requestScope.pageBar3}
			    		</ul>
			    	</div>
			    </nav>    
		  </div>
		</div>
		  
		<%-- <nav class="my-5">
	    	<div style="display: flex; width: 100%;">
	    		<ul class="pagination" style='margin:auto;'>
	    			${requestScope.pageBar}
	    		</ul>
	    	</div>
	    </nav>     --%>
	
	
 							<%--	<td>
				   	  	  	  	   	<c:choose>
				   	  	  	  	  		<c:when test="${Number(map.MILEAGEINFO) > 0}">
				   	  	  	  	  			적립
				   	  	  	  	  		</c:when>
				   	  	  	  	  		<c:otherwise>
				   	  	  	  	  			사용
				   	  	  	  	  		</c:otherwise>
				   	  	  	  	  	</c:choose> 
				   	  	  	  	  </td>--%>
</div>
	
<jsp:include page="/WEB-INF/footer.jsp"/>
 