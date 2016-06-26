package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
import board.dto.ReplyDTO;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	@Qualifier("boarddao")
	BoardDAO dao;
	
	// 게시물 수 조회
	@Override
	public int listSize() {
		return dao.listSize();
	}
	
	@Override
	public List<BoardDTO> list(int page_no) {
		return dao.list(page_no);
	}

	@Override
	public BoardDTO view(String board_no) {
		return dao.view(board_no);
	}

	@Override
	public void write(BoardDTO board) {
		dao.write(board);
	}

	@Override
	public void modify(BoardDTO board) {
		dao.modify(board);
	}

	@Override
	public void delete(String board_no) {
		dao.delete(board_no);
	}

	@Override
	public void viewCount(String board_no) {
		dao.viewCount(board_no);
	}

	@Override
	public int searchListSize(String target, String keyword) {
		return dao.searchListSize(target, keyword);
	}

	@Override
	public List<BoardDTO> search(String target, String keyword, int pageNo) {
		return dao.search(target, keyword, pageNo);
	}


	@Override
	public int replySize(String board_no) {
		return dao.replySize(board_no);
	}
	
	@Override
	public List<ReplyDTO> replyView(String board_no) {
		return dao.replyView(board_no);
	}

	@Override
	public void replyWrite(ReplyDTO reply) {
		dao.replyWrite(reply);		
	}

	@Override
	public void replyModify(ReplyDTO reply) {
		dao.replyModify(reply);
	}

	@Override
	public void replyDelete(String seq) {
		dao.replyDelete(seq);
	}

}
