package spring.data.mongodb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.data.mongodb.dto.ScoreDTO;
import spring.data.mongodb.service.ScoreMongoService;

@Controller
public class MongoInsertController {
	@Autowired
	ScoreMongoService service;

	@RequestMapping(value="/score/insertform",method=RequestMethod.GET)
	public String insertForm(){
		return "mongo_insert";
	}
	
	@RequestMapping(value="/score/insert",method=RequestMethod.POST)
	public String insert(ScoreDTO document){
		service.insertDocument(document);
		return "redirect:/score/list?pageNo=0";
	}

	@RequestMapping(value="/score/multiinsert")
	public String multiInsert(){
		List<ScoreDTO> docs = new ArrayList<ScoreDTO>();
		ScoreDTO doc = null;
		for (int i = 0; i < 5; i++) {
			doc = new ScoreDTO();
			doc.setId("multi" + i);
			doc.setName("multi" + i);
			doc.setAddr("¼­¿ï");
			doc.setDept("±âÈ¹½Ç");
			docs.add(doc);
		}
		service.insertAllDocument(docs);
		return "redirect:/score/list?pageNo=0";
	}
	
}
