package admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.AdminDAO;
import admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private AdminService adminService;
	
	//관리자 회원가입
	@RequestMapping("/admin/join.do")
	public String join() {
		return "admin/join";
	}
	
	@RequestMapping("/admin/idCheck.do")
	public String idCheck(Model model, @RequestParam("id") String id) {
		int cnt = adminService.idCheck(id);
		model.addAttribute("value", cnt);
		return "admin/include/return";
	}
	
	@RequestMapping("/admin/joinProcess.do")
	public String insert(Model model, AdminVO vo) {
		int r = adminService.insert(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "정상적으로 가입되었습니다.";
			url = "/admin/index.do";
		} else {
			msg = "회원가입 실패";
			url = "/admin/join.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/admin/include/alert";
	}
	
	
	
	@RequestMapping("/admin/index.do")
	public String adminIndex() {
		return "admin/index";
	}
	
	@RequestMapping("/admin/logout.do")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.setAttribute("adminSession", null);
		return "redirect:club/admin/index.do";
	}
	
	
	@RequestMapping("/admin/login.do")
	public String adminProcess(Model model) {
		//어떠어떠한 처리
		model.addAttribute("msg","정상적으로 회원가입 되었습니다.");
		
		//로그인되면
		model.addAttribute("url","/admin/board/index.do");
		return "admin/include/alert";
	}
	
	//메서드명은 겹치지만 않으면 상관없음
	@RequestMapping("/admin/board/index.do")
	public String adminBoardIndex() {
		return "admin/board/index";
	}

	@RequestMapping("/admin/board/view.do")
	public String adminBoardView() {
		return "admin/board/view";
	}
	
	//관리자 기본 설정 
	//hotspot 정버설정
	@RequestMapping("/admin/board/hotspotInfo.do")
	public String hotspotInfo() {
		return "admin/board/hotspotInfo";
	}
	
	//hotspot 꾸미기설정
	@RequestMapping("/admin/board/hotspotSetting.do")
	public String hotspotSetting() {
		return "admin/board/hotspotSetting";
	}

	//Q&A
	@RequestMapping("/admin/board/qna.do")
	public String adminQna() {
		return "admin/board/qna";
	}
	
	//게시글 관리 
	@RequestMapping("/admin/board/post.do")
	public String post() {
		return "admin/board/post";
	}
	// spot 관리
	@RequestMapping("/admin/board/club.do")
	public String club() {
		return "admin/board/club";
	}
	
	
	
	
	
}
