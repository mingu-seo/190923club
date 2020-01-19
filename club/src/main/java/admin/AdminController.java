package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import admin.AdminDAO;
import admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private AdminService adminService;
	
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
	/* 공지사항 S T A R T  */
	//공지사항
	//공지사항 등록 폼
	@RequestMapping("/admin/notice/noticeWrite.do")
	public String adminBoardWrite() {
		return "admin/notice/noticeWriteForm";
	}
	
	//공지사항 등록
	@RequestMapping("/admin/notice/noticeRegist.do")
	public String adminNoticeInsert(AdminVO vo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = adminService.adminNoticeInsert(vo, file,request);
		//if(r < 0)
		return "redirect:/admin/notice/noticeList.do";
	}
		
	//공지사항 리스트 보기
	@RequestMapping("/admin/notice/noticeList.do")
	public String adminNoticeList(Model model ,AdminVO vo) {
		
		//목록과 전체개수 가져옴
		int[] listCount = adminService.count(vo);
		List<AdminVO> list = adminService.adminNoticeList(vo);
		
		model.addAttribute("listCount", listCount[0]);
		model.addAttribute("totalpage", listCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);		
		
		return "admin/notice/noticeList";
	}
	
	//공지사항 상세보기
	@RequestMapping("/admin/notice/noticeDetail.do")
	public String adminNoticeView(Model model,@RequestParam(name="page",required=false) String page, int notice_num) {
		AdminVO vo = adminService.adminNoticeView(notice_num);
		model.addAttribute("list", vo);
		model.addAttribute("nowPage", page);
		return "admin/notice/noticeView";
		
	}
	
	//공지사항 수정 폼
	@RequestMapping("/admin/notice/noticeUpdateForm.do")
	
	public String amdinNoticeUpdateForm(Model model, @RequestParam("notice_num") int notice_num) {
		AdminVO vo = adminService.adminNoticeView(notice_num);
		model.addAttribute("vo",vo);
		return "admin/notice/noticeUpdateForm";
	}
	//공지사항 수정하기
	@RequestMapping("/admin/notice/noticeUpdate.do")
	public String amdinNoticeUpdate(AdminVO vo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		adminService.amdinNoticeUpdate(vo, file, request);

		return "redirect:/admin/notice/noticeList.do";
	}
	
	//공지사항 삭제하기
	@RequestMapping("/admin/notice/noticeDelete.do")
	public String amdinNoticeDelete(HttpServletRequest request) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		adminService.amdinNoticeDelete(notice_num);
		return "redirect:/admin/notice/noticeList.do";
	}
	
	/* 공지사항 E N D  */

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
