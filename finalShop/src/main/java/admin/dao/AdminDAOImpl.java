package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.dto.AdminDTO;

@Repository("admindao")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSession sqlsession;

	@Override
	public List<AdminDTO> accessLogList() {
		return sqlsession.selectList("finalshop.admin.accessLogList");
	}

	@Override
	public List<AdminDTO> accessLogByMonth() {
		return sqlsession.selectList("finalshop.admin.accessLogByMonth");
	}

	@Override
	public List<AdminDTO> accessLogByIP() {
		return sqlsession.selectList("finalshop.admin.accessLogByIP");
	}

	@Override
	public List<AdminDTO> accessLogByURI() {
		return sqlsession.selectList("finalshop.admin.accessLogByURI");
	}
	
	
}
