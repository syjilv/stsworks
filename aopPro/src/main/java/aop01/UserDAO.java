package aop01;

import java.util.ArrayList;

public class UserDAO implements DAO {
	
	@Override
	public ArrayList<UserDTO> getUserList(UserDTO dto) {
		System.out.println("######### getUserList ȣ�� #########");
		return null;
	}

	@Override
	public UserDTO getUser() {
		System.out.println("########### getUser ȣ�� ###########");
		return null;
	}

	@Override
	public void addUser(UserDTO dto) {
		System.out.println("########### addUser ȣ�� ###########");
	}

	@Override
	public void delUser(UserDTO dto) {
		System.out.println("########### delUser ȣ�� ###########");
	}

	@Override
	public ArrayList<UserDTO> selectAll() {
		System.out.println("########## selectAll ȣ�� ##########");
		return null;
	}
	
}
