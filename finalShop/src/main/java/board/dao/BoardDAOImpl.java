package board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.dto.BoardDTO;
import board.dto.ReplyDTO;

@Repository("boarddao")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlsession;

	// 게시물 수 조회
	@Override
	public int listSize() {
		return sqlsession.selectOne("finalshop.board.listSize");
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
	
	// 검색결과 목록
	@Override
	public int searchListSize(String target, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", target);
		map.put("keyword", keyword);
		
		return sqlsession.selectOne("finalshop.board.searchListSize", map);
	}
	
	// 검색
	@Override
	public List<BoardDTO> search(String target, String keyword, int page_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("target", target);
		map.put("keyword", keyword);
		map.put("page_no", page_no);

		return sqlsession.selectList("finalshop.board.search", map);
	}

	// 댓글 수 조회
	@Override
	public int replySize(String board_no) {
		return sqlsession.selectOne("finalshop.board.replySize", board_no);
	}
	
	// 댓글 조회
	@Override
	public List<ReplyDTO> replyView(String board_no) {
		return sqlsession.selectList("finalshop.board.replyView", board_no);
	}
	// 댓글 작성
	@Override
	public void replyWrite(ReplyDTO reply) {
		reply.setReply(reply.getReply().replaceAll("'","′"));
		sqlsession.insert("finalshop.board.replyWrite", reply);		
	}
	// 댓글 수정
	@Override
	public void replyModify(ReplyDTO reply) {
		sqlsession.update("finalshop.board.replyModify", reply);
		
	}
	// 댓글 삭제
	@Override
	public void replyDelete(String seq) {
		sqlsession.update("finalshop.board.replyDelete", seq);
	}
}
