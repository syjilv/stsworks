package product.comment.service;

import java.util.List;

import product.comment.dto.PrdCommentDTO;
import product.comment.dto.PrdCommentWordCountDTO;

public interface PrdCommentService {

	// ��ȸ
	int commentSize(String prd_no);
	// ��� ��ȸ
	List<PrdCommentDTO> commentView(String prd_no); 
	// ��� �ۼ�
	void commentWrite(PrdCommentDTO comment);
	// ��� ����
	void commentModify(PrdCommentDTO comment);
	// ��� ����
	void commentDelete(String seq);
	
	//wordCount
	List<PrdCommentWordCountDTO> wordCountList();
}