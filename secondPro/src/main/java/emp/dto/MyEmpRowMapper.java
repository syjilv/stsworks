package emp.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

// JdbcTemplate���� ������ jdbc���ø� Ŭ�������� select�� ������ �� ó���� �� �ֵ���
// �ϳ��� row�� ���� ó�� ������ ��� �ִ°�ü�� Query �޼ҵ� ���ο��� ȣ���� ��ü
public class MyEmpRowMapper implements RowMapper<MyEmpDTO> {
	
	@Override
	public MyEmpDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		System.out.println("rowNum : " + rowNum);
		MyEmpDTO emp = new MyEmpDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
		System.out.println(emp.toString());
		return emp;
	}

}
