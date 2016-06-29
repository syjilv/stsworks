package product.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import product.comment.dto.PrdCommentWordCountDTO;
import product.comment.service.PrdCommentService;

@Controller
public class PrdCommentWordCountResultController {
	@Autowired
	PrdCommentService service;
	
	@RequestMapping(value="/product/word_count_result.do", method=RequestMethod.GET)
	public ModelAndView runResult() {
		ModelAndView mav = new ModelAndView();

		List<PrdCommentWordCountDTO> result = service.wordCountList();

		mav.addObject("result", result);
		mav.setViewName("product/wordCountResult");

		return mav;
	}
}