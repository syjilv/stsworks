package emp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;

@Controller
public class UpdateController {
	@Autowired
	MyEmpService service;
	
	@RequestMapping(value = "/update_form.do", method = RequestMethod.POST)
	public ModelAndView runSearchForm(HttpServletRequest req, MyEmpDTO user) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		mav.setViewName("update");
		return mav;
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView runSearch(HttpServletRequest req, MyEmpDTO user)  {
		System.out.println(user);
		service.update(user);
		return new ModelAndView("redirect:list.do");
	}
	
	
}
