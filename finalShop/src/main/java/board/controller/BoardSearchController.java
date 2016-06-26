package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class BoardSearchController {
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/board/search.do", method=RequestMethod.GET)
	public ModelAndView runBoardSearch(String target, String keyword, 
									   @RequestParam(value="page_no", defaultValue="1") int page_no) {
		ModelAndView mav = new ModelAndView();

		if(keyword == null) {
			mav.setViewName("redirect:/finalshop/board/list.do");
		} else {
			int listSize = service.searchListSize(target, keyword);
			List<BoardDTO> list = service.search(target, keyword, page_no);
	
			mav.addObject("listSize", listSize);
			mav.addObject("list", list);
			mav.addObject("target", target);
			mav.addObject("keyword", keyword);
			mav.addObject("page_no", page_no);
			mav.addObject("mode", "search");
			mav.setViewName("board/list");
		}

		return mav;
	}
}