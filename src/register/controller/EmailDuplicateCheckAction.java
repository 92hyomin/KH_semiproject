package register.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class EmailDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if(!"POST".equalsIgnoreCase(method)) {		// GET 방식으로 들어올 때 
			
			String message = "잘못된 접근입니다.";
			String loc = "javascript:history.back();";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		else {										// POST 방식으로 들어왔을 때
			
			String emailCheck = request.getParameter("email");
			
			InterMemberDAO mdao = new MemberDAO();
			
			int dupResult = mdao.getEmailCheck(emailCheck);
			
			JSONObject jsobj = new JSONObject();
			
			if ( dupResult ==1 ) {			// 이메일이 중복된다.
				
				jsobj.put("dupResult", dupResult);
				jsobj.put("message", "중복된 이메일입니다.");
			}
			else {						// 이메일 사용가능하다.
				
				jsobj.put("dupResult", dupResult);
				jsobj.put("message", "사용가능한 이메일입니다.");
			}
			String result = jsobj.toString();
			System.out.println(result);
			
			request.setAttribute("result", result);
			
			super.setViewPage("/WEB-INF/jsonResult.jsp");
		}
		
	} // end of execute ---------------------------------------

} // end of class -----------------------------------------------------------
