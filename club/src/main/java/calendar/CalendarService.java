package calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	
	@Autowired
	private calendar.CalendarDAO calDAO;
	
	public int insert(CalendarVO vo) {
		return calDAO.insert(vo);
	}
	

	public List<CalendarVO> scheduelList(CalendarVO vo) {
		return calDAO.scheduelList(vo);
	}
}
