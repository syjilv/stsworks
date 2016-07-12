package product.compare.service;

import java.util.List;

import product.compare.dto.ProductCompareDTO;

public interface ProductCompareService {
	public int compareTotal();
	public List<ProductCompareDTO> compareList(int page_no);
}
