package aop.anno02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import aop.anno01.DAO;
import aop.anno01.UserDTO;

public class AOPTest04 {

	public static void main(String[] args) {
		ApplicationContext factory =
				new ClassPathXmlApplicationContext("config/aopanno.xml");
		DAO dao = (DAO) factory.getBean("userdao");
		dao.getUser();
		dao.getUserList(new UserDTO());
		dao.addUser(new UserDTO());
		dao.delUser(new UserDTO());
		dao.selectAll();
	}
}
