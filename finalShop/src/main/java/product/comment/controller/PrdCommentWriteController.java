package product.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import product.comment.dto.PrdCommentDTO;
import product.comment.service.PrdCommentService;

@Controller
public class PrdCommentWriteController {
	@Autowired
	PrdCommentService service;
	
	// GET���� ������ ��� ������� ����
	@RequestMapping(value="/product/comment_write.do", method=RequestMethod.GET)
	public String returnToList() {
		return "redirect:/product/prdlist.do";
	}
	
	@RequestMapping(value="/product/comment_write.do", method=RequestMethod.POST)
	public String runWrite(HttpServletRequest request, PrdCommentDTO comment) {
		String ref = request.getHeader("referer");
		service.commentWrite(comment);
		return "redirect:" + ref;
	}
}