package t0813;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		//Context자원반환
		System.out.println("MyListener종료");
	}

	@Override
	public void contextInitialized(ServletContextEvent ctxEvent) {
		//Context초기화작업
		ServletContext application = ctxEvent.getServletContext();
		application.setAttribute("book", new Book());
		System.out.println("MyListener초기화완료");
	}
	
}
