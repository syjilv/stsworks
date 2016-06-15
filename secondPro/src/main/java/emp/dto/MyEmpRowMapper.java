package emp.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

// JdbcTemplate같은 스프링 jdbc템플릿 클래스에서 select를 수행한 후 처리할 수 있도록
// 하나의 row에 대한 처리 정보를 담고 있는객체로 Query 메소드 내부에서 호출할 객체
public class MyEmpRowMapper implements RowMapper<MyEmpDTO> {
	
	@Override
	public MyEmpDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		System.out.println("rowNum : " + rowNum);
		MyEmpDTO emp = new MyEmpDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
		System.out.println(emp.toString());
		return emp;
	}

}
