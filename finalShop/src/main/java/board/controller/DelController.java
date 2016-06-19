package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.service.BoardService;

@Controller
public class DelController {
	@Autowired
	BoardService service;
	
	// parameter �� ���� ������ ��� ������� ����
	@RequestMapping(value="/del.do", params="!boardNo")
	public String returnToList() {
		return "redirect:board_list.do";
	}
	
	@RequestMapping(value="/del.do", method=RequestMethod.POST)
	public String runDel(String boardNo) {
		service.delete(boardNo);
		return "redirect:board_list.do";
	}
}
