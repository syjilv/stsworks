package product.compare.dao;

import java.util.List;

import product.compare.dto.ProductCompareDTO;

public interface ProductCompareDAO {
	public int compareTotal();
	public List<ProductCompareDTO> compareList(int page_no);
}
