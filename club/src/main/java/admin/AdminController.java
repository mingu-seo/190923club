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
	public String insert(Model model, AdminVO adminvo) {
		int r = adminService.insert(adminvo);
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
		session.invalidate();
		return "redirect:/admin/index.do";
	}
	
	
	@RequestMapping("/admin/adminLogin.do")
	public String adminLogin(Model model ,AdminVO adminvo, HttpSession session) {
		AdminVO admin = adminService.adminLogin(adminvo);
		String msg = "";
		String url = "";
		
		if (admin == null) {
			msg = "아이디와 비밀번호를 확인해주세요.";
			url = "/admin/index.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "admin/include/alert";
		} else {
			session.setAttribute("adminsess", admin);
			model.addAttribute("msg", msg);
			model.addAttribute("admin",adminvo);
			model.addAttribute("url", url);
			return "redirect:/admin/board/hotspotInfo.do";
		}		
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

	
	
	
}
