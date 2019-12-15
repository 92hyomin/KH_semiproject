package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import mypage.model.InterMypageDAO;
import mypage.model.MypageDAO;

public class DeleteUserAction extends AbstractController {
	
	private String replaceParameter(String param) {
	String result = param;
		
	if(param != null) {
		result = result.replaceAll("<", "&lt;");
		result = result.replaceAll(">", "&gt;");
		result = result.replaceAll("&", "&amp;");
		result = result.replaceAll("\"", "&quot;");
	}
		
	return result;
	}

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
		
		String method = request.getMethod();
		String email = loginuser.getEmail();
		String userid = loginuser.getUser_id();
		String resign_reason = request.getParameter("input_text");
		
		//GET동작
		if("GET".equalsIgnoreCase(method)) {
			super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_DeleteUser.jsp");
		}
		
		//POST동작
		else {
			InterMypageDAO idao = new MypageDAO();
			if(resign_reason.isEmpty()) {
				resign_reason = "사유없음";
			}
			System.out.println(resign_reason);
			
			resign_reason = this.replaceParameter(resign_reason);
			resign_reason = resign_reason.replaceAll("\r\n", "<br/>");
			
			int n = idao.deleteUser(email, resign_reason, userid);
	
			String message = "";
			String loc = "";
			
			if(n==1) {
				message = "탈퇴가 완료되었습니다.";
				session.invalidate();
				loc = "/Semi_Team1/main.dog";
				
			}
			else {
				message = "탈퇴에 실패했습니다. 고객센터로 문의해주세요";
				loc = "/Semi_Team1/mypage/mypageMain.dog";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			  
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
