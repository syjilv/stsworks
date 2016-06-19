package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.dto.MemberDTO;
import member.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;

	// ·Î±×¾Æ¿ô
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session, String ref) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String runLogin(HttpSession session, MemberDTO member, String ref) {
		MemberDTO mem = service.login(member);
		if (mem != null) {
			session.setAttribute("member", mem);
		}
		return "redirect:/";
	}
}