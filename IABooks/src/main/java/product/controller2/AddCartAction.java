package product.controller2;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class AddCartAction extends AbstractController  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) {//로그인했으면 true
			String userid = request.getParameter("userid");//임시 테스트 아이디
			//String userid = "admin";//테스트
			
			HttpSession session = request.getSession();;
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

			if(loginuser.getUserid().equals(userid)) {//올바른경우
				//재고량 체크
				String pk_pro_num = request.getParameter("pk_pro_num");
				String now_pro_qty = request.getParameter("now_pro_qty");
				
				InterProductDAO pdao = new ProductDAO();
				Map<String, String> paraMap = new HashMap<>();
				
				paraMap.put("pk_pro_num", pk_pro_num);
				paraMap.put("userid", userid);
				paraMap.put("now_pro_qty", now_pro_qty);
				
				Map<String, Integer> qtyCheck = pdao.qtyCheck(paraMap);
				Map<String, Integer> cartQtyCheck = pdao.cartQtyCheck(paraMap);
				
				int ck_odr_qty = cartQtyCheck.get("ck_odr_qty");
				int pro_qty = qtyCheck.get("pro_qty");

				int n = 0;
				if(pro_qty >= (ck_odr_qty+Integer.parseInt(now_pro_qty)) ) {
					//재고량과 같거나 재고가 더많은경우
					
					//카드에 현재 제품이 있는지 없는지 체크 insert or update
					boolean proCartCheck  = pdao.proCartCheck(paraMap);
					
					if(proCartCheck) {//현재있는 경우 update
						n = pdao.updateAddCart(paraMap);

					}else {//없는 경우 insert
						n = pdao.insertAddCart(paraMap);
					}
					
				}else {
					//재고량보다 더적은경우
					String message = "주문하신 상품은 현재재고량보다 많습니다.";
					//String loc = "javascript:history.back()";//
					
					request.setAttribute("message", message);
					//request.setAttribute("loc", loc);
					
					//super.setRedirect(false);
					super.setViewPage("/WEB-INF/jsonMsg.jsp");
					
					return;
					
				}//end of if(pro_qty >= Integer.parseInt(total_pro_qty) ) 
				
				JSONObject jsonObj = new JSONObject(); 
				jsonObj.put("addCart", n); 
				String json = jsonObj.toString();
				
				request.setAttribute("json", json);
				
				super.setViewPage("/WEB-INF/jsonview.jsp");
				
			}else {//로그인사용자가 다른 사용자의 장바구니 추가할경우
				String message = "다른사용자의 장바구니는 사용이 불가능합니다.";
				//String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				//request.setAttribute("loc", loc);
				
				//super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonMsg.jsp");
			}
			
		}else {//비로그인으로 장바구니 추가할경우
			String message = "장바구니는 로그인하신후 이용가능합니다.";
			//String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			//request.setAttribute("loc", loc);
			
			//super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonMsg.jsp");
			
		}
		
		
		
	}

}
