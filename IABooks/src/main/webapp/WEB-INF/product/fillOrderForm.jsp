<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<title>주문서작성</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css">
<!-- 내가만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/product/style_order.css" /> 
<!-- Optional JavaScript-->
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>	
<script type="text/javascript">
	$(document).ready(function(){
		
		//회원정보동일 버튼클릭시 발생
		$("input#user_address").click(function() {
			userAddress();
		});
		
		$("input#new_address").click(function() {
			newAddress();
		});
		
	});

	function openDaumPOST() {

		new daum.Postcode({
			oncomplete: function (data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				let addr = ''; // 주소 변수
				let extraAddr = ''; // 참고항목 변수
	
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
	
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;
					
				} else {
					document.getElementById("extraAddress").value = '';
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();

	}// end of openDaumPOST()

	function detailOrder() {
		$("div.deiailOrderBox").show();
	}//end of function detailOrder()

	function userAddress() {//회원 정보와 동일
	//"${sessionScope.loginuser.userid}"
	
	$("input#name").val("${sessionScope.loginuser.name}");
	$("input#postcode").val("${sessionScope.loginuser.postcode}");
	$("input#address").val("${sessionScope.loginuser.address}");
	$("input#detailAddress").val("${sessionScope.loginuser.detailaddress}");
	$("input#extraAddress").val("${sessionScope.loginuser.extraaddress}");
	
	var phone = "${sessionScope.loginuser.phone}";
	phone = phone.split("-");
	$("input#hp1").val(phone[0]);
	$("input#hp2").val(phone[1]);
	$("input#hp3").val(phone[2]);
	
	$("input#email").val("${sessionScope.loginuser.email}");

	}//end of userInfo()
	
	function newAddress() {
		$("input#name").val("");
		$("input#postcode").val("");
		$("input#address").val("");
		$("input#detailAddress").val("");
		$("input#extraAddress").val("");
		$("input#hp2").val("");
		$("input#hp3").val("");
		$("input#email").val("");
		
	}//end of function newAddress()
	
	function payment() {//결제버튼 클릭
		if(	$("input#name").val().trim() == "" || $("input#postcode").val().trim() == "" || $("input#address").val().trim() == "" 
			|| $("input#detailAddress").val().trim() == "" || $("input#extraAddress").val().trim() == "" || $("input#hp2").val().trim() == "" 
			|| $("input#hp3").val().trim() == "" || $("input#email").val().trim() == "" ){
			
			alert("필수입력사항을 모두 입력해주세요")
			return;
			
		}
	/* 	var IMP = window.IMP;
	
		 var frm = document.paymentFrm;
		 var url = "payment.book";
		 window.open("" ,"paymentFrm", 
		       "toolbar=no, left=350px, top=100px, width=1000px, height=600px, directories=no, status=no, scrollorbars=no, resizable=no, menubar=no, channelmode=no, location=no, fullscreen=no"); 
		 frm.action =url; 
		 frm.method="post";
		 frm.target="paymentFrm";
		 frm.submit(); */
		 //ajax로 결제하자
		 var frm = document.paymentFrm;
		 var url = "payment.book";
		 frm.action =url; 
		 frm.method="post";
		 frm.target="paymentFrm";
		 frm.submit(); 
	
		 //test();
	}//end of function payment() 
	
	
	function test() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp51671394');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg: 'inicis', // version 1.1.0부터 지원.
			/*
			'kakao':카카오페이,
			html5_inicis':이니시스(웹표준결제)
			'nice':나이스페이
			'jtnet':제이티넷
			'uplus':LG유플러스
			'danal':다날
			'payco':페이코
			'syrup':시럽페이
			'paypal':페이팔
			*/
			pay_method: 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			*/
			merchant_uid: 'merchant_' + new Date().getTime(),
			/*
			merchant_uid에 경우
			https://docs.iamport.kr/implementation/payment
			위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			참고하세요.
			나중에 포스팅 해볼게요.
			*/
			name: '주문명:결제테스트',
			//결제창에서 보여질 이름
			amount: 1000,
			//가격
			buyer_email: 'iamport@siot.do',
			buyer_name: '구매자이름',
			buyer_tel: '010-1234-5678',
			buyer_addr: '서울특별시 강남구 삼성동',
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
		}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
		});

	}
	
</script>

<style type="text/css">

	 */
	
</style>

<jsp:include page="/WEB-INF/header.jsp"/>

	<div class="container">
	<div class="titleArea">
		<br>&nbsp;<strong style="font-size: 16pt;"><img src="<%= ctxPath%>/images/member/ico_heading.gif" style="width: 6px; height: 20px;"/>&nbsp;마이 쇼핑</strong>
		<hr style="border: solid 2px #e8e8e8; margin-bottom: 3%;">
    </div>
	
	<div class="orderImg">
		<img src="<%= ctxPath %>/images/product/order.jpg" />
	</div>
		
	<form name="paymentFrm">
		<table class="benefit_info">
			<tr>
				<td>
					<span style="padding-left: 30px;">혜택정보</span>
					<img src="<%= ctxPath%>/images/bar_eee.gif" style="width: 2px; height: 20px;" />
					가용적립금 : <span name="point"><a>0</a></span>
					쿠폰 : <span name="coupon"><a>0</a></span>
				</td>
			</tr>
		</table>
		
		<!-- 영준님 테이블 가져오기 -->










		<hr style="border: solid 1px black;">	
		
		<strong style="font-size: 12pt; padding-left: 20px;">배송정보</strong>
			<p class="floatR"><span id="star">*</span> 필수입력사항</p>
			<table class="shipping_info">
				<tr>
					<th>배송지선택&nbsp;</th>
					<td>
						<input type="radio" id="user_address" name="shippingInfo"required autocomplete="off" />&nbsp; <label class="title" for="user_address">회원정보와 동일</label>&nbsp;&nbsp;    
						<input type="radio" id="new_address" name="shippingInfo" required autocomplete="off" />&nbsp; <label class="title" for="new_address">새로운 배송지</label>
					</td>    
				</tr>
				<tr>
					<th>받으시는분&nbsp;<span id="star">*</span></th>
				    <td>
				        <input required type="text" value="" name="name" id="name" maxlength="20" />
				        <input required type="hidden" value="${sessionScope.loginuser.userid}" name="userid" id="userid" maxlength="20" />
				    </td>
				</tr>
				<tr>
					<th>우편번호</th>
			      	<td>
			        	<input required type="text" id="postcode" name="postcode" size="5" placeholder="우편번호" values="addr" style="width: 100px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
			         	&nbsp;&nbsp;
			         	<img src="<%= ctxPath %>/images/product/btn_zipcode.gif" style="cursor: pointer;" onclick="openDaumPOST();"/>
			      	</td>
				</tr>
				<tr>
					<th id="register">주소 &nbsp;<span id="star">*</span></th>
					<td>
						<input class="my-1" required type="text" id="address" name="address" size="50" placeholder="주소" /><br>
						<input class="my-1" type="text" id="detailAddress" name="detailAddress" size="50" placeholder="상세주소" /><br>
						<input class="my-1" type="text" id="extraAddress" name="extraAddress" size="50" placeholder="참고항목" />                
					</td>
				</tr>
				<tr>
					<th>휴대전화 &nbsp;<span id="star">*</span></th>
			        <td>
			        	<select id="hp1" name="hp1">
							<option value="010">010</option>
						</select>&nbsp;-&nbsp;
						<input class="requiredInfo" required id="hp2" name="hp2" type="text" size="5" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">&nbsp;-&nbsp; 
						<input class="requiredInfo" required id="hp3" name="hp3" type="text" size="5" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					 </td>
				</tr>
				<tr>
					<th>이메일 &nbsp;<span id="star">*</span></th>
					<td>
						<input type="email" class="myinput" id="email" name="email" size="20" maxlength="20" required placeholder="email@gmail.com" />
						<br>이메일을 통해 주문처리과정을 보내드립니다. 
						<br>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.
					</td>
				</tr>
				            
				<tr>
			        <th>배송메세지</th>
			        <td>
			        	<textarea maxlength="255"></textarea>
			        </td>
			    </tr>
			</table>
		
			<strong style="font-size: 12pt;">결제 예정 금액</strong>
			<table class="paymentExpected">
				<thead>
					<tr>
						<td>
							<strong>총 주문 금액</strong>
							<a style="cursor: pointer;" onclick="detailOrder()"><img src="<%= ctxPath %>/images/member/btn_list.gif" style="cursor: pointer;"/></a>
						</td>
						<td>
							<strong>총 할인 + 부가결제 금액</strong>
						</td>
						<td>
							<strong>총 결제예정 금액</strong>
						</td>
					</tr>
					<tr>
						<td>
							<span>14,000원</span>
							<input required type="hidden" value="10000" name="totalprice" id="totalprice" maxlength="20" />
						</td>
						<td>
							- <span>0원</span>
						</td>
						<td style="color: #008BCC;">
							= <span>14,000원</span>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>총 할인금액</td>
						<td colspan="2"><div>0원</div></td>
					</tr>
					<tr>
						<td>총 부가결제금액</td>
						<td colspan="2"><div>0원</div></td>
					</tr>
				</tbody>
			</table>
	
			<div class="btn_order"><img src="<%= ctxPath%>/images/member/btn_place_order.gif" onclick="payment()"  ></div>
	</form>
	
	<!-- <div class="deiailOrderBox" >
       <div class="deiailOrderBox_header">
         <strong>총 주문금액 상세내역</strong>
         <span><button type="button" >&times;</button></span>
       </div>
       <div class="deiailOrderBox_body">
         
       </div>
	</div>  -->
	
</div><%--<div class="container"> end  --%>

<jsp:include page="/WEB-INF/footer.jsp"/>
 