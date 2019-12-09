package common.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		urlPatterns = { "*.dog" }, 
		initParams = { 
				//@WebInitParam(name = "dogConfig", value = "D:/KH_ACADEMY/myjsp/Semi_Team1/WebContent/WEB-INF/dog.properties")
				@WebInitParam(name = "dogConfig", value = "C:/Users/user1/git/KH_semiproject/WebContent/WEB-INF/dog.properties")
		})

// C:/myjsp/Semi_Team1/WebContent/WEB-INF/dog.properties
// D:/KH_ACADEMY/myjsp/Semi_Team1/WebContent/WEB-INF/dog.properties

public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HashMap<String, Object> cmdMap = new HashMap<String, Object>();
	
	
		public void init(ServletConfig config) throws ServletException {
			
			Properties pr = new Properties();
			 
			FileInputStream fis = null;
			
			try {
				
				String props = config.getInitParameter("dogConfig");
				fis = new FileInputStream(props);	
				
				pr.load(fis);
				
				Enumeration<Object> en = pr.keys(); 			
				
				while( en.hasMoreElements() ) {
					
					String key_url = (String)en.nextElement();
					
					String className = pr.getProperty(key_url);
					
					if( className != null ) {
						
						className = className.trim();
						
						Class<?> cls = Class.forName(className);
							
						Object obj = cls.newInstance();
							
						
						cmdMap.put(key_url, obj);		
							
					}
					
				} // end of while ----------
				
			} catch (ClassNotFoundException e) {
				System.out.println(">>> 문자열로 명명되어진 클래스가 존재하지 않습니다.");
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				System.out.println(">>> dog.properties 파일이 없습니다. <<<");
				e.printStackTrace();
			} catch (IOException e ) {
				e.printStackTrace();
			} catch (Exception e ) {
				e.printStackTrace();
			}
			
		} // end of init --------------------------------------

		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			requestProcess(request, response);
		} // end of doGet -------------------------------------

		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			requestProcess(request, response);
		} // end of doPost --------------------------------------

		private void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			String uri = request.getRequestURI();
			System.out.println(uri);
			
			String ctxPath = request.getContextPath();
			
			String mapKey = uri.substring(ctxPath.length());
			System.out.println(mapKey);
			
			AbstractController action = (AbstractController) cmdMap.get(mapKey);
			if( action == null) {
				
				System.out.println(">>> " + mapKey + " URL 패턴에 매핑된 클래스는 없습니다.");
			}
			else {
				
				try {
					
					action.execute(request, response);
					
					boolean bool = action.isRedirect();
					String viewPage = action.getViewPage();
					
					if(bool == false) {		// forward 를 하겠다.
						
						RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
						dispatcher.forward(request, response);
						
					} else {				// sendredirect 를 하겠다.
						
						response.sendRedirect(viewPage);
						
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
		} // end of execute -------------------------------------------
		
		
	} // end of class ------------------------------------------------------
