package member.service;

import member.dto.MemberDTO;

public interface MemberService {

	//�α���
	MemberDTO login(String mem_id, String pwd);
}