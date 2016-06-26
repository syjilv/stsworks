package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class BoardWriteController {
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.GET)
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.POST)
	public String runWrite(BoardDTO board) {
		service.write(board);
		return "redirect:/board/list.do";
	}
}