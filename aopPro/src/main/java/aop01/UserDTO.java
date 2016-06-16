package aop01;

public class UserDTO {

	private String id;
	private String pass;
	private String name;
	private String role;
	
	public UserDTO(){}
	
	public UserDTO(String id, String pass, String name, String role) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.role = role;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", role=" + role + "]";
	}
	
	
	
	
}
