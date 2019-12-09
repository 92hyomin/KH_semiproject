package login.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;

public class LoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("GET".equals(method)) {
			
			setViewPage("/WEB-INF/login/login.jsp");
			
		}
		else {		// 비교해보고 에 맞는 게 있으면 로그인, 없으면 회원가입창
			
			String user_sns = request.getParameter("user_sns");
			
			String message = "";		// alert 로 띄울 메시지
			String loc = "";			// 이동할 페이지
			
			InterMemberDAO mdao = new MemberDAO();
			MemberVO loginuser = null;
			
			if(user_sns == null ) {			// 일반 로그인
				
				System.out.println("일반 로그인입니다.");
				
				String user_id = request.getParameter("user_id");
				String user_pw = request.getParameter("user_pw");
				
				HashMap<String,String> paraMap = new HashMap<String,String>();
				paraMap.put("user_id",user_id);
				paraMap.put("user_pw",user_pw);
				
				loginuser = mdao.loginByNormal(paraMap);
				
			}
			else {							// SNS 로그인
				
				System.out.println("SNS 로그인입니다.");
				String email = request.getParameter("email");
				loginuser = mdao.loginBySNS(email);
				
			}
			
			if(loginuser != null) {		// 로그인 성공!
				
				HttpSession session = request.getSession();
				session.setAttribute("loginuser", loginuser);
				
				// 비밀번호 변경한 지 6개월 넘었을 때  ( 비밀번호 변경 창을 표시 ) 
				if(loginuser.isNeedPwChange()) {
					
				}
				
				
				// 로그인을 한 지 1년이 지나서 휴면 상태로 전환 ( 새로운 창을 열어서 휴면 상태를 해제하는 기능 구현 )
				if(loginuser.isNeedDormancy()) {
					
				}
				
				
				message = loginuser.getUser_name()+" 님 환영합니다!";
				loc = request.getContextPath()+"/main.dog";
			}
			else {
				
				if(user_sns != null) {
					
					message = "ID 또는 비밀번호가 틀립니다.";
					loc = request.getContextPath()+"/register/mainJoinPage.dog";
					
				}
				else {
					message = "ID 또는 비밀번호가 틀립니다.";
					loc = "javascript:history.back()";
				}
				
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}
		
		
		
	} // end of execute -------------------

	
	
} // end of class --------------------------------------------------
