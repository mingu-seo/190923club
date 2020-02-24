package notice;

import java.sql.Timestamp;

public class NoticeVO {

	private int board_id;
	private int post_id;
	private Timestamp regdate;
	private String writer; 
	private String title;
	private String contents;
	private int view;
	private String search_word;
	private int like_cnt;
	private int spot_num;
	private int category_id;
	private int member_id;
	private int comment_cnt;
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	//페이지
	private int page; //사용자가 요청한 페이지번호
	private int limit; //페이지당 로우수
	private int startIndex; //limit 시작 인덱스
	private int maxPage; //총페이지수
	
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getSpot_num() {
		return spot_num;
	}
	public void setSpot_num(int spot_num) {
		this.spot_num = spot_num;
	}
	public NoticeVO() {
		this.page = 1;
		this.limit = 15;
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
		//시작인덱스값 mybatis에서 getter 메서드를 호출하기
		int i = (this.page-1) * this.limit;
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
	
	public String getSearch_word() {
		//검색창이 널값일때 빈값을, 아니면 검색어를
		return search_word==null ? "" : search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
}
