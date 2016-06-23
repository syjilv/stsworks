package spring.data.mongodb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.data.mongodb.dao.MongoDAO;
import spring.data.mongodb.dto.ScoreDTO;

@Controller
public class MongoListController {
	@Autowired
	MongoDAO dao;
	@RequestMapping("/score/list")
	public ModelAndView getDocList(String pageNo) {
//		List<Score> mongolist = dao.findAll();
		int page = Integer.parseInt(pageNo);
		List<ScoreDTO> mongolist = dao.findAll(page);
		return new ModelAndView("list", "mongolist", mongolist);		
	}
}
