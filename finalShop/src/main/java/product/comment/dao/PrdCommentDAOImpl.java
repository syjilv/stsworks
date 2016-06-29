package product.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.comment.dto.PrdCommentDTO;
import product.comment.dto.PrdCommentWordCountDTO;

@Repository("prdcommentdao")
public class PrdCommentDAOImpl implements PrdCommentDAO {

	@Autowired
	SqlSession sqlsession;

	@Override
	public int commentSize(String prd_no) {
		return sqlsession.selectOne("finalshop.prdComment.commentSize", prd_no);
	}

	@Override
	public List<PrdCommentDTO> commentView(String prd_no) {
		return sqlsession.selectList("finalshop.prdComment.commentView", prd_no);
	}

	@Override
	public void commentWrite(PrdCommentDTO comment) {
		comment.setPrd_comment(comment.getPrd_comment().replaceAll("'","กว"));
		sqlsession.insert("finalshop.prdComment.commentWrite", comment);
		
	}

	@Override
	public void commentModify(PrdCommentDTO comment) {
		sqlsession.update("finalshop.prdComment.commentModify", comment);
		
	}

	@Override
	public void commentDelete(String seq) {
		sqlsession.update("finalshop.prdComment.commentDelete", seq);
	}

	@Override
	public List<PrdCommentWordCountDTO> wordCountList() {
		return sqlsession.selectList("finalshop.prdComment.wordCount.list");
	}
	
	
}
