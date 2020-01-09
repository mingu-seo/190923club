package admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.AdminDAO;
import admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private AdminService Service;
	
	@RequestMapping("/admin/index.do")
	public String adminIndex() {
		return "admin/index";
	}
	
	@RequestMapping("/admin/logout.do")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.setAttribute("adminSession", null);
		return "redirect:/admin/index.do";
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
	
	@RequestMapping("/admin/board/write.do")
	public String adminBoardWrite() {
		return "admin/board/write";
	}
}
