package product.compare.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.comment.dto.PrdCommentDTO;
import product.compare.dto.ProductCompareDTO;
import product.compare.service.ProductCompareService;
import product.dto.ProductDTO;

@Controller
public class ProductCompareController {
	@Autowired
	ProductCompareService service;
	
	@RequestMapping(value = "/product/compare.do", method = RequestMethod.GET)
	public ModelAndView showPage(String prd_no,
			@RequestParam(value="page_no", defaultValue="0") String page_no){
		ModelAndView mav = new ModelAndView();
		int page = Integer.parseInt(page_no);
		int total = service.compareTotal();
		List<ProductCompareDTO> list = service.compareList(page);
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.setViewName("product/compare");
		return mav;
	}
}