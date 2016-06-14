package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.dto.ProductDTO;
import product.service.ProductService;

@Controller
public class IndexController {
	@Autowired
	ProductService service;

	@RequestMapping("/index.do")
	public ModelAndView prdIndex() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> toplist = service.searchTopProduct();
		List<ProductDTO> list = service.productlist("%");
		mav.addObject("toplist", toplist);
		mav.addObject("list", list);
		mav.setViewName("index");
		return mav;
	}
}