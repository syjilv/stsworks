package product.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.dto.ReplyDTO;
import board.service.BoardService;
import product.comment.dto.PrdCommentDTO;
import product.comment.service.PrdCommentService;

@Controller
public class PrdCommentModifyController {
	@Autowired
	PrdCommentService service;

	// GET으로 접근할 경우 목록으로 리턴
	@RequestMapping(value="/product/comment_modify.do", method=RequestMethod.GET)
	public String returnToList() {
		return "redirect:/product/prdlist.do";
	}
	
	@RequestMapping(value="/product/comment_modify.do", method=RequestMethod.POST)
	public String runModify(HttpServletRequest request, PrdCommentDTO comment) {
		String ref = request.getHeader("referer");
		service.commentModify(comment);;
		return "redirect:" + ref;
	}
}