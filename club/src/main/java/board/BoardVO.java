package board;

import java.sql.Timestamp;

public class BoardVO {

	private int id_board; //게시물번호(pk)
	private String name_board; //게시물이름
	private int id_category; //카테고리번호
	private String title; //제목
	private String contents; //내용
	private String image; //이미지
	private int id_post; //
	private int like; //좋아요
	private int view; //상세보기
	private Timestamp regdate; //날짜
	
	public int getId_board() {
		return id_board;
	}
	public void setId_board(int id_board) {
		this.id_board = id_board;
	}
	public String getName_board() {
		return name_board;
	}
	public void setName_board(String name_board) {
		this.name_board = name_board;
	}
	public int getId_category() {
		return id_category;
	}
	public void setId_category(int id_category) {
		this.id_category = id_category;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
