package product.comment.dao;

import java.util.List;

import product.comment.dto.PrdCommentDTO;

public interface PrdCommentDAO {

	// Á¶È¸
	int commentSize(String prd_no);
	// ´ñ±Û Á¶È¸
	List<PrdCommentDTO> commentView(String prd_no); 
	// ´ñ±Û ÀÛ¼º
	void commentWrite(PrdCommentDTO comment);
	// ´ñ±Û ¼öÁ¤
	void commentModify(PrdCommentDTO comment);
	// ´ñ±Û »èÁ¦
	void commentDelete(String seq);
	
}