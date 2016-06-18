package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.dto.ProductDTO;
import product.service.ProductService;

@Controller
public class ProductListController {
	@Autowired
	ProductService service;

	@RequestMapping(value = "/prdlist.do", method = RequestMethod.GET)
	public ModelAndView prdList(@RequestParam(value = "category", defaultValue="%") String category) {
		ModelAndView mav = new ModelAndView();

//		if (category.equals(null)) {
			System.out.println("11111111");
			List<ProductDTO> toplist = service.searchTopProduct();
			mav.addObject("toplist", toplist);
//		}
		category = "%";
		System.out.println(category);
		List<ProductDTO> list = service.productlist(category);
		mav.addObject("list", list);
		mav.setViewName("prdlist");
		return mav;
	}
}