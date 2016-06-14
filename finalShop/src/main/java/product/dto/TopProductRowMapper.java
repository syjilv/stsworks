package product.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class TopProductRowMapper implements RowMapper<ProductDTO> {

	public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		System.out.println("rowNum : " + rowNum);
		ProductDTO prd = null;
		prd = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3));
		System.out.println(prd.toString());
		return prd;
	}
}