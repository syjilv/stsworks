package emp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import emp.dto.MyEmpDTO;
import emp.dto.MyEmpRowMapper;

@Repository("empdao")
public class MyEmpDAOImpl implements MyEmpDAO {
	@Autowired
	private JdbcTemplate template;

	@Override
	public int count() {
		return template.queryForObject("select count(*) from myemp", Integer.class);
	}

	@Override
	public void insert(MyEmpDTO user) {
		String sql = "insert into myemp values(?, ?, ?, 1000, ?, '001', ?)";
		int result = template.update(sql, user.getId(), user.getPass(), user.getAddr(), user.getGrade(), user.getName());
		System.out.println(result + " Record(s) 삽입 성공");
	}

	@Override
	public void update(MyEmpDTO userInfo) {
		String sql = "update myemp set pass = ?, addr = ?, grade = ? where id = ?";
		int result = template.update(sql, userInfo.getPass(), userInfo.getAddr(), userInfo.getGrade(), userInfo.getId());
		System.out.println(result + " Record 수정 성공");
	}

	@Override
	public void delete(String id) {
		String sql = "delete from myemp where id = ?";
		int result = template.update(sql, id);
		System.out.println(result + ". " + id + " 삭제 성공");
	}

	public MyEmpDTO login(String id, String pass) {
		MyEmpDTO loginUser = null;
		try {
		loginUser = template.queryForObject("select * from myemp where id = ? and pass = ?", new Object[]{id, pass}, new MyEmpRowMapper()); 
		} catch(EmptyResultDataAccessException e) {
			
		}
		return loginUser;
	}

	@Override
	public List<MyEmpDTO> getMemberList() {
		return template.query("select * from myemp", new MyEmpRowMapper());
	}

	@Override
	public List<MyEmpDTO> findByAddr(String addr) {
		return template.query("select * from myemp where addr like ?", new Object[]{"%" + addr + "%"}, new MyEmpRowMapper());
	}

	@Override
	public MyEmpDTO getDetail(String id) {
		MyEmpDTO user = template.queryForObject("select * from myemp where id = ?", new Object[]{id}, new MyEmpRowMapper());
		return user;
	}

	@Override
	public MyEmpDTO login(MyEmpDTO user) {
		// TODO Auto-generated method stub
		return null;
	}

}
