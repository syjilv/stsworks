package emp.mybatis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;

@Controller
public class MybatisLoginController {
	@Autowired
	MyEmpService service;
	
	// ·Î±×¾Æ¿ô
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index.do";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginForm() {
		return "login/input";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String runLogin(HttpSession session, MyEmpDTO user) {
		MyEmpDTO userInfo = service.login(user);
		String ref = null;
		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
			ref = "redirect:index.do";
		} else {
			ref = "login/input";
		}
		return ref;
	}
}