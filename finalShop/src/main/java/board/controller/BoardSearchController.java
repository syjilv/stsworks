package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class BoardSearchController {
	@Autowired
	BoardService service;

	// parameter가 없을 경우 보드리스트로 넘기기
	@RequestMapping(value="/board_search.do", params="!keyword")
	public String seacrh() {
		return "redirect:board_list.do";
	}
	
	@RequestMapping(value="/board_search.do", method=RequestMethod.GET)
	public ModelAndView runBoardSearch(String target, String keyword, int pageNo, String boardNo) {
		ModelAndView mav = new ModelAndView();

		int count = service.searchCount(target, keyword);
		List<BoardDTO> list = service.search(target, keyword, pageNo);

		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("target", target);
		mav.addObject("keyword", keyword);
		mav.addObject("pageNo", pageNo);
		mav.addObject("boardNo", boardNo);
		mav.addObject("mode", "search");
		mav.setViewName("board/list");

		return mav;
	}
}