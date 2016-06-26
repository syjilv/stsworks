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

	// �Խù� �� ��ȸ
	@Override
	public int listSize() {
		return sqlsession.selectOne("finalshop.board.listSize");
	}
	
	// ��� ��ȸ
	@Override
	public List<BoardDTO> list(int page_no) {
		return sqlsession.selectList("finalshop.board.list", page_no);
	}
	
	// �Խù� ��ȸ
	@Override
	public BoardDTO view(String board_no) {
		return sqlsession.selectOne("finalshop.board.view", board_no);
	}
	
	// �Խù� �ۼ�
	@Override
	public void write(BoardDTO board) {
		
		// DB ���� �� �̱���Ʈ ���� ������ replace
		board.setTitle(board.getTitle().replaceAll("'","��"));
		board.setText(board.getText().replaceAll("'","��"));

		sqlsession.insert("finalshop.board.write", board);
	}
	
	// �Խù� ���� 
	@Override
	public void modify(BoardDTO board) {
		sqlsession.update("finalshop.board.modify", board);
	}
	
	// ��ȸ��
	@Override
	public void viewCount(String board_no) {
		sqlsession.update("finalshop.board.viewCount", board_no);
	}
	
	// �Խù� ����
	@Override
	public void delete(String board_no) {
		sqlsession.update("finalshop.board.delete", board_no);
	}
	
	// �˻���� ���
	@Override
	public int searchListSize(String target, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", target);
		map.put("keyword", keyword);
		
		return sqlsession.selectOne("finalshop.board.searchListSize", map);
	}
	
	// �˻�
	@Override
	public List<BoardDTO> search(String target, String keyword, int page_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("target", target);
		map.put("keyword", keyword);
		map.put("page_no", page_no);

		return sqlsession.selectList("finalshop.board.search", map);
	}

	// ��� �� ��ȸ
	@Override
	public int replySize(String board_no) {
		return sqlsession.selectOne("finalshop.board.replySize", board_no);
	}
	
	// ��� ��ȸ
	@Override
	public List<ReplyDTO> replyView(String board_no) {
		return sqlsession.selectList("finalshop.board.replyView", board_no);
	}
	// ��� �ۼ�
	@Override
	public void replyWrite(ReplyDTO reply) {
		reply.setReply(reply.getReply().replaceAll("'","��"));
		sqlsession.insert("finalshop.board.replyWrite", reply);		
	}
	// ��� ����
	@Override
	public void replyModify(ReplyDTO reply) {
		sqlsession.update("finalshop.board.replyModify", reply);
		
	}
	// ��� ����
	@Override
	public void replyDelete(String seq) {
		sqlsession.update("finalshop.board.replyDelete", seq);
	}
}
