package mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import member.model.MemberVO;
import mypage.model.InterMypageDAO;
import mypage.model.MyPetVO;
import mypage.model.MypageDAO;

public class AddMypetAction extends AbstractController {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String seq = request.getParameter("pet_seq");
		String userid = loginuser.getUser_id();
		
		String method = request.getMethod();
		
		//GET방식
		if("GET".equalsIgnoreCase(method)) {
			String email = loginuser.getEmail();
			
			InterMypageDAO idao = new MypageDAO();
			MyPetVO myPetInfo = idao.selectMyPetInfo(seq, email); 
			
			request.setAttribute("myPetInfo", myPetInfo);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hm_Mypage/addMypet.jsp");
		}
		
		//POST방식
		else {
			MultipartRequest mtrequest = null;
			ServletContext svlCtx = session.getServletContext();
			String imagesDir = svlCtx.getRealPath("/mypetimg");
			//파일 업로드
			try {	
				mtrequest = new MultipartRequest(request, imagesDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
		    } catch(IOException e) {
		    	//////////////////////////공사중//////////////////////////
		    	PrintWriter out = response.getWriter();
		    	out.print("파일용량 10MB 초과 !!");
		    	return;
		    	//////////////////////////////////////////////////////////
			}
			String petName = mtrequest.getParameter("petName");
			String petWeight = mtrequest.getParameter("petWeight");
			String petGender = mtrequest.getParameter("petGender");
			String petBirthday = mtrequest.getParameter("petBirthday");
			String petPhoto = mtrequest.getFilesystemName("petImage");
			String CurrentPetPhoto = mtrequest.getParameter("petPhoto");
			String petType = mtrequest.getParameter("petType");
			String pet_seq = mtrequest.getParameter("pet_seq");
			String petNeutral = mtrequest.getParameter("petNeutral");
			String email = loginuser.getEmail();
			
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("petName", petName);
			paraMap.put("petWeight", petWeight);
			paraMap.put("petGender", petGender);
			paraMap.put("petBirthday", petBirthday);
			paraMap.put("petPhoto", petPhoto);
			paraMap.put("pet_seq", pet_seq);
			paraMap.put("email", email);
			paraMap.put("petType", petType);
			paraMap.put("petNeutral", petNeutral);
			paraMap.put("CurrentPetPhoto", CurrentPetPhoto);
			
			InterMypageDAO mdao = new MypageDAO();

			int n = 0;
			
			if(pet_seq.isEmpty())
				n = mdao.addMypet(paraMap);
			else
				n = mdao.updateMypet(paraMap);
			  
			String message = "";
			String loc = "";
			
			if(pet_seq.isEmpty() && n==1) {
				  message = "반려동물 추가가 완료되었습니다.";
				  loc = "javascript:self.close()";
			}
			else if(pet_seq.isEmpty() && n==0){
				message = "반려동물 추가에 실패했습니다. 고객센터로 문의 바랍니다";
				loc = "javascript:self.close()";
			}
			
			else if(!pet_seq.isEmpty() && n==1){
				message = "반려동물 수정이 완료되었습니다.";
				loc = "javascript:self.close()";
			}
			
			else {
				message = "반려동물 수정에 실패했습니다. 고객센터로 문의 바랍니다";
				loc = "javascript:self.close()";
			}
			
			  
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			  
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
			///////////////////////////////////////////////////////////////////////
		}
	

	}
}

