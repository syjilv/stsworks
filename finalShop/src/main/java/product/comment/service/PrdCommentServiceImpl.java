
package product.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import product.comment.dao.PrdCommentDAO;
import product.comment.dto.PrdCommentDTO;
import product.comment.dto.PrdCommentWordCountDTO;
@Service
public class PrdCommentServiceImpl implements PrdCommentService {
	@Autowired
	@Qualifier("prdcommentdao")
	PrdCommentDAO dao;
	
	@Override
	public int commentSize(String prd_no) {
		return dao.commentSize(prd_no);
	}

	@Override
	public List<PrdCommentDTO> commentView(String prd_no) {
		return dao.commentView(prd_no);
	}

	@Override
	public void commentWrite(PrdCommentDTO comment) {
		dao.commentWrite(comment);
	}

	@Override
	public void commentModify(PrdCommentDTO comment) {
		dao.commentModify(comment);
		
	}

	@Override
	public void commentDelete(String seq) {
		dao.commentDelete(seq);
	}

	@Override
	public List<PrdCommentWordCountDTO> wordCountList() {
		return dao.wordCountList();
	}
}
