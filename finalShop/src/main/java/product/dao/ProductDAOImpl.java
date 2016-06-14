package product.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import product.dto.ProductDTO;
import product.dto.ProductRowMapper;

@Repository("productdao")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private JdbcTemplate template;

	@Override
	public List<ProductDTO> productlist(String category) {
		String sql = "select * from TB_PRODUCT where CATEGORY_NO like ?";
		System.out.println(sql);
		return template.query(sql, new Object[]{category}, new ProductRowMapper());
	}

	@Override
	public List<ProductDTO> searchTopProduct() {

		String sql = "select v.* from("
				+ "		select T.PRD_NO, T.PRD_NM, T.IMG_GEN_FILE_NM "
				+ "		from TB_PRODUCT T, TB_ORDER_PRODUCT O "
				+ "		where T.PRD_NO = O.PRD_NO "
				+ "		group by T.PRD_NO, T.PRD_NM, T.IMG_GEN_FILE_NM "
				+ "		order by sum(O.QTY) DESC) v "
				+ "where rownum <= 8";
		
		return template.query(sql, new ProductRowMapper());
	}
}
