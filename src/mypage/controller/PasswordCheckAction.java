package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class PasswordCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			InterMemberDAO mdao = new MemberDAO();
			
			//userid중복검사 메소드 호출
			boolean isExistUserid = mdao.isExistUserid(userid, passwd);
			
			request.setAttribute("isExistUserid", isExistUserid);
			request.setAttribute("userid", userid);
			
			if(isExistUserid) {
				request.setAttribute("loginuser", loginuser);
				super.setRedirect(true);
				super.setViewPage("myInfoEdit.dog");
			}
			
			else {
				request.setAttribute("message", "아이디와 패스워드가 일치하지 않습니다");
				request.setAttribute("loc", request.getContextPath()+"/mypage/passwordCheck.dog");
				
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
		
		//GET방식 접근
		else {
			request.setAttribute("userid", loginuser.getUser_id());
		
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/passwordCheck.jsp");
		}
		
	}

}
