package calendar;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spot.SpotService;
import spot.SpotVO;
import test.TestVO;

@Controller
public class CalendarController {

	@Autowired
	private CalendarDAO calendarDAO;
	
	@Autowired
	private SpotService spotService;
	
	// 달력화면
	@RequestMapping("/calendar/calendarmain.do")
	public String index(Model model, @RequestParam("yearmonth") String yearmonth, @RequestParam("spot_num") String spot_num) {
		List<TestVO> list = calendarDAO.selectCalendar(yearmonth);
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		Calendar cal = Calendar.getInstance();
		int y = cal.YEAR;
		int m = cal.MONTH+1;
		if(yearmonth==null || "".equals(yearmonth)) {
			yearmonth = y + "-" + ((m<10) ? "0"+m : m); 
		}
		
		
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("calendar_list", list);
		model.addAttribute("spot_num", spot_num);
		return "calendar/calendarMain";
	}
	
	@RequestMapping("/calendar/popup.do")
	public String popup() {
		return "calendar/popup";
	}
}
