package product.compare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import product.compare.dao.ProductCompareDAO;
import product.compare.dto.ProductCompareDTO;

@Repository
public class ProductCompareServiceImpl implements ProductCompareService {
	@Autowired
	ProductCompareDAO dao;

	@Override
	public int compareTotal() {
		return dao.compareTotal();
	}
	
	@Override
	public List<ProductCompareDTO> compareList(int page_no) {
		return dao.compareList(page_no);
	}

}
