package emp.mybatis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import emp.dto.MyEmpDTO;
import emp.service.MyEmpService;

@Controller
public class MybatisSearchController {
	@Autowired
	MyEmpService service;
	
	@RequestMapping(value="/mybatisSearch.do", params="!search")
	public String main() {
		return "mybatisSearch/form";
	}
	
	@RequestMapping(value="/mybatisSearch.do", method=RequestMethod.GET)
	public ModelAndView runSearch(HttpServletRequest req,
			HttpServletResponse res, String search)  {
		ModelAndView mav = new ModelAndView();
		List<MyEmpDTO> userlist = service.findByAddr(search);
		System.out.println(search);
		
		mav.addObject("userlist", userlist);
		mav.setViewName("mybatisSearch/list");
		return mav;
	}
}
