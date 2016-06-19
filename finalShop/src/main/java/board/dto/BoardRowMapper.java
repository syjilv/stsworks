package board.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BoardRowMapper implements RowMapper<BoardDTO> {

	@Override
	public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// System.out.println("rowNum : " + rowNum);
		BoardDTO board = new BoardDTO(rs.getString(1), rs.getString(2),
				rs.getString(3), rs.getString(4), rs.getInt(5),
				rs.getString(6), rs.getString(7), rs.getString(8),
				rs.getString(9));
		// System.out.println(dto.toString());
		return board;
	}

}
