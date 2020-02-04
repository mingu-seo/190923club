package member;

public class MemberVO {
	
	// 회원정보
	private int num;
	private String id;
	private String password;
	private String name;
	private String email;
	private String birth;
	private int gender;
	private String tel;
	private String profile;
	
	private int page;	// 사용자가 요청한 페이지번호
	private int limit;	// 페이지당 로우 수
	private int startIndex;	// limit 시작 인덱스
	private int maxPage;	// 총 페이지 수
	
	public MemberVO() {
		this.page = 1;		// 사용자가 요청한 페이지 번호가 없으면 페이지 초기값 1
		this.limit = 10;	// 페이지당 로우수가 지정이 안되면 초기값 10 
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
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
}
