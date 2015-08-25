package t0813;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		//Context�ڿ���ȯ
		System.out.println("MyListener����");
	}

	@Override
	public void contextInitialized(ServletContextEvent ctxEvent) {
		//Context�ʱ�ȭ�۾�
		ServletContext application = ctxEvent.getServletContext();
		application.setAttribute("book", new Book());
		System.out.println("MyListener�ʱ�ȭ�Ϸ�");
	}
	
}
