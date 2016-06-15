package emp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import emp.dto.MyEmpDTO;

@Repository("empmybatis")
public class MyEmpMybatisDAOImpl implements MyEmpDAO {
	//Spring에서 Mybatis를 사용하기 위한 모든 기능을 제공해주는 핵심 클래스 - JdbcTemplate과 같은 개념
	@Autowired
	SqlSession sqlSession;

	@Override
	public int count() {
		int result = sqlSession.selectOne("kitri.myemp.count");
		return result;
	}

	@Override
	public void insert(MyEmpDTO user) {
		sqlSession.insert("kitri.myemp.insert", user);
	}

	@Override
	public void update(MyEmpDTO userInfo) {
		sqlSession.update("kitri.myemp.update", userInfo);
	}

	@Override
	public void delete(String id) {
		sqlSession.delete("kitri.myemp.delete", id);
	}

	@Override
	public MyEmpDTO login(String id, String pass) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyEmpDTO> getMemberList() {
		return sqlSession.selectList("kitri.myemp.list");
	}

	@Override
	public List<MyEmpDTO> findByAddr(String addr) {
		return sqlSession.selectList("kitri.myemp.search", addr);
	}

	@Override
	public MyEmpDTO getDetail(String id) {
		return sqlSession.selectOne("kitri.myemp.read", id); 
	}

}
