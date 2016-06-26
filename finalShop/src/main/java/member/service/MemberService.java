package member.service;

import member.dto.MemberDTO;

public interface MemberService {

	//·Î±×ÀÎ
	MemberDTO login(String mem_id, String pwd);
}