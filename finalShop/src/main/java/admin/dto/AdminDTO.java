package admin.dto;

public class AdminDTO {
	private String year;
	private String month;
	private String ip;
	private String uri;
	private String count;
	
	public AdminDTO() {}

	public AdminDTO(String year, String month, String ip, String uri, String count) {
		super();
		this.year = year;
		this.month = month;
		this.ip = ip;
		this.uri = uri;
		this.count = count;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "AdminDTO [year=" + year + ", month=" + month + ", ip=" + ip + ", uri=" + uri + ", count=" + count + "]";
	}
	
	
}
