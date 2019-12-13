package register.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import member.model.*;

public class JoinEndAction extends AbstractController {

	// *** 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성해주는 메소드 생성하기 *** //
	private String replaceParameter(String param) {
		String result = param;
		
		if(param != null) {
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}// end of private String replaceParameter(String param)------
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String message = "";		// alert 로 띄울 메시지
		String loc = "";			// 이동할 페이지
		
		String method = request.getMethod();
		
		// POST 로 들어올 때
		if("POST".equals(method)) {				
			
			String user_sns = request.getParameter("user_sns");
			
			int result = 0;
			InterMemberDAO mdao = new MemberDAO();
			
			if( user_sns != null) {				// sns 로그인으로 회원가입 하는 경우 
				
				String user_name = request.getParameter("user_name");
				String email = request.getParameter("email");
				String alert_email = request.getParameter("alert_email");		// 체크 안하면 null , 체크하면 on
				
				if("on".equalsIgnoreCase(alert_email)) alert_email = "1";
				else alert_email = "0";
				
				HashMap<String,String> paraMap = new HashMap<String,String>();
				paraMap.put("user_name", user_name );
				paraMap.put("email", email );
				paraMap.put("alert_email", alert_email );
				paraMap.put("user_sns", user_sns );
				
				try {
					
					result = mdao.joinMemberBySNS(paraMap);
				
				} catch(SQLIntegrityConstraintViolationException e) {
					
					message = "회원가입에 실패하셨습니다.";
					loc = request.getContextPath()+"/register/mainJoinPage.dog";
				}
			}
			else {			// 일반 회원가입으로 하는 경우
				
				// 회원 정보 insert 하기
				MultipartRequest mtrequest = null;
				
				HttpSession session = request.getSession();
				ServletContext svlCtx =  session.getServletContext();
				String imagesDir = svlCtx.getRealPath("/images");
				System.out.println("첨부되는 이미지 파일이 저장되는 절대 경로: " +imagesDir);
				
				try {	
					//  === 파일을 업로드 해준다.  ===
					mtrequest = new MultipartRequest(request, imagesDir, 1*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
					
			      } catch( IOException e) {
			    	  
			    	  e.printStackTrace();
				  }
				
				String user_name = mtrequest.getParameter("user_name");
				String user_id = mtrequest.getParameter("user_id");
				String user_pw = mtrequest.getParameter("user_pw");
				String user_birthday = mtrequest.getParameter("user_birthday");
				String user_gender = mtrequest.getParameter("user_gender");
				String postcode = mtrequest.getParameter("postcode");
				String addr1 = mtrequest.getParameter("addr1");
				String addr2 = mtrequest.getParameter("addr2");
				
				addr2= this.replaceParameter(addr2);
				
				String phone = mtrequest.getParameter("phone");
				String email = mtrequest.getParameter("email");
				String alert_email = mtrequest.getParameter("alert_email");
				String alert_sms = mtrequest.getParameter("alert_sms");
				
				if(alert_email == null) alert_email = "0";
				if(alert_sms == null) alert_sms = "0";
				
				HashMap<String,String> paraMap = new HashMap<String,String>();
				paraMap.put("user_name", user_name );
				paraMap.put("user_id", user_id );
				paraMap.put("user_pw", user_pw );
				paraMap.put("user_birthday", user_birthday );
				paraMap.put("user_gender", user_gender );
				paraMap.put("postcode", postcode );
				paraMap.put("addr1", addr1 );
				paraMap.put("addr2", addr2 );
				paraMap.put("phone", phone );
				paraMap.put("email", email );
				paraMap.put("alert_email", alert_email ); 
				paraMap.put("alert_sms", alert_sms );
				
				result = mdao.joinMemberByNormal(paraMap);
				
				
				if ( result == 1) {
					
					// 반려동물 insert 하기
					List<PetVO> petMap = new ArrayList<PetVO>();
					int optionPetCount = Integer.parseInt( mtrequest.getParameter("optionPetCount") );
					
					for ( int i =1; i<= optionPetCount; i++) {
						
						String pet_name  = mtrequest.getParameter("pet_name"+i).trim();
						String pet_birthday  = mtrequest.getParameter("pet_birthday"+i);
						String pet_type  = mtrequest.getParameter("pet_type"+i);
						String pet_neutral  = mtrequest.getParameter("pet_neutral"+i);
						String pet_weight  = mtrequest.getParameter("pet_weight"+i).trim();
						String pet_gender  = mtrequest.getParameter("pet_gender"+i);
						String pet_photo  = mtrequest.getFilesystemName("pet_photo"+i);
						
						System.out.println(pet_photo);
						
						if( pet_name==null || "".equals(pet_name) || pet_birthday==null || "none".equalsIgnoreCase(pet_neutral) || 
							pet_weight==null || "".equals(pet_weight) || "none".equalsIgnoreCase(pet_gender)	) 
						{
							
							String file = imagesDir+"\\"+pet_photo;
							
							File fileEx = new File(file);
							
							if ( fileEx.exists()  ) {
								fileEx.delete();
							}
							
							continue;
						}

						PetVO pvo = new PetVO();
						pvo.setPet_name(pet_name);
						pvo.setFk_email(email);
						pvo.setPet_birthday(pet_birthday);
						pvo.setPet_type(pet_type);
						pvo.setPet_neutral(pet_neutral);
						pvo.setPet_weight(Integer.parseInt(pet_weight));
						pvo.setPet_gender(pet_gender);
						pvo.setPet_photo(pet_photo);
						
						petMap.add(pvo);
					}
					
					if(petMap.size() != 0) {
					
						mdao.insertPetInfo(petMap);			// petMap.size 와 n 이 같으면 됨
					}
				}

			} // 일반 회원가입 끝 --------------------------------------------------------------
			
			
			if(result==1) {			// 회원가입에 성공 !
				
				message = "회원가입에 성공하셨습니다. 하빈 펫푸드의 가족이 되신 것을 환영합니다!";
				loc = request.getContextPath()+"/main.dog";
			}
			else {					// 회원가입에 실패 !
				
				message = "회원가입에 실패하셨습니다.";
				loc = request.getContextPath()+"/register/mainJoinPage.dog";
			}

		
		} // end of POST 로 들어왔을 때
		// GET 으로 들어왔을 때
		else {						
			
			message = "잘못된 접근 경로입니다.";						// alert 로 띄울 메시지
			loc = request.getContextPath()+"/main.dog";		// 이동할 페이지
		}
		
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		super.setViewPage("/WEB-INF/msg.jsp");
		
		
	} // end of execute -----------
	
} // end of class ------------------------
