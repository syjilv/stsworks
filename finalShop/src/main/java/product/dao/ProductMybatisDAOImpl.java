package product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.dto.ProductDTO;

@Repository("productmybatis")
public class ProductMybatisDAOImpl implements ProductDAO {
	@Autowired
	SqlSession sqlsession;

	@Override
	public List<ProductDTO> productlist(String category) {
		System.out.println("mybatis");
		return sqlsession.selectList("finalshop.product.list", category);
	}

	@Override
	public List<ProductDTO> searchTopProduct() {
		System.out.println("mybatis");
		return sqlsession.selectList("finalshop.product.toplist");
	}
}
