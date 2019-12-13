package mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MyInfoEditAction extends AbstractController {

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
		String method = request.getMethod();
		
		//GET접근
		if(!"POST".equalsIgnoreCase(method)) {
			String userName = loginuser.getUser_name();
			String userid= loginuser.getUser_id();
			String birth = loginuser.getUser_birthday();
			String email = loginuser.getEmail();
			String gender = loginuser.getUser_gender();
			String birthY = birth.substring(0,4);
			String birthM = birth.substring(4,6);
			String birthD = birth.substring(6,8);
			
			request.setAttribute("userName", loginuser.getUser_name());
			request.setAttribute("userid", loginuser.getUser_id());
			request.setAttribute("birthY", birthY);
			request.setAttribute("birthM", birthM);
			request.setAttribute("birthD", birthD);
			request.setAttribute("email", loginuser.getEmail());
			request.setAttribute("gender", loginuser.getUser_gender());
			request.setAttribute("alert_email", loginuser.getAlert_email());
			request.setAttribute("alert_sms", loginuser.getAlert_sms());
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/semi_Mypage_MyInfoEdit.jsp");
		}
		
		//POST접근
		else {
			String email = loginuser.getEmail();
			
			String user_pw = request.getParameter("passwd1");
			String post1 = request.getParameter("post1");
			String post2 = request.getParameter("post2");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String tel = request.getParameter("tel");
			String phone = request.getParameter("phone");
			String emailreceive = request.getParameter("emailreceive");
			String smsreceive = request.getParameter("smsreceive");
			String postcode = post1 + post2;
			
			InterMemberDAO idao = new MemberDAO();
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("email", email);
			paraMap.put("user_pw", user_pw);
			paraMap.put("postcode", postcode);
			paraMap.put("addr1", addr1);
			paraMap.put("addr2", addr2);
			paraMap.put("phone", phone);
			paraMap.put("emailreceive", emailreceive);
			paraMap.put("smsreceive", smsreceive);
			
			int n = idao.updateMemberInfo(paraMap);
			
			if(n==1) {
				request.setAttribute("message", "정보수정이 완료되었습니다.");
				request.setAttribute("loc", request.getContextPath()+"/mypage/mypageMain.dog");
			}
			else {
				request.setAttribute("message", "정보수정에 실패했습니다. 고객센터로 문의하세요");
				request.setAttribute("loc", request.getContextPath()+"/mypage/mypageMain.dog");
			}
			
			super.setViewPage("/WEB-INF/msg.jsp");
		}
	}

}
