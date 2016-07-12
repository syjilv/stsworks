package product.compare.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import product.compare.dto.ProductCompareDTO;
import product.compare.dto.ProductCompareRepository;

@Repository
public class ProductCompareDAOImpl implements ProductCompareDAO {
	@Autowired
	ProductCompareRepository repository;
	
	@Autowired
	MongoTemplate mongoTemplate;

	@Override
	public int compareTotal() {
		int total = (int) repository.count();
		return total;
	}
	
	@Override
	public List<ProductCompareDTO> compareList(int page_no) {
		Page<ProductCompareDTO> page = repository.findAll(new PageRequest(page_no, 3));
		List<ProductCompareDTO> list = page.getContent();
		return list;
	}
}
