package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class BoardWriteController {
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.GET)
	public String write(HttpSession session) {
		// 로그인 세션이 없을 경우 로그인 폼으로 이동
//		if (session.getAttribute("mem") == null) {
//			return "redirect:login.do?ref=write";
//		}
		return "board/write";
	}
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.POST)
	public String runWrite(BoardDTO board) {
		service.write(board);
		return "redirect:/board/board_list.do";
	}
}