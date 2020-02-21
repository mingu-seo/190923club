package calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	
	@Autowired
	private calendar.CalendarDAO calDAO;
	
	public int insert(ScheduleVO vo) {
		return calDAO.insert(vo);
	}
	

	public List<calendar.ScheduleVO> scheduleList(calendar.ScheduleVO vo) {
		return calDAO.scheduleList(vo);
	}
}
