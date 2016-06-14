package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import product.dto.ProductDTO;
import product.service.ProductService;

@Controller
public class ProductListController {
	@Autowired
	ProductService service;

	@RequestMapping(value="/prdlist.do", method=RequestMethod.GET)
	public ModelAndView prdList(String category) {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> list = service.productlist(category);
		mav.addObject("list", list);
		mav.setViewName("prdlist");
		return mav;
	}
}