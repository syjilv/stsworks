package board.service;

import java.util.List;

import board.dto.BoardDTO;

public interface BoardService {

	// �Խù� �� ��ȸ
	public int count();

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
	int searchCount(String target, String keyword);

	// �Խù� �˻�
	List<BoardDTO> search(String target, String keyword, int pageNo);

}