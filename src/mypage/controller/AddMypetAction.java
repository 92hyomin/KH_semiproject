package mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
			System.out.println("[GET]seq: " + seq);
			System.out.println("[GET]userid: " + userid);
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
			String petImage = mtrequest.getFilesystemName("petImage");
			String pet_seq = mtrequest.getParameter("pet_seq");
			String email = loginuser.getEmail();
			
			System.out.println("[POST]petName: " + petName);
			System.out.println("[POST]petWeight: " + petWeight);
			System.out.println("[POST]petGender: " + petGender);
			System.out.println("[POST]petBirthday: " + petBirthday);
			System.out.println("[POST]petImage: " + petImage);
			System.out.println("[POST]pet_seq: " + pet_seq);
			System.out.println("[POST]email" + email);
			
			InterMypageDAO idao = new MypageDAO();
			
			/////////////////////////////  공사중  ////////////////////////////////////
			// 펫 추가는 사진첨부 할경우, 안할경우 고려
			// seq 있으면 수정, 없으면 추가

			int n = pdao.productInsert(pvo);   // 테이블에 UPDATE, 또는 INSERT
			  
			int m = 1;
			  
			String message = "";
			String loc = "";
			  
			if(n==1) {
				  message = "정보수정이 완료되었습니다";
				  loc = "javascript:self.close()";
			}
			else {
				message = "정보수정에 실패했습니다. 고객센터로 문의 바랍니다";
				loc = "javascript:self.close()";
			}
			  
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			  
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
			///////////////////////////////////////////////////////////////////////
		}
	

	}
}

