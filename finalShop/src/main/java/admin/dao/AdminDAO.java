package admin.dao;

import java.util.List;

import admin.dto.AdminDTO;

public interface AdminDAO {
	List<AdminDTO> accessLogList();
	List<AdminDTO> accessLogByMonth();
	List<AdminDTO> accessLogByIP();
	List<AdminDTO> accessLogByURI();
	
}