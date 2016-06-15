package emp.dto;


public class MyEmpDTO{
	private String id;
	private String pass;
	private String addr;
	private int sal;
	private String grade;
	private String deptno;
	private String name;
	public MyEmpDTO(){
		System.out.println("MyEmpDTO 기본생성자");
	}
	public MyEmpDTO(String id, String pass, String addr, String grade,
			String name) {
		super();
		this.id = id;
		this.pass = pass;
		this.addr = addr;
		this.grade = grade;
		this.name = name;
		this.sal = 1000;
		this.deptno="002";
	}
	public MyEmpDTO(String id, String pass, String addr, int sal,
			String grade, String deptno, String name) {
		super();
		this.id = id;
		this.pass = pass;
		this.addr = addr;
		this.sal = sal;
		this.grade = grade;
		this.deptno = deptno;
		this.name = name;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getName() {
//		System.out.println("getName");
		return name;
	}
	public void setName(String name) {
//		System.out.println("setName");
		this.name = name;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pass=" + pass + ", addr=" + addr
				+ ", sal=" + sal + ", grade=" + grade + ", deptno=" + deptno
				+ ", name=" + name + "]";
	}
	
}
