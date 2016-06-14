package product.dao;

import java.util.List;

import product.dto.ProductDTO;

public interface ProductDAO {
	List<ProductDTO> productlist (String category);
	List<ProductDTO> searchTopProduct();
}