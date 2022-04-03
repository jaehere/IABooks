package product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class X_PlusViewCntAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pk_pro_num = request.getParameter("pk_pro_num");
		String pro_viewcnt = request.getParameter("pro_viewcnt");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("pk_pro_num", pk_pro_num);
		paraMap.put("pro_viewcnt", pro_viewcnt);
		
		InterProductDAO pdao = new ProductDAO();
		int n = pdao.plusViewCnt(paraMap); // DB에 조회수 증가하기
		Integer.parseInt(pro_viewcnt);
		
		// 조회수 증가가 성공하는 경우
		if(n==1) {
			
		}
		
		else {
			pro_viewcnt += 0;
		}
		
		
		

	}

}
