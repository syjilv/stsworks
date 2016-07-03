package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.dto.AdminDTO;
import admin.service.AdminService;

@Controller
public class AdminAccessLogController {
	@Autowired
	AdminService service;
	
	@RequestMapping(value="/admin/accesslog.do", method=RequestMethod.GET)
	public ModelAndView runResult() {
		ModelAndView mav = new ModelAndView();

		List<AdminDTO> list = service.accessLogList();
		List<AdminDTO> byMonth = service.accessLogByMonth();
		List<AdminDTO> byIP = service.accessLogByIP();
		List<AdminDTO> byURI = service.accessLogByURI();
		
		mav.addObject("list", list);
		mav.addObject("byMonth", byMonth);
		mav.addObject("byIP", byIP);
		mav.addObject("byURI", byURI);

		mav.setViewName("admin/accesslog");

		return mav;
	}
}