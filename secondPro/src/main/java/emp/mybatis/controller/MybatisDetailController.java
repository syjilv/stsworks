package emp.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;

@Controller
public class MybatisDetailController {
	@Autowired
	MyEmpService service;

	@RequestMapping("/mybatisDetail.do")
	public ModelAndView runDetail(String id) {
		ModelAndView mav = new ModelAndView();
		MyEmpDTO user = service.getDetail(id);
		mav.addObject("user", user);
		mav.setViewName("mybatisDetail");
		return mav;
	}

}
