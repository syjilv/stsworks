package aop.anno01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AOPTest03 {

	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/aopanno.xml");
		DAO dao = (DAO)factory.getBean("userdao");
		dao.getUser();
		dao.getUserList(new UserDTO());
		dao.addUser(new UserDTO());
		dao.delUser(new UserDTO());

	}

}
