package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;

public class MyBatisConfig {
	private static SqlSessionFactory sessionFactory;
	
	public static SqlSessionFactory getSessionFactory(){
		if(sessionFactory==null){
			try {
				String resource = "mybatis/mybatis-config.xml";			
				InputStream inputStream = Resources.getResourceAsStream(resource);
				sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sessionFactory;
	}
}
