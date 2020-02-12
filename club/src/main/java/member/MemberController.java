package member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.BoardDAO;
import board.BoardService;
import spot.SpotService;
import spot.SpotVO;


@Controller
public class MemberController {
	
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
	
	// 회원가입
	@RequestMapping("/member/joinForm1.do")
	public String joinForm1() {
		return "member/joinForm1";
	}
	
	@RequestMapping("/member/joinForm2.do")
	public String joinForm2() {
		return "member/joinForm2";
	}
	
	@RequestMapping("/member/join.do")
	public String joinProcess(Model model, MemberVO vo) {
		int r = memberService.memberInsert(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "정상적으로 가입되었습니다.";
			url = "/member/joinForm3.do";
		} else {
			msg = "회원가입 실패";
			url = "/member/joinForm2.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "member/include/alert";
	}
	
	@RequestMapping("/member/idCheck.do")	// 회원가입 체크
	public String idCheck(Model model, @RequestParam("id") String id) {
		int cnt = memberService.idCheck(id);
		model.addAttribute("value", cnt);
		return "member/include/return";
	}
	
	@RequestMapping("/member/joinForm3.do")
	public String joinForm3() {
		return "member/joinForm3";
	}

	
	// 로그인
	@RequestMapping("/member/loginFormBefore.do")
	public String loginForm() {
		return "member/home_loginFormBefore";
	}

	@RequestMapping("/member/userLogin.do")
	public String userLogin(Model model, MemberVO vo, HttpSession session) {
		MemberVO mv = memberService.userLogin(vo);
		String msg = "";
		String url = "";
		if (mv == null) {
			msg = "아이디와 비밀번호를 확인해주세요.";
			url = "/member/loginFormBefore.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "member/include/alert";
		} else {
			session.setAttribute("sess", mv);
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "redirect:/member/loginFormAfter_user.do";
		}
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		return "member/include/alert";
	}
	
	@RequestMapping("/member/loginFormAfter_user.do")
	public String userHome() {
		return "member/home_loginFormAfter_user";
	}
	
	// 로그아웃
	@RequestMapping("/member/userLogout.do")
	public String userLogout(HttpSession session){
		session.invalidate();
		return "redirect:/member/loginFormBefore.do";
	}
	
	// 마이페이지
	@RequestMapping("/member/mypageView.do")
	public String mypageView(HttpSession session, Model model) {
		MemberVO vo = (MemberVO)session.getAttribute("sess");
		MemberVO mv = memberService.mypageView(vo.getNum());
		model.addAttribute("vo", mv);
		return "member/mypage";
	}	
	
	@RequestMapping("/member/mypageUpdate.do")
	public String mypageUpdate(
			HttpSession session, Model model, 
			MemberVO vo, 
			@RequestParam("image_tmp") MultipartFile file, 
			HttpServletRequest req) {
		int r = memberService.mypageUpdate(vo, file, req);
		MemberVO mv = memberService.mypageView(vo.getNum());
		session.setAttribute("sess", mv);
		return "redirect:/member/mypageView.do";
	}
	
	
	// 회원 리스트
//	@RequestMapping("/member/memberList.do")
//	public String memberList(MemberVO vo, Model model, @RequestParam("spot_num") String spot_num) {
//		int[] listcount = memberService.pageCount(vo);	// 전체 갯수
//		List<MemberVO> list = memberService.MemberList(vo);
//		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
//		model.addAttribute("spot_num", spot_num);
//		model.addAttribute("spot_vo", spotvo);
//		model.addAttribute("listcount", listcount[0]);
//		model.addAttribute("totalpage", listcount[1]);
//		model.addAttribute("memberList", list);
//		model.addAttribute("vo", vo);
//		return "member/memberList";
//	}

	
	// 동아리 수정(관리자)
	@RequestMapping("/member/clubSetting.do")
	public String clubSetting() {
		return "member/clubSetting";
	}
}
