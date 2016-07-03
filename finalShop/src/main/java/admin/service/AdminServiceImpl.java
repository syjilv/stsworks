
package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;
import admin.dto.AdminDTO;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	@Qualifier("admindao")
	AdminDAO dao;
	
	@Override
	public List<AdminDTO> accessLogList() {
		return dao.accessLogList();
	}

	@Override
	public List<AdminDTO> accessLogByMonth() {
		return dao.accessLogByMonth();
	}

	@Override
	public List<AdminDTO> accessLogByIP() {
		return dao.accessLogByIP();
	}

	@Override
	public List<AdminDTO> accessLogByURI() {
		return dao.accessLogByURI();
	}
}
