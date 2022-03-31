<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	String ctxPath = request.getContextPath();
	
%>

	

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	
		const method = "${requestScope.method}";
		console.log("method =>" + method);
		
		if(method == "GET") {
			$("div#div_findResult").hide();
		}
		else if( method == "POST") {
			$("input#name").val("${requestScope.name}");
			$("input#email").val("${requestScope.email}");
			$("div#div_findResult").show();
		} 
		
		
		$("input#email").bind("keyup", function(event){
			if(event.keyCode == 13) { 
				 goFind();
			}
		});
		
		$("button#btnFind").click(function() {
			 goFind();
		});
	
		
		$(function(){
			//페이지 로드후 적용되는 스크립트
			show()
		
		});
	

	
});	// end of $(document).ready(function()

function show() {
	
	if($('input:radio[id=emailcheck]').is(':checked')){
		$('#mobilefound').hide()
		$('#emailfound').show()
	}
	else if($('input:radio[id=phonecheck]').is(':checked')){
		$('#mobilefound').show()
		$('#emailfound').hide()
	}

}


function goFind() {
	// 성명 및 email에 대한 유효성 검사(정규표현식)는 생략하겠습니다.
	
	const frm = document.idFindFrm;
	frm.action = "<%= ctxPath%>/login/idFind.book";
	frm.method = "post";
	frm.submit();

}

	
	

</script>
<style type="text/css">

	table.idFind {
		
		margin: 0 auto;
	}
	
	table.idFind > thead > tr > td {
		height: 50px;
		text-align: center;
	}
	
	input[type="radio"] {
	  margin-top: -1px;
	  vertical-align: middle;
	}
	
	table.idFind > tbody > tr > td {
		height: 50px;
		text-align: center;
	}
	
	
	table.idFind > tbody > tr > th {
		padding-right: 30px;
		height: 50px;
	}
	
	table.idFind > tfoot > tr > td {
		width:200px;
		height: 100px;
	}
	
	div.titleArea  {
		margin-top:10px;
	}
 	
	div#found {
		text-align : center;
		border: 5px solid #d7d5d5;
		margin: 30px 0;
	}
	
	
	
	input {
		height: 35px;
	}
	
	input.phonenb {
		width: 60px;
	}

 	button#btnFind {
	    color: white;
	    background-color: #00334d;
	    border-radius: 5px;
	    height: 50px;
	    width: 100px;
	    font-size: 13pt;
	    font-weight: bold;
		}
	div.titleArea > ul , li {
		padding-left:20px;
		margin-top:10px;
	}
	
	div#sm {
	 	font-size: 11pt;
		padding-left: 18px;
		padding-top: 6px;
	}

	
</style>
<title>아이디 찾기</title>
<jsp:include page="/WEB-INF/header.jsp"/>
<div class="container">
	<div class="titleArea">
		<br>&nbsp;<strong style="font-size: 16pt;"><img src="<%= ctxPath%>/images/member/ico_heading.gif" style="width: 6px; height: 20px;"/>&nbsp;아이디 찾기</strong>
    </div>
    	<div id = "sm">
	    	<ul>
		    	<li>가입하신 방법에 따라 아이디 찾기가 가능합니다.</li>
		    </ul>
	    </div>
	<hr style="border: solid 2px #e8e8e8;">
    
   	<div id="found">
    	
    	<form name="idFindFrm">
    		<table class="idFind" >
	    		<thead>
	    			<tr>
	    				<td colspan="3" style="text-align: center; padding-top: 50px;">
	    					<strong style="font-size: 16pt;">아이디 찾기</strong>
	    				</td>
	    			</tr>
		    		<tr>
		    			<td colspan="2">
			    			<label for="emailcheck">이메일</label>&nbsp;
			    			<input type="radio" name="check" id="emailcheck" checked="checked" onchange="show()">
		    			</td>
		    			<td>
		    				<label for="phonecheck">휴대폰번호</label>&nbsp;
		    				<input type="radio" name="check" id="phonecheck" onchange="show()">
		    			</td>
					</tr>
	    		</thead>	
				
				<tbody>
					<tr>
						<th>
							<label for="name" style="display: inline-block; width: 90px">
								<img src="<%= ctxPath%>/images/member/arrow_menu.gif" />&nbsp;이름
							</label>
						</th>
						<td colspan="2">
							<input type="text" name="name" id="name" size="25" placeholder="홍길동" autocomplete="off" >
						</td>	
					</tr>
					<tr id = "emailfound">				
						<th>
							<label for="email" >
								<img src="<%= ctxPath%>/images/member/arrow_menu.gif" />&nbsp;이메일로찾기
							</label>
						</th>
						<td colspan="2">	
							<input type="text" placeholder="hongkd@email.com" name="email" id="email" size="25" autocomplete="off">
						</td>	
					</tr>
					<tr id = "mobilefound">
						<th>
							<img src="<%= ctxPath%>/images/member/arrow_menu.gif" />&nbsp;휴대폰번호로찾기
						</th>	
						<td colspan="2" style=" text-align: left; ">
							<input type="text" class="phonenb" maxlength='3' value="010" readonly>&nbsp;-&nbsp;<input type="text" class="phonenb" maxlength='4'  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />&nbsp;-&nbsp;<input type="text" class="phonenb" maxlength='4'  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" style="text-align: center;" >
							<button type="button" class="btn btn-success" id="btnFind" onclick="goFind();">검색</button>
						</td>	
					</tr>
				</tfoot>
			</table>
			
			   <div class="my-3" id="div_findResult" >
			      <p class="text-center" style="margin-bottom: 50px;">
			           ID : <span style="color: red; font-size: 16pt; font-weight: bold;">${requestScope.userid}</span> 
			      </p>
			   </div>
			
		</form>	
	</div>
		
</div>	
<jsp:include page="/WEB-INF/footer.jsp"/>
 