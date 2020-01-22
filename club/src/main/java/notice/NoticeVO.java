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
	private String file;
	private String search_word;
	
	
	public String getSearch_word() {
		//검색창이 널값일때 빈값을, 아니면 검색어를
		return search_word==null ? "" : search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
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
