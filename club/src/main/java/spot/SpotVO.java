package spot;

import java.sql.Timestamp;

public class SpotVO {

	private int num;				// 회원번호
	private int category_num;		//카테고리 번호
	private String name;			//SPOT 이름
	private String file;		//SPOT 프로필
	private String content;			//내용
	private String tel;				//전화번호
	private String email;			//이메일  
	private Timestamp regdate;		// 등록일
	private Timestamp modifydate;	// 수정일
	private String question;
	
	
	
	private String keyword;
	private String searchOption;
	
	//추가생성 필드
	private int page;
	private int limit;
	private int startIndex;
	
	public SpotVO() {
		this.page = 1;
		this.limit = 10;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String File) {
		this.file = File;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getModifydate() {
		return modifydate;
	}
	public void setModifydate(Timestamp modifydate) {
		this.modifydate = modifydate;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartIndex() {
		int p = (this.page-1)*this.limit;
		return p;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}


	
}
