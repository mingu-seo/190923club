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
	private CalendarService calService;
	
	@Autowired
	private SpotService spotService;
	
	// 달력화면
	@RequestMapping("/calendar/calendarmain.do")
	public String index(Model model, CalendarVO vo,
			@RequestParam(name="yearmonth", required = false) String yearmonth, 
			@RequestParam("spot_num") String spot_num) {
		if (yearmonth == null || "".equals(yearmonth)) {
			Calendar cal = Calendar.getInstance();
			int y =cal.get(Calendar.YEAR);
			int m =cal.get(Calendar.MONTH)+1;
			yearmonth = y + "-" + ((m<10)?"0"+m:m);
		}
		
		List<TestVO> list = calendarDAO.selectCalendar(yearmonth);
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("calendar_list", list);
		return "calendar/calendarMain";
	}
	
	@RequestMapping("/calendar/popup.do")
	public String popup() {
		return "calendar/popup";
	}
	
	@RequestMapping("/calendar/insert.do") 
	public String insert(Model model, CalendarVO vo, @RequestParam("spot_num") String spot_num) {
		
		calService.insert(vo);
		model.addAttribute("cmd", "popclose");
		model.addAttribute("msg", "일정이 등록되었습니다");
		return "include/alert"; 
	}
}
