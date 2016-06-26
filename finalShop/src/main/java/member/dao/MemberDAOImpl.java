package member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.dto.MemberDTO;

@Repository("memberdao")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlsession;

	// ·Î±×ÀÎ
	@Override
	public MemberDTO login(String mem_id, String pwd) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("pwd", pwd);
		return sqlsession.selectOne("finalshop.member.login", map);
	}
}
