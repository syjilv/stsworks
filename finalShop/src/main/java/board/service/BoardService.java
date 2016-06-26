package board.service;

import java.util.List;

import board.dto.BoardDTO;
import board.dto.ReplyDTO;

public interface BoardService {

	// �Խù� �� ��ȸ
	public int listSize();

	// ��� ��ȸ
	List<BoardDTO> list(int page_no);

	// �Խù� ��ȸ
	BoardDTO view(String board_no);

	// �Խù� �ۼ�
	void write(BoardDTO board);

	// �Խù� ����
	void modify(BoardDTO board);

	// �Խù� ����
	void delete(String boardNo);
	
	// ��ȸ��
	void viewCount(String board_no);

	// �˻� �Խù� ī��Ʈ
	int searchListSize(String target, String keyword);

	// �Խù� �˻�
	List<BoardDTO> search(String target, String keyword, int pageNo);

	
	// ��� �� ��ȸ
	int replySize(String board_no);
	
	// ��� ��ȸ
	List<ReplyDTO> replyView(String board_no); 
	
	// ��� �ۼ�
	void replyWrite(ReplyDTO reply);
	
	// ��� ����
	void replyModify(ReplyDTO reply);
	
	// ��� ����
	void replyDelete(String seq);
	
}