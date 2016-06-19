package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import board.dto.BoardDTO;
import board.dto.BoardRowMapper;

@Repository("boarddao")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private JdbcTemplate template;

	@Autowired
	SqlSession sqlsession;

	// 게시물 수 조회
	@Override
	public int count() {
		return sqlsession.selectOne("finalshop.board.count");
	}
	
	// 목록 조회
	@Override
	public List<BoardDTO> list(int page_no) {
		return sqlsession.selectList("finalshop.board.list", page_no);
	}
	
	// 게시물 조회
	@Override
	public BoardDTO view(String board_no) {
		return sqlsession.selectOne("finalshop.board.view", board_no);
	}
	
	// 게시물 작성
	@Override
	public void write(BoardDTO board) {
		
		// DB 삽입 전 싱글쿼트 오류 방지용 replace
		board.setTitle(board.getTitle().replaceAll("'","′"));
		board.setText(board.getText().replaceAll("'","′"));

		sqlsession.insert("finalshop.board.write", board);
	}
	
	// 게시물 수정 
	@Override
	public void modify(BoardDTO board) {
		sqlsession.update("finalshop.board.modify", board);
	}
	
	// 조회수
	@Override
	public void viewCount(String board_no) {
		sqlsession.update("finalshop.board.viewCount", board_no);
	}
	
	// 게시물 삭제
	@Override
	public void delete(String board_no) {
		sqlsession.update("finalshop.board.delete", board_no);
	}
	
	
	@Override
	public int searchCount(String target, String keyword) {
		String sql = "select count(*) from TB_BOARD b, TB_MEM m where b.MEM_ID = m.MEM_ID and b.DEL_FLG = 'N' and ";
		
		if(target.equals("title")) {
			sql += "b.TITLE like '%" + keyword + "%'";
		} else if(target.equals("all")) {
			sql += "(b.TITLE like '%" + keyword + "%' or b.TEXT like '%" + keyword + "%')";
		} else if(target.equals("memNm")) {
			sql += "m.MEM_NM like '%" + keyword + "%'";
		} else if(target.equals("memId")) {
			sql += "m.MEM_ID like '%" + keyword + "%'";
		}

		return template.queryForObject(sql, Integer.class);
	}
	
	// 검색
	@Override
	public List<BoardDTO> search(String target, String keyword, int pageNo) {
		String sql = "select u.BOARD_NO, u.MEM_ID, u.TITLE, u.TEXT, u.COUNT, u.DEL_FLG, u.REG_DTM, u.MOD_DTM, u.MEM_NM from "
				   + "(select ROWNUM n, t.* from "
				   + "(select b.*, m.MEM_NM as MEM_NM from TB_BOARD b, TB_MEM m where b.MEM_ID = m.MEM_ID and DEL_FLG = 'N' and ";
		
		if(target.equals("title")) {
			sql += "b.TITLE like '%" + keyword + "%' order by to_number(BOARD_NO) desc) t ";
		} else if(target.equals("all")) {
			sql += "(b.TITLE like '%" + keyword + "%' or b.TEXT like '%" + keyword + "%') order by to_number(BOARD_NO) desc) t ";
		} else if(target.equals("memNm")) {
			sql += "m.MEM_NM like '%" + keyword + "%' order by to_number(BOARD_NO) desc) t ";
		} else if(target.equals("memId")) {
			sql += "m.MEM_ID like '%" + keyword + "%' order by to_number(BOARD_NO) desc) t ";
		}
		sql += "where ROWNUM <= " + (pageNo * 10) + ") u where u.n >= " + (pageNo * 10 - 9);

		return template.query(sql, new BoardRowMapper());
	}
	
	
}
