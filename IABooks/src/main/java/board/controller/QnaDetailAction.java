package board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.BoardDAO;

import board.model.InterBoardDAO;
import board.model.QnABoardVO;
import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.CategoryVO;
import product.model.ProductVO;

public class QnaDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				HttpSession session  = request.getSession();
				
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				// 이전글, 다음글을 불러오기 위한 글상세보기의 게시판번호 불러오기
				
				
				int pk_qna_num = Integer.parseInt(request.getParameter("pk_qna_num"));
				
				
				System.out.println("받아온 글번호 : " + pk_qna_num);
				String currentNum = request.getParameter("pk_qna_num");
				System.out.println("받아온 글번호2 : " + currentNum);
				
				Map<String, String> paraMap = new HashMap<>();
				
				ProductVO proVO = new ProductVO();
				CategoryVO cateVO = new CategoryVO();
				
				
				proVO.getPro_imgfile_name();
				proVO.getPro_name();
				proVO.getCategory();
				
				
				QnABoardVO qnaVO = new QnABoardVO();
				QnABoardVO qnaPrevNext = new QnABoardVO(); // 이전글 다음글을 받아옴.
				
				InterBoardDAO bdao = new BoardDAO();
				
				qnaVO.setPk_qna_num(pk_qna_num);
				
			//	String qna_issecret = request.getParameter("qna_issecret");
				
				
					bdao.qnaReadCountUp(pk_qna_num);
					qnaVO = bdao.readqnaContent(pk_qna_num);
					
				
				
				
				
			
			//	System.out.println("loginuser.getUserid()" + loginuser.getUserid());
				
				
			
			  if(qnaVO == null) { String message = "게시글이 없습니다."; String loc =
			  "javascript:history.back()";
			  
			  request.setAttribute("message", message); request.setAttribute("loc", loc);
			  
			 // super.setRedirect(false); 
			  super.setViewPage("/WEB-INF/msg.jsp"); }
			 
			
			
			
			
			if( qnaVO.getPk_qna_num() != 0 ) {
				paraMap.put("currentNum", currentNum);
				System.out.println("여기까진 오니?");
				
				 qnaPrevNext = bdao.getqnaPrevNextContent(paraMap);
				 
				 qnaVO.setPrev_num(qnaPrevNext.getPrev_num());
				 qnaVO.setPrev_title(qnaPrevNext.getPrev_title());
				 qnaVO.setNext_num(qnaPrevNext.getNext_num());
				 qnaVO.setNext_title(qnaPrevNext.getNext_title());
				 
			}
			
			request.setAttribute("qnaVO", qnaVO);
		
			// 페이지 이동을 시킨다.
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/board/qnaDetail.jsp");
		
			
			
	}

}
