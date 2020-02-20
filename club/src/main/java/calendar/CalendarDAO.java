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
	
	public int insert(CalendarVO vo) { 
		return sqlSession.insert("calendar.insert", vo);
	}
	
	public List<calendar.ScheduleVO> scheduelList(calendar.ScheduleVO vo) {
		return sqlSession.selectList("calendar.scheduelList", vo);
	}
}
