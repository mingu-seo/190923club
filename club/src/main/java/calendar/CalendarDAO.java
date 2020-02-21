package calendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CalendarVO> selectCalendar(String yearmonth) {
		return sqlSession.selectList("calendar.select", yearmonth);
	}
	
	public int insert(ScheduleVO vo) { 
		return sqlSession.insert("calendar.insert", vo);
	}
	
	public List<calendar.ScheduleVO> scheduleList(calendar.ScheduleVO vo) {
		return sqlSession.selectList("calendar.scheduleList", vo);
	}
	
	public ScheduleVO popContents(ScheduleVO vo) {
		return sqlSession.selectOne("calendar.popContents", vo);
	}
	
	public int delete(ScheduleVO vo) {
		return sqlSession.delete("calendar.delete", vo);
	}
}
