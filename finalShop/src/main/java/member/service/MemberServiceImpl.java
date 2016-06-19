package member.service;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memberdao")
	MemberDAO dao;
	
	// ·Î±×ÀÎ
	@Override
	public MemberDTO login(MemberDTO member) {
		return dao.login(member);
	}
}
