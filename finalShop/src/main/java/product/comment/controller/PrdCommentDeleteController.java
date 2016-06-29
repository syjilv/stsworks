package product.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.service.BoardService;
import product.comment.service.PrdCommentService;

@Controller
public class PrdCommentDeleteController {
	@Autowired
	PrdCommentService service;
	
	// GET���� ������ ��� ������� ����
	@RequestMapping(value="/product/comment_delete.do", method=RequestMethod.GET)
	public String returnToList() {
		return "redirect:/product/prdlist.do";
	}
	
	@RequestMapping(value="/product/comment_delete.do", method=RequestMethod.POST)
	public String runDel(HttpServletRequest request, String seq) {
		String ref = request.getHeader("referer");
		service.commentDelete(seq);
		return "redirect:" + ref;
	}
}