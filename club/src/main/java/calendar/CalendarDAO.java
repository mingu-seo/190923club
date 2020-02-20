package calendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.TestVO;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TestVO> selectCalendar(String yearmonth) {
		return sqlSession.selectList("calendar.select", yearmonth);
	}
	
	public int insert(CalendarVO vo) { 
		return sqlSession.insert("calendar.insert", vo);
	}
	
	public List<CalendarVO> scheduelList(CalendarVO vo) {
		return sqlSession.selectList("calendar.", vo);
	}
}
