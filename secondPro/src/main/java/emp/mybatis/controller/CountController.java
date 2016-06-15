package emp.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.service.MyEmpService;
// mybatis 기반 - myemp의 인원수 구하기
@Controller
public class CountController {
	@Autowired
	MyEmpService service;
	
	@RequestMapping("/count.do")
	public String main() {
		int result = service.count();
		System.out.println("=====================================================" + result);
		return "index";
	}
}