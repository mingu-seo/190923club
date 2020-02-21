package joinSpot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardDAO;
import board.BoardService;
import member.MemberService;
import member.MemberVO;
import spot.SpotService;
import spot.SpotVO;

@Controller
public class JoinSpotController {

	@Autowired
	MemberService memberService;	
	
	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private notice.NoticeService nService;
	
	@Autowired
	private reply.ReplyService rService;
	
	@Autowired
	private SpotService spotService;
	
	@Autowired
	private JoinSpotService joinSpotService;
	
	

	// spot 가입폼
	@RequestMapping("/spotJoin/spotJoinForm.do")
	public String spotJoinForm(Model model, @RequestParam("spot_num") String spot_num,HttpSession session, HttpServletRequest request) {
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		MemberVO mv = (MemberVO)session.getAttribute("sess");
		// submainLeft 리더, 회원 값 넘겨주기
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv.getNum();														// 회원 체크(추가된부분)
		uv.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(uv);										// 리더 값뿌리기
		model.addAttribute("lvo", lvo);
		
		int joinSpotCnt = bService.checkJoinSpot(mv.getNum(), Integer.parseInt(spot_num));
		model.addAttribute("joinSpotCnt", joinSpotCnt); 
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		return "member/spotJoinForm";
	}
	
	
	// spot 가입동작
	@RequestMapping("/spotJoin/joinSpot.do")
	public String spotJoin(Model model, HttpSession session, @RequestParam("spot_num") String spot_num) {
		MemberVO vo = (MemberVO)session.getAttribute("sess");
		JoinSpotVO jv = new JoinSpotVO();
		jv.setMember_num(vo.getNum());
		jv.setSpot_num(Integer.parseInt(spot_num));
		jv.setGrade(2);
		int r = joinSpotService.joinSpot(jv);
		return "redirect:/spotJoin/spotJoinEnd.do?spot_num="+spot_num;
	}
	
	
	// spot 가입후 페이지
	@RequestMapping("/spotJoin/spotJoinEnd.do")
	public String spotJoinEnd(Model model, @RequestParam("spot_num") String spot_num,HttpSession session, HttpServletRequest request) {
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		MemberVO mv = (MemberVO)session.getAttribute("sess");
		// submainLeft 리더, 회원 값 넘겨주기
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv.getNum();														// 회원 체크(추가된부분)
		int cnt = joinSpotService.checkJoinSpot(member_num, Integer.parseInt(spot_num));	// 회원 체크(추가된부분)
		model.addAttribute("cnt", cnt);														// 회원 체크(추가된부분)
		uv.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(uv);										// 리더 값뿌리기
		model.addAttribute("lvo", lvo);
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		return "member/spotJoinEnd";
	}
	
	
	// spot 회원 리스트
	@RequestMapping("/member/memberList.do")
	public String memberList(MemberVO vo, Model model, @RequestParam("spot_num") String spot_num, HttpServletRequest request) {
		int[] listcount = joinSpotService.pageCount(vo);	// 전체 갯수
		List<MemberVO> list = joinSpotService.spotMemberList(vo);
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv==null ? 0 : uv.getNum();														// 회원 체크(추가된부분)
		int joinSpotCnt = joinSpotService.checkJoinSpot(member_num, Integer.parseInt(spot_num));	// 회원 체크(추가된부분)
		MemberVO searchVO = new MemberVO();
		searchVO.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(searchVO);										// 리더 값뿌리기
//		int memberCount = joinSpotService.count(vo);											 스팟 회원수
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("memberList", list);
		model.addAttribute("vo", vo);
		model.addAttribute("joinSpotCnt", joinSpotCnt);														// 회원 체크(추가된부분)
		model.addAttribute("lvo", lvo);														// 리더 값뿌리기
//		model.addAttribute("memberCount", memberCount);										 스팟 회원수
		return "member/memberList";
	}
	
	
	// spot 회원 휴면
	@RequestMapping("/member/spotMemberSleep.do")
	public String spotMemberSleep(
			JoinSpotVO jv,
			Model model,
			@RequestParam("spot_num") String spot_num, 
			HttpServletRequest req) {
		String[] joinspot_nums = req.getParameterValues("joinspot_num");
		
		for (int i=0; i<joinspot_nums.length; i++) {
			jv.setNum(Integer.parseInt(joinspot_nums[i]));
			joinSpotService.spotMemberSleep(jv);
		}
		model.addAttribute("jv", jv);
		return "redirect:/member/memberList.do?spot_num="+spot_num;
	}

	// spot 회원 활성화
	@RequestMapping("/member/spotMemberWake.do")
	public String spotMemberWake(
			JoinSpotVO jv,  
			Model model,
			@RequestParam("spot_num") String spot_num, 
			HttpServletRequest req) {
		String[] joinspot_nums = req.getParameterValues("joinspot_num");
		
		for (int i=0; i<joinspot_nums.length; i++) {
			jv.setNum(Integer.parseInt(joinspot_nums[i]));
			joinSpotService.spotMemberWake(jv);
		}
		model.addAttribute("jv", jv);
		return "redirect:/member/memberList.do?spot_num="+spot_num;
	}

	// spot 회원 강제탈퇴
	@RequestMapping("/member/spotMemberDelete.do")
	public String spotMemberDelete(
			JoinSpotVO jv,
			Model model,
			@RequestParam("spot_num") String spot_num, 
			HttpServletRequest req) {
		String[] joinspot_nums = req.getParameterValues("joinspot_num");
		
		for (int i=0; i<joinspot_nums.length; i++) {
			jv.setNum(Integer.parseInt(joinspot_nums[i]));
			joinSpotService.spotMemberDelete(jv);
		}
		model.addAttribute("jv", jv);
		return "redirect:/member/memberList.do?spot_num="+spot_num;
	}
	
	
}
