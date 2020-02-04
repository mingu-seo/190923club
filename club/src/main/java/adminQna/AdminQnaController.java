package adminQna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class AdminQnaController {
	@Autowired
	private AdminQnaDAO adminQnaDao;
	
	@Autowired
	private AdminQnaService adminQnaService;
	
	/* Q & A S T A R T  */

	//Q & A 등록 폼
	@RequestMapping("/admin/qna/qnaWrite.do")
	public String adminQnaWrite() {
		return "admin/qna/qnaWriteForm";
	}
	
	//Q & A 등록
	@RequestMapping("/admin/qna/qnaRegist.do")
	public String adminQnaInsert(AdminQnaVO vo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = adminQnaService.adminQnaInsert(vo, file,request);
		//if(r < 0)
		return "redirect:/admin/qna/qnaList.do";
	}
		
	//Q & A 리스트 보기
	@RequestMapping("/admin/qna/qnaList.do") 
	public String adminQnaList(Model model,AdminQnaVO vo) {
		//목록과 전체개수 가져옴
		int[] listCount = adminQnaService.count(vo);
		List<AdminQnaVO> list = adminQnaService.adminQnaList(vo);
		model.addAttribute("listCount", listCount[0]);
		model.addAttribute("totalpage", listCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);		
		return "admin/qna/qnaList";
	}
	
	//Q & A 상세보기
	@RequestMapping("/admin/qna/qnaDetail.do")
	public String adminQnaView(Model model,@RequestParam(name="page",required=false) String page, int num) {
		AdminQnaVO vo = adminQnaService.adminQnaView(num);
		model.addAttribute("list", vo);
		model.addAttribute("nowPage", page);
		return "admin/qna/qnaView";
		
	}
	
	//Q & A 수정 폼
	@RequestMapping("/admin/qna/qnaUpdateForm.do")
	
	public String amdinQnaUpdateForm(Model model, @RequestParam("num") int num) {
		AdminQnaVO vo = adminQnaService.adminQnaView(num);
		model.addAttribute("vo",vo);
		return "admin/qna/qnaUpdateForm";
	}
	//Q & A 수정하기
	@RequestMapping("/admin/qna/qnaUpdate.do")
	public String amdinQnaUpdate(AdminQnaVO vo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		adminQnaService.amdinQnaUpdate(vo, file, request);

		return "redirect:/admin/qna/qnaList.do";
	}
	
	//Q & A 삭제하기
	@RequestMapping("/admin/qna/qnaDelete.do")
	public String amdinQnaDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		adminQnaService.amdinQnaDelete(num);
		return "redirect:/admin/qna/qnaList.do";
	}
	
	@RequestMapping("/admin/qna/qnaGroupDelete.do")
	public String amdinQnaGroupDelete(HttpServletRequest request) {
		String[] nums = request.getParameterValues("num");
		for (int i=0; i<nums.length; i++) {
			int num = Integer.parseInt(nums[i]);
			adminQnaService.amdinQnaDelete(num);
		}
		return "redirect:/admin/qna/qnaList.do";
	}
	//Q & A 답변
	@RequestMapping("/admin/qna/qnaReplyForm.do")
	public String adminQnaReplyForm(Model model, AdminQnaVO vo) {
		AdminQnaVO data = adminQnaService.adminQnaView(vo.getNum());
		model.addAttribute("data", data);
		model.addAttribute("vo", vo);
		return "admin/qna/qnaReplyForm";
	}
	
	@RequestMapping("/admin/qna/replyProcess.do")
	public String replyProcess(Model model, AdminQnaVO vo) {
		
		int r = adminQnaService.replyProcess(vo);
		String msg = "";
		String url = "";
		if (r>0) {
			msg  = "답변이 저장되었습니다.";
			url = "qnaList.do?page="+vo.getPage();
		} else {
			msg = "답변 저장 실패";
			url = "qnaReplyForm.do?board_num="+vo.getNum()+"&page="+vo.getPage();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "admin/include/alert";
	}
	
	
	/* Q & A E N D  */
	
}
