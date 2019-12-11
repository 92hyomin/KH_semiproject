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

public class AddMypetAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		String seq = request.getParameter("seq");
		String userid = loginuser.getUser_id(); 
		if(loginuser == null) {
			String message = "로그인 후 이용해주세요";
			String loc = "/Semi_Team1/login/login.dog";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		String method = request.getMethod();
		
		System.out.println("seq: " + seq);
		System.out.println("userid: " + userid);
		
		
		
		
		/*
		 * //GET접근 if(!"POST".equalsIgnoreCase(method)) { String name =
		 * loginuser.getUser_name(); String email = loginuser.getEmail(); InterMypageDAO
		 * idao = new MypageDAO();
		 * 
		 * int totalPet = idao.selectTotalPet(email);
		 * 
		 * List<MyPetVO> myPetList = idao.selectMyPetList(email);
		 * 
		 * request.setAttribute("totalPet", totalPet); request.setAttribute("name",
		 * loginuser.getUser_name()); request.setAttribute("myPetList", myPetList);
		 * 
		 * super.setRedirect(false);
		 * super.setViewPage("/WEB-INF/hm_Mypage/addMypet.jsp"); }
		 * 
		 * //POST접근 else { String pet_seq = request.getParameter("pet_seq");
		 * System.out.println("post: " + pet_seq);
		 * 
		 * super.setRedirect(false);
		 * super.setViewPage("/WEB-INF/hm_Mypage/addMypet.jsp"); }
		 */
		
	}

}
