package product.comment.dto;


public class PrdCommentWordCountDTO{
	private String word;
	private String count;
	
	public PrdCommentWordCountDTO() {}

	public PrdCommentWordCountDTO(String word, String count) {
		super();
		this.word = word;
		this.count = count;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "PrdCommentWordCountDTO [word=" + word + ", count=" + count + "]";
	}



}


