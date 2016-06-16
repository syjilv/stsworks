package aop01;

import java.util.ArrayList;

public class UserDAO implements DAO {
	
	@Override
	public ArrayList<UserDTO> getUserList(UserDTO dto) {
		System.out.println("######### getUserList 호출 #########");
		return null;
	}

	@Override
	public UserDTO getUser() {
		System.out.println("########### getUser 호출 ###########");
		return null;
	}

	@Override
	public void addUser(UserDTO dto) {
		System.out.println("########### addUser 호출 ###########");
	}

	@Override
	public void delUser(UserDTO dto) {
		System.out.println("########### delUser 호출 ###########");
	}

	@Override
	public ArrayList<UserDTO> selectAll() {
		System.out.println("########## selectAll 호출 ##########");
		return null;
	}
	
}
