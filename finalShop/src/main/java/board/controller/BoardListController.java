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

	@RequestMapping(value="/board/list.do", method=RequestMethod.GET)
	public ModelAndView runBoardList(@RequestParam(value="page_no", defaultValue="1") int page_no) {
		ModelAndView mav = new ModelAndView();

		int listSize = service.listSize();
		List<BoardDTO> list = service.list(page_no);

		mav.addObject("listSize", listSize);
		mav.addObject("list", list);
		mav.addObject("page_no", page_no);
		mav.addObject("mode","list");
		mav.setViewName("board/list");

		return mav;
	}
}