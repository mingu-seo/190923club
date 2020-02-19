package reply;

import java.sql.Timestamp;

public class ReplyVO {

	private int reply_num; //댓글번호
	private int post_id; //게시물번호
	private int g_id; 
	private int g_lev; 
	private int g_seq;
	private String contents; //내용  
	private String writer; //작성자
	private Timestamp regdate;
	private int board_id;
	private String url;
	private int spot_num;
	private int member_id;
	
	
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getSpot_num() {
		return spot_num;
	}
	public void setSpot_num(int spot_num) {
		this.spot_num = spot_num;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public int getG_lev() {
		return g_lev;
	}
	public void setG_lev(int g_lev) {
		this.g_lev = g_lev;
	}
	public int getG_seq() {
		return g_seq;
	}
	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
