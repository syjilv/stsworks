package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.dto.ReplyDTO;
import board.service.BoardService;

@Controller
public class ReplyModifyController {
	@Autowired
	BoardService service;

	// GET으로 접근할 경우 목록으로 리턴
	@RequestMapping(value="/board/reply_modify.do", method=RequestMethod.GET)
	public String returnToList() {
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/reply_modify.do", method=RequestMethod.POST)
	public String runModify(HttpServletRequest request, ReplyDTO reply) {
		String ref = request.getHeader("referer");
		service.replyModify(reply);
		return "redirect:" + ref;
	}
}