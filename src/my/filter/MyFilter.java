package my.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyFilter implements Filter {

	@Override //필터 인스턴스를 종료시키기 전에 호출되는 메소드
	public void destroy() { 
		
	}

	@Override //필터의 로직을 작성해주는 곳
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}

	@Override //서블릿 컨테이너가 필터 인스턴스를 초기화 하기 위해 호출되는 메소드
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
