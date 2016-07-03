package admin.service;

import java.util.List;

import admin.dto.AdminDTO;

public interface AdminService {
	List<AdminDTO> accessLogList();
	List<AdminDTO> accessLogByMonth();
	List<AdminDTO> accessLogByIP();
	List<AdminDTO> accessLogByURI();
}
