package board.service;

import java.util.List;

import board.dto.BoardDTO;
import board.dto.ReplyDTO;

public interface BoardService {

	// 게시물 수 조회
	public int listSize();

	// 목록 조회
	List<BoardDTO> list(int page_no);

	// 게시물 조회
	BoardDTO view(String board_no);

	// 게시물 작성
	void write(BoardDTO board);

	// 게시물 수정
	void modify(BoardDTO board);

	// 게시물 삭제
	void delete(String boardNo);
	
	// 조회수
	void viewCount(String board_no);

	// 검색 게시물 카운트
	int searchListSize(String target, String keyword);

	// 게시물 검색
	List<BoardDTO> search(String target, String keyword, int pageNo);

	
	// 댓글 수 조회
	int replySize(String board_no);
	
	// 댓글 조회
	List<ReplyDTO> replyView(String board_no); 
	
	// 댓글 작성
	void replyWrite(ReplyDTO reply);
	
	// 댓글 수정
	void replyModify(ReplyDTO reply);
	
	// 댓글 삭제
	void replyDelete(String seq);
	
}