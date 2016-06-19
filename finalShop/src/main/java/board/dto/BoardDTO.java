package board.dto;


public class BoardDTO{
	private String board_no;
	private String mem_id;
	private String title;
	private String text;
	private int count;
	private String del_flg;
	private String reg_dtm;
	private String mod_dtm;
	private String mem_nm;

	public BoardDTO() {}

	public BoardDTO(String board_no, String mem_id, String title, String text, int count, String del_flg,
			String reg_dtm, String mod_dtm, String mem_nm) {
		super();
		this.board_no = board_no;
		this.mem_id = mem_id;
		this.title = title;
		this.text = text;
		this.count = count;
		this.del_flg = del_flg;
		this.reg_dtm = reg_dtm;
		this.mod_dtm = mod_dtm;
		this.mem_nm = mem_nm;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDel_flg() {
		return del_flg;
	}

	public void setDel_flg(String del_flg) {
		this.del_flg = del_flg;
	}

	public String getReg_dtm() {
		return reg_dtm;
	}

	public void setReg_dtm(String reg_dtm) {
		this.reg_dtm = reg_dtm;
	}

	public String getMod_dtm() {
		return mod_dtm;
	}

	public void setMod_dtm(String mod_dtm) {
		this.mod_dtm = mod_dtm;
	}

	public String getMem_nm() {
		return mem_nm;
	}

	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_no=" + board_no + ", mem_id=" + mem_id + ", title=" + title + ", text=" + text
				+ ", count=" + count + ", del_flg=" + del_flg + ", reg_dtm=" + reg_dtm + ", mod_dtm=" + mod_dtm
				+ ", mem_nm=" + mem_nm + "]";
	}
}
