package product.service;

import java.util.List;

import product.dto.ProductDTO;

public interface ProductService {
	
	List<ProductDTO> productlist(String category);	//ProductDAOImpl의 productlist()를 호출하는 메소드
	List<ProductDTO> searchTopProduct();
}
