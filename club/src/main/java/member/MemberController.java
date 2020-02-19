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

import adminInfo.AdminInfoService;
import adminInfo.AdminInfoVO;
import board.BoardDAO;
import board.BoardService;
import joinSpot.JoinSpotVO;
import spot.SpotService;
import spot.SpotVO;
import spotCategory.SpotCategoryService;
import spotCategory.SpotCategoryVO;


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
	
	@Autowired
	private SpotCategoryService spotCategoryService;
	
	@Autowired
	private AdminInfoService adminInfoService;
	
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
	public String loginForm(Model model, SpotCategoryVO vo,SpotVO spotvo ,AdminInfoVO infovo) {
		List<SpotCategoryVO> list = spotCategoryService.spotCategoryList(vo);
		List<SpotVO> spotArticle = spotService.spotList(spotvo);
		List<AdminInfoVO> infoArticle = adminInfoService.adminInfoList(infovo);
		model.addAttribute("info_article",infoArticle);
		model.addAttribute("infovo",infovo);
		model.addAttribute("spot",spotArticle);
		model.addAttribute("spotvo",spotvo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
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
	public String userHome(Model model, SpotCategoryVO vo,SpotVO spotvo ,AdminInfoVO infovo) {
		List<SpotCategoryVO> list = spotCategoryService.spotCategoryList(vo);
		List<SpotVO> spotArticle = spotService.spotList(spotvo);
		List<AdminInfoVO> infoArticle = adminInfoService.adminInfoList(infovo);
		model.addAttribute("info_article",infoArticle);
		model.addAttribute("infovo",infovo);
		model.addAttribute("spot",spotArticle);
		model.addAttribute("spotvo",spotvo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
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
	
	// 마이페이지 수정
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
	
	
	// admin 페이지 회원 리스트
	@RequestMapping("/admin/member/adminMemberList.do")
	public String memberList(MemberVO vo, Model model) {
		int[] listcount = memberService.pageCount();	// 전체 갯수
		List<MemberVO> list = memberService.MemberList(vo);
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("memberList", list);
		model.addAttribute("vo", vo);
		return "member/adminMemberList";
	}
	
	
	// admin 페이지 회원 휴면
		@RequestMapping("/admin/member/memberSleep.do")
		public String memberSleep(
				MemberVO vo,
				Model model,
				HttpServletRequest req) {
			String[] member_nums = req.getParameterValues("num");
			
			for (int i=0; i<member_nums.length; i++) {
				vo.setNum(Integer.parseInt(member_nums[i]));
				memberService.memberSleep(vo);
			}
			model.addAttribute("vo", vo);
			return "redirect:/admin/member/adminMemberList.do";  
		}

		
	// admin 페이지 회원 활성화
	@RequestMapping("/admin/member/memberWake.do")
	public String memberWake(
			MemberVO vo,
			Model model,
			HttpServletRequest req) {
		String[] member_nums = req.getParameterValues("num");
		
		for (int i=0; i<member_nums.length; i++) {
			vo.setNum(Integer.parseInt(member_nums[i]));
			memberService.memberWake(vo);
		}
		model.addAttribute("vo", vo);
		return "redirect:/admin/member/adminMemberList.do";  
	}

	
	// admin 페이지 회원 삭제
	@RequestMapping("/admin/member/memberDelete.do")
	public String memberDelete(
			MemberVO vo,
			Model model,
			HttpServletRequest req) {
		String[] member_nums = req.getParameterValues("num");
		
		for (int i=0; i<member_nums.length; i++) {
			vo.setNum(Integer.parseInt(member_nums[i]));
			memberService.memberDelete(vo);
		}
		model.addAttribute("vo", vo); 
		return "redirect:/admin/member/adminMemberList.do";  
	}

	
	// 동아리 수정(관리자)
	@RequestMapping("/member/clubSetting.do")
	public String clubSetting() {
		return "member/clubSetting";
	}
}
