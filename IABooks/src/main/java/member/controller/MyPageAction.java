package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;


public class MyPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
        // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
		
		if(session.getAttribute("loginuser") == null) {
			
			session.setAttribute("myPageLogin", "myPageLogin");
			
			setRedirect(false);
			setViewPage("/login/join.book");
			
		} else {
			
			String userid = (String)session.getAttribute("userid");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			
			InterMemberDAO mdao = new MemberDAO();
			//////////////////////////////////////////////////////////////
			
			int couponNum = mdao.CouponNum(paraMap);
			
			Map<String,String> result  = mdao.mgInfo(paraMap);
			
			request.setAttribute("all_mg", result.get("all_mg"));
			request.setAttribute("used_mg", result.get("used_mg"));
			request.setAttribute("available_mg", result.get("available_mg"));
			request.setAttribute("refund_mg", result.get("refund_mg"));
			request.setAttribute("unsecured_mg", result.get("unsecured_mg"));
			
			request.setAttribute("couponNum", couponNum);
			
			setRedirect(false);
			setViewPage("/WEB-INF/member/myPage.jsp");
			
		}

	}

}
