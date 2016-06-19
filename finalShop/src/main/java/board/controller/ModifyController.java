package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class ModifyController {
	@Autowired
	BoardService service;
	
	// parameter 값 없이 접근할 경우 목록으로 리턴
	@RequestMapping(value="/modify.do", params="!boardNo")
	public String returnToList() {
		return "redirect:board_list.do";
	}

	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public ModelAndView modifyForm(String boardNo) {
		ModelAndView mav = new ModelAndView();
		BoardDTO board = service.view(boardNo);
		mav.addObject("board", board);
		mav.setViewName("board/modify");
		return mav;
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public ModelAndView runModify(BoardDTO board) {
		service.modify(board);
		return new ModelAndView("redirect:view.do?boardNo=" + board.getBoardNo());
	}
}