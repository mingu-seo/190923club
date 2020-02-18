package calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	
	@Autowired
	private CalendarDAO calDAO;
	

	public int insert(CalendarVO vo) {
		return calDAO.insert(vo);
	}
}
