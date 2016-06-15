package emp.mybatis.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;

@Controller
public class MybatisUpdateController {
	@Autowired
	MyEmpService service;
	
	@RequestMapping(value="/mybatisUpdate.do", method=RequestMethod.POST)
	public ModelAndView runSearch(HttpServletRequest req, MyEmpDTO user)  {
		service.update(user);
		return new ModelAndView("redirect:mybatisList.do");
	}
	
	
}
