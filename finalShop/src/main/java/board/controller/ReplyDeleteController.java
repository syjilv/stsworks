package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.service.BoardService;

@Controller
public class ReplyDeleteController {
	@Autowired
	BoardService service;
	
	// GET으로 접근할 경우 목록으로 리턴
	@RequestMapping(value="/board/reply_delete.do", method=RequestMethod.GET)
	public String returnToList() {
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/reply_delete.do", method=RequestMethod.POST)
	public String runDel(HttpServletRequest request, String seq) {
		String ref = request.getHeader("referer");
		service.replyDelete(seq);
		return "redirect:" + ref;
	}
}