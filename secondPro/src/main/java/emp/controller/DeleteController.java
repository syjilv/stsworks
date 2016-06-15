package emp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import emp.service.MyEmpService;

@Controller
public class DeleteController {
	@Autowired
	MyEmpService service;
	
//	@RequestMapping(value="/insert.do", method=RequestMethod.GET)
//	public String showPage() {
//		return "emp/memberInput";
//	}
	
	//post방식으로 요청될 때 실행할 메소드, - 실제 db에 insert하기 위한 기능을 수행 
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView runDelete(HttpServletRequest req, String id) {
		service.delete(id);
		return new ModelAndView("redirect:list.do");
	}
}
