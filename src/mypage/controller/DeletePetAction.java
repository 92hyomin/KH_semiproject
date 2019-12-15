package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import mypage.model.InterMypageDAO;
import mypage.model.MyPetVO;
import mypage.model.MypageDAO;

public class DeletePetAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		InterMypageDAO idao = new MypageDAO();
		String pet_seq = request.getParameter("pet_seq");
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String seq = request.getParameter("pet_seq");
		String email = loginuser.getEmail();
		
		int n = idao.deleteMypet(pet_seq,email);

		String message = "";
		String loc = "";
		
		if(n==1) {
			message = "삭제되었습니다";
			loc = "/Semi_Team1/mypage/mypet.dog";
		}
		else {
			message = "삭제에 실패했습니다. 고객센터로 문의해주세요";
			loc = "/Semi_Team1/mypage/mypet.dog";
		}
		
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		  
		super.setViewPage("/WEB-INF/msg.jsp");

	}

}
