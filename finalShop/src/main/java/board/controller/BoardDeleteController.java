package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.service.BoardService;

@Controller
public class BoardDeleteController {
	@Autowired
	BoardService service;
	
	// GET으로 접근할 경우 목록으로 리턴
	@RequestMapping(value="/board/board_delete.do", method=RequestMethod.GET)
	public String returnToList() {
		return "redirect:/board/board_list.do";
	}
	
	@RequestMapping(value="/board/board_delete.do", method=RequestMethod.POST)
	public String runDel(String board_no) {
		service.delete(board_no);
		return "redirect:/board/board_list.do";
	}
}