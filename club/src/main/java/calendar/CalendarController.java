package calendar;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberVO;
import spot.SpotService;
import spot.SpotVO;

@Controller
public class CalendarController {

	@Autowired
	private CalendarDAO calendarDAO;
	
	@Autowired
	private SpotService spotService;
	
	@Autowired
	private CalendarService calService;
	
	@Autowired
	private board.BoardService bService;
	
	@Autowired
	private joinSpot.JoinSpotService joinSpotService;
	
	// 달력화면 
	@RequestMapping("/calendar/calendarmain.do")
	public String index(Model model, 
			@RequestParam(name="yearmonth", required=false) String yearmonth,
			@RequestParam("spot_num") String spot_num,
			HttpSession session, HttpServletRequest request) {

		MemberVO mv = (MemberVO)session.getAttribute("sess");
		// submainLeft 리더, 회원 값 넘겨주기
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv.getNum();														// 회원 체크(추가된부분)
		int cnt = joinSpotService.checkJoinSpot(member_num, Integer.parseInt(spot_num));	// 회원 체크(추가된부분)
		model.addAttribute("cnt", cnt);														// 회원 체크(추가된부분)
		uv.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(uv);										// 리더 값뿌리기
		model.addAttribute("lvo", lvo);
		
		int joinSpotCnt = bService.checkJoinSpot(mv.getNum(), Integer.parseInt(spot_num));
		model.addAttribute("joinSpotCnt", joinSpotCnt); 
		
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		
		if(yearmonth==null || "".equals(yearmonth)) {
			yearmonth = y + "-" + ((m<10) ? "0"+m : m); 
		}
		List<CalendarVO> list = calendarDAO.selectCalendar(yearmonth);
		
		ScheduleVO svo = new ScheduleVO();
		svo.setSpot_num(Integer.parseInt(spot_num));
		
		
		for (int i=0; i<list.size(); i++) {
			svo.setDate(list.get(i).getToday());
			list.get(i).setSchedule(calService.scheduleList(svo));
		}
		
		// 다음달
		cal.set(Integer.parseInt(yearmonth.substring(0,4)), Integer.parseInt(yearmonth.substring(5,7))-1, 1);
		cal.add ( cal.MONTH, + 1 );
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		String nextMonth = y + "-" + ((m<10) ? "0"+m : m); 
		
		cal.set(Integer.parseInt(yearmonth.substring(0,4)), Integer.parseInt(yearmonth.substring(5,7))-1, 1);
		cal.add ( cal.MONTH, - 1 );
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		String prevMonth = y + "-" + ((m<10) ? "0"+m : m); 
		
		
		model.addAttribute("yearmonth", yearmonth); 
		model.addAttribute("nextMonth", nextMonth); 
		model.addAttribute("prevMonth", prevMonth); 
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("calendar_list", list);
		model.addAttribute("spot_num", spot_num);
		
		return "calendar/calendarMain";
	}
	
	@RequestMapping("/calendar/popup.do")
	public String popup() {
		return "calendar/popup";
	}
	
	@RequestMapping("/calendar/insert.do")
	public String insert(Model model, ScheduleVO vo) {
		int r = calendarDAO.insert(vo);
		String msg="";
		String url="";
		
		if(r>0) {
			msg = "일정이 등록되었습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("cmd", "popclose");
		}
		return "include/alert";
	}
	
	@RequestMapping("/calendar/popupContents.do")
	public String popupContents(@RequestParam("spot_num") String spot_num) {
		
		return "calendar/popupContents";
	}
}
