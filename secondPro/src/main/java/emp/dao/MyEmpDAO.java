package emp.dao;

import java.util.List;

import emp.dto.MyEmpDTO;

public interface MyEmpDAO {
	//회원인원수 조회
	int count();
	//회원가입
	void insert(MyEmpDTO user);
	//회원정보수정
	void update(MyEmpDTO userInfo);
	//회원탈퇴
	void delete(String id);
	//로그인
	MyEmpDTO login(MyEmpDTO user);
	//회원목록보기
	List<MyEmpDTO> getMemberList();
	//주소로 검색
	List<MyEmpDTO> findByAddr(String addr);
	//개인정보보기
	MyEmpDTO getDetail(String id);
}