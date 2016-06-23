package spring.data.mongodb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.data.mongodb.dto.ScoreDTO;
import spring.data.mongodb.service.ScoreMongoService;

@Controller
public class MongoFindController {
	@Autowired
	ScoreMongoService service;
	@RequestMapping(value="/score/detail", method=RequestMethod.GET)
	public ModelAndView findbyId(String key, String value, String action){
		ScoreDTO document = service.findById(key,  value);
		String loc = null;
		if(action.equals("READ")) {
			loc = "mongo_detail";
		} else {
			loc = "mongo_update";
		}
		return new ModelAndView(loc, "document", document);
	}

	@RequestMapping(value="/score/searchform",method=RequestMethod.GET)
	public String searchform(){
		return "search";
	}
	@RequestMapping(value="/score/search",method=RequestMethod.POST)
	public ModelAndView search(String field, String value){
		List<ScoreDTO> mongolist = service.findCriteria(field, value);
		
		return new ModelAndView("list", "mongolist", mongolist);
	}
	
	@RequestMapping(value="/score/update",method=RequestMethod.POST)
	public String update(ScoreDTO doc){
		service.update(doc);
		return "redirect:/score/list?pageNo=0";
	}
	
	@RequestMapping(value="/score/delete",method=RequestMethod.GET)
	public String delete(String key, String value) {
		service.delete(key, value);
		return "redirect:/score/list?pageNo=0";
	}	
	
}






