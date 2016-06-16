package aop01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AOPTest02 {

	public static void main(String[] args) {
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/bean02.xml");
		DAO dao = (DAO)factory.getBean("dao");
		dao.getUser();
		dao.getUserList(new UserDTO());
		dao.addUser(new UserDTO());
		dao.delUser(new UserDTO());
		dao.selectAll();
	}
}
