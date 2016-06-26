package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.dto.MemberDTO;
import member.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;

	// ·Î±×¾Æ¿ô
	@RequestMapping("/member/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {
		String ref = request.getHeader("referer");
		session.removeAttribute("member");
		return "redirect:" + ref;
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(@RequestParam(value = "ref", required = false) String ref, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(ref == null) { 
			ref = request.getHeader("referer");
		}
		mav.addObject("ref", ref);
		mav.setViewName("member/login");
		return mav;
	}
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String runLogin(HttpSession session, String mem_id, String pwd, String ref) {
		MemberDTO member = service.login(mem_id, pwd);
		if (member != null) {
			session.setAttribute("member", member);
		}
		
		return "redirect:" + ref;
	}
}