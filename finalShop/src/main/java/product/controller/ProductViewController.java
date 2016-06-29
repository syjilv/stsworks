package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.dto.ReplyDTO;
import product.comment.dto.PrdCommentDTO;
import product.comment.service.PrdCommentService;
import product.dto.ProductDTO;
import product.service.ProductService;

@Controller
public class ProductViewController {
	@Autowired
	ProductService service;

	@Autowired
	PrdCommentService prdCommentService;
	
	@RequestMapping(value = "/product/view.do", method = RequestMethod.GET)
	public ModelAndView showPage(String prd_no){
		ModelAndView mav = new ModelAndView();
		String view = "";
		ProductDTO product = service.productview(prd_no);
		int commentSize = prdCommentService.commentSize(prd_no); // 상품평 수
		List<PrdCommentDTO> commentList = prdCommentService.commentView(prd_no); // 상품평 목록
		mav.addObject("commentSize", commentSize);
		mav.addObject("commentList", commentList);
		mav.addObject("prd", product);
		mav.setViewName("product/view");
		return mav;
	}
}
