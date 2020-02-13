package joinSpot;

import java.sql.Timestamp;

public class JoinSpotVO {
	   
	private int num;
	private int member_num;
	private int spot_num;
	private int grade;
	private Timestamp date;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
}
