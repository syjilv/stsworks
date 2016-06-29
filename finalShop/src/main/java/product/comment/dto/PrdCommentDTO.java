package product.comment.dto;


public class PrdCommentDTO{
	private String seq;
	private String prd_no;
	private String mem_id;
	private String prd_comment;
	private String reg_dtm;
	private String mem_nm;
	
	public PrdCommentDTO() {}

	public PrdCommentDTO(String seq, String prd_no, String mem_id, String prd_comment, String reg_dtm, String mem_nm) {
		super();
		this.seq = seq;
		this.prd_no = prd_no;
		this.mem_id = mem_id;
		this.prd_comment = prd_comment;
		this.reg_dtm = reg_dtm;
		this.mem_nm = mem_nm;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getPrd_no() {
		return prd_no;
	}

	public void setPrd_no(String prd_no) {
		this.prd_no = prd_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getPrd_comment() {
		return prd_comment;
	}

	public void setPrd_comment(String prd_comment) {
		this.prd_comment = prd_comment;
	}

	public String getReg_dtm() {
		return reg_dtm;
	}

	public void setReg_dtm(String reg_dtm) {
		this.reg_dtm = reg_dtm;
	}
	
	public String getMem_nm() {
		return mem_nm;
	}

	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	

	@Override
	public String toString() {
		return "PrdCommentDTO [seq=" + seq + ", prd_no=" + prd_no + ", mem_id=" + mem_id + ", prd_comment="
				+ prd_comment + ", reg_dtm=" + reg_dtm + "]";
	}
	
	
}


