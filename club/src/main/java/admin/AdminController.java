package admin;

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
	@RequestMapping("/admin/login.do")
	public String adminLogin() {
		return "admin/login";
	}
	
	@RequestMapping("/admin/process.do")
	public String adminProcess(Model model) {
		//어떠어떠한 처리
		model.addAttribute("msg","정상적으로 회원가입 되었습니다.");
		model.addAttribute("url","/sampleEX/admin/index.do");
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
