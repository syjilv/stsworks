package kr.kitri.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@RequestMapping("/test.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "���������� �Ѿ�� �����;�");
		mav.setViewName("test");
		return mav;
	}

}
