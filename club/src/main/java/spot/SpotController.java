package spot;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import adminNotice.AdminNoticeService;
import adminNotice.AdminNoticeVO;
import adminQna.AdminQnaService;
import adminQna.AdminQnaVO;
import board.BoardService;
import member.MemberVO;




@Controller
public class SpotController {
	@Autowired
	private SpotDAO spotDao;
	
	@Autowired
	private AdminQnaService adminQnaService;
	
	@Autowired
	private BoardService bService;
			
	@Autowired
	private SpotService spotService;

	@Autowired
	private AdminNoticeService adminNoticeService;
	
	//HOT SPOT 등록 폼
	@RequestMapping("/spot/spotRegist.do")
	public String spotWrite() {
		return "spot/spotRegistForm";
	}
	
	//HOT SPOT 등록
	@RequestMapping("/spot/spotInsert.do")
	public String spotInsert(Model model,SpotVO spotvo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = spotService.spotInsert(spotvo, file,request);
		model.addAttribute("list", spotvo);
		//if(r < 0)
		return "redirect:/board/submain/submain.do?spot_num="+r;
	}	
	

	//HOT SPOT 상세보기(세영 주석처리해놓음)
	//@RequestMapping("/spot/spotView.do")
	//public String spotView(Model model,@RequestParam(name="page",required=false) String page, @RequestParam("num") int num) {
		//SpotVO spotvo = spotService.spotView(num);
		//model.addAttribute("list", spotvo);
		//return "board/submain/submain";
	//}
	
	//HOT SPOT 세팅폼
	@RequestMapping("/spot/spotSetting.do")
	public String clubSetting(Model model,  @RequestParam("spot_num") String spot_num , HttpSession session) {
		MemberVO mv = (MemberVO)session.getAttribute("sess");
		int joinSpotCnt = bService.checkJoinSpot(mv.getNum(), Integer.parseInt(spot_num));
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		return "spot/spotSetting";
	}
	//HOT SPOT 수정 폼
	@RequestMapping("/spot/spotUpdateForm.do")
	public String spotUpdateForm(Model model, @RequestParam("num") int num , HttpSession session) {
		MemberVO mv = (MemberVO)session.getAttribute("sess");
		int joinSpotCnt = bService.checkJoinSpot(mv.getNum(),num);
		SpotVO spotvo = spotService.spotView(num);
		model.addAttribute("vo",spotvo);
		return "spot/spotUpdateForm";
	}
	//HOT SPOT 수정하기
	@RequestMapping("/spot/spotUpdate.do")
	public String spotUpdate(SpotVO spotvo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request, @RequestParam("num") int num, HttpSession session) {
		MemberVO mv = (MemberVO)session.getAttribute("sess");
		int joinSpotCnt = bService.checkJoinSpot(mv.getNum(), num);
		spotService.spotUpdate(spotvo, file, request);
		
		return "redirect:/board/submain/submain.do?spot_num="+ num;
	}
	//HOT SPOT 삭제하기
	@RequestMapping("/spot/spotDelete.do")
	public String spotDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		spotService.spotDelete(num);
		return "redirect:/spot/spotList.do";
	}
	
	@RequestMapping("/spot/nameCheck.do")
	public String nameCheck(Model model, @RequestParam("name") String name) {
		int cnt = spotService.nameCheck(name);
		model.addAttribute("value", cnt);
		return "spot/include/return";
	}
	
	@RequestMapping("/spot/joinProcess.do")
	public String insert(Model model, SpotVO spotvo) {
		int r = spotService.insert(spotvo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "정상적으로 가입되었습니다.";
			url = "/user/spotList.do";
		} else {
			msg = "회원가입 실패";
			url = "/spot/joinForm.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	
	@RequestMapping("/spot/spotNotice.do")
	public String spotNotice(Model model,AdminNoticeVO vo) {
		List<AdminNoticeVO> list = adminNoticeService.adminNoticeList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);		
		return "spot/spotNotice";		
	}

	@RequestMapping("/spot/spotNoticeDetail.do")
	public String spotNoticeDetail(Model model, int num) {
		AdminNoticeVO vo = adminNoticeService.adminNoticeView(num);
		model.addAttribute("notice", vo);
		return "spot/spotNoticeDetail";		
	}

	@RequestMapping("/spot/spotQna.do")
	public String spotQna(Model model,AdminQnaVO vo) {
		List<AdminQnaVO> list = adminQnaService.adminQnaList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);		
		return "spot/spotQna";
	}
	
	@RequestMapping("/spot/spotQnaDetail.do")
	public String adminQnaView(Model model, int num) {
		AdminQnaVO vo = adminQnaService.adminQnaView(num);
		model.addAttribute("Qna", vo);
		return "spot/spotQnaDetail";
		
	}
		
	@RequestMapping("/spot/spotMemberInfo.do")
	public String spotMemberInfo() {
		
		return "spot/spotMemberInfo";
	}
	@RequestMapping("/spot/spotUselaw.do")
	public String spotUselaw() {
		
		return "spot/spotUselaw";
	}
	
}
