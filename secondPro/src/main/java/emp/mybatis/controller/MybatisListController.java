package emp.mybatis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;
// mybatis 기반 - myemp의 인원수 구하기
@Controller
public class MybatisListController {
	@Autowired
	MyEmpService service;
	
	@RequestMapping("/mybatisList.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List<MyEmpDTO> userlist = service.getMemberList();
		mav.addObject("userlist", userlist);
		mav.setViewName("mybatislist");
		return mav;
	}
}