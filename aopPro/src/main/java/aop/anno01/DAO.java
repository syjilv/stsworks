package aop.anno01;

import java.util.ArrayList;

public interface DAO {
	public ArrayList<UserDTO> getUserList(UserDTO dto);
	public UserDTO getUser();
	public void addUser(UserDTO dto);
	public void delUser(UserDTO dto);
	public ArrayList<UserDTO> selectAll();
}
