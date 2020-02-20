package calendar;

import java.util.ArrayList;
import java.util.List;

public class CalendarVO {
	
	private String name;//요일
	private String today;//날짜
	private int num;
	
	private List<ScheduleVO> schedule;
	
	public CalendarVO() {
		this.schedule = new ArrayList<ScheduleVO>();
	}
	
	public List<ScheduleVO> getSchedule() {
		return schedule;
	}
	public void setSchedule(List<ScheduleVO> schedule) {
		this.schedule = schedule;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
