package adminNotice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class AdminNoticeController {
	@Autowired
	private AdminNoticeDAO adminNoticeDao;
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	/* 공지사항 S T A R T  */

	//공지사항 등록 폼
	@RequestMapping("/admin/notice/noticeWrite.do")
	public String adminNoticeWrite() {
		return "admin/notice/noticeWriteForm";
	}
	
	//공지사항 등록
	@RequestMapping("/admin/notice/noticeRegist.do")
	public String adminNoticeInsert(AdminNoticeVO vo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = adminNoticeService.adminNoticeInsert(vo, file,request);
		//if(r < 0)
		return "redirect:/admin/notice/noticeList.do";
	}
		
	//공지사항 리스트 보기
	@RequestMapping("/admin/notice/noticeList.do") 
	public String adminNoticeList(Model model,AdminNoticeVO vo) {
		//목록과 전체개수 가져옴
		int[] listCount = adminNoticeService.count(vo);
		List<AdminNoticeVO> list = adminNoticeService.adminNoticeList(vo);
		model.addAttribute("listCount", listCount[0]);
		model.addAttribute("totalpage", listCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);		
		return "admin/notice/noticeList";
	}
	
	//공지사항 상세보기
	@RequestMapping("/admin/notice/noticeDetail.do")
	public String adminNoticeView(Model model,@RequestParam(name="page",required=false) String page, int num) {
		AdminNoticeVO vo = adminNoticeService.adminNoticeView(num);
		model.addAttribute("list", vo);
		model.addAttribute("nowPage", page);
		return "admin/notice/noticeView";
		
	}
	
	//공지사항 수정 폼
	@RequestMapping("/admin/notice/noticeUpdateForm.do")
	
	public String amdinNoticeUpdateForm(Model model, @RequestParam("num") int num) {
		AdminNoticeVO vo = adminNoticeService.adminNoticeView(num);
		model.addAttribute("vo",vo);
		return "admin/notice/noticeUpdateForm";
	}
	//공지사항 수정하기
	@RequestMapping("/admin/notice/noticeUpdate.do")
	public String amdinNoticeUpdate(AdminNoticeVO vo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		adminNoticeService.amdinNoticeUpdate(vo, file, request);

		return "redirect:/admin/notice/noticeList.do";
	}
	
	//공지사항 삭제하기
	@RequestMapping("/admin/notice/noticeDelete.do")
	public String amdinNoticeDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		adminNoticeService.amdinNoticeDelete(num);
		return "redirect:/admin/notice/noticeList.do";
	}
	
	/* 공지사항 E N D  */
	
}
