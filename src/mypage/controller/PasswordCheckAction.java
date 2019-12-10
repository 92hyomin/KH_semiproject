package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PasswordCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if("POST".equalsIgnoreCase(method)) {
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			InterMemberDAO memberdao = new MemberDAO();
			
			System.out.println("userid: " + userid);
			System.out.println("userpw: " + passwd);
			
			/*
			//userid중복검사 메소드 호출
			boolean isExistUserid = memberdao.idDuplicateCheck(userid);
			System.out.println(isExistUserid);
			request.setAttribute("isExistUserid", isExistUserid);
			request.setAttribute("userid", userid);
			*/
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_MyInfoEdit.jsp");
		}
		else {
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/passwordCheck.jsp");
		}
		
	}

}
