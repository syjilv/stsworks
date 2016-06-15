package emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;

@Controller
public class DetailController {
	@Autowired
	MyEmpService service;

	@RequestMapping("/detail.do")
	public ModelAndView runDetail(String id) {
		ModelAndView mav = new ModelAndView();
		MyEmpDTO user = service.getDetail(id);
		mav.addObject("user", user);
		mav.setViewName("detail");
		return mav;
	}

}
