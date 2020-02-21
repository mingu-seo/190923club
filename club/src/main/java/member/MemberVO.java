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
	private int state;
	
	// spot 조인
	private int spot_num;
	private int member_num;
	private int joinspot_num;
	private int joinspot_grade;
	
	// 검색
	private String searchword;
	private String stype;
	
	// 페이지
	private int page;	// 사용자가 요청한 페이지번호
	private int limit;	// 페이지당 로우 수
	private int startIndex;	// limit 시작 인덱스
	private int maxPage;	// 총 페이지 수
	
	// 회원이 가입한 spot
	private String file;
	private String spot_name;
	private String leader_name;
	
	
	
	public String getLeader_name() {
		return leader_name;
	}
	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}
	public int getState() {
		return state;
	}   
	public void setState(int state) {
		this.state = state;
	}
	public int getJoinspot_grade() {
		return joinspot_grade;
	}
	public void setJoinspot_grade(int joinspot_grade) {
		this.joinspot_grade = joinspot_grade;
	}
	public int getJoinspot_num() {
		return joinspot_num;
	}
	public void setJoinspot_num(int joinspot_num) {
		this.joinspot_num = joinspot_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public int getSpot_num() {
		return spot_num;
	}
	public void setSpot_num(int spot_num) {
		this.spot_num = spot_num;
	}

	public MemberVO() {
		this.page = 1;		// 사용자가 요청한 페이지 번호가 없으면 페이지 초기값 1
		this.limit = 10;	// 페이지당 로우수가 지정이 안되면 초기값 10 
	}
	
	public String getSearchword() {
		return searchword==null ? "" : searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
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
		int i = (this.page - 1) * this.limit;
		return i;
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
