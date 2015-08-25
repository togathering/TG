package t0813;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncFilter implements Filter{
	private String encName;
	
	@Override
	public void destroy() {
		System.out.println("destroy()");
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("doFilter");
		
		req.setCharacterEncoding(encName);
		chain.doFilter(req, resp);
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("init()");
		encName = config.getInitParameter("enctype");
	}

}
