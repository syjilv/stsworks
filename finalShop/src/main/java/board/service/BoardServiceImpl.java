package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	@Qualifier("boarddao")
	BoardDAO dao;
	
	// 게시물 수 조회
	@Override
	public int count() {
		return dao.count();
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
	public int searchCount(String target, String keyword) {
		return dao.searchCount(target, keyword);
	}

	@Override
	public List<BoardDTO> search(String target, String keyword, int pageNo) {
		return dao.search(target, keyword, pageNo);
	}

}
