package mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import mypage.model.InterMypageDAO;
import mypage.model.MypageDAO;
import mypage.model.OrderVO;
import mypage.model.ReserveVO;

public class OrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		if(loginuser == null) {
			String message = "로그인 후 이용해주세요";
			String loc = "/Semi_Team1/login/login.dog";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		String orderNum = request.getParameter("orderNum");
		String email = loginuser.getEmail();
		
		InterMypageDAO dao = new MypageDAO();
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("email", email);
		paraMap.put("orderNum", orderNum);
		
		List<OrderVO> orderDetailList = dao.searchOrderDetail(paraMap);
				
		
		
		request.setAttribute("orderDetailList", orderDetailList);
		request.setAttribute("loginuser", loginuser);
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hm_Mypage/orderDetail.jsp");
	}

}
