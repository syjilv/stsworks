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
public class BoardListController {
	@Autowired
	BoardService service;

	@RequestMapping(value="/board/board_list.do", method=RequestMethod.GET)
	public ModelAndView runBoardList(@RequestParam(value="page_no", defaultValue="1") int page_no) {
		ModelAndView mav = new ModelAndView();

		int count = service.count();
		List<BoardDTO> list = service.list(page_no);

		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page_no", page_no);
		mav.addObject("mode","list");
		mav.setViewName("board/list");

		return mav;
	}
}