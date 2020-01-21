package adminQna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String adminQnaView(Model model,@RequestParam(name="page",required=false) String page, int qna_num) {
		AdminQnaVO vo = adminQnaService.adminQnaView(qna_num);
		model.addAttribute("list", vo);
		model.addAttribute("nowPage", page);
		return "admin/qna/qnaView";
		
	}
	
	//Q & A 수정 폼
	@RequestMapping("/admin/qna/qnaUpdateForm.do")
	
	public String amdinqnaUpdateForm(Model model, @RequestParam("qna_num") int qna_num) {
		AdminQnaVO vo = adminQnaService.adminQnaView(qna_num);
		model.addAttribute("vo",vo);
		return "admin/qna/qnaUpdateForm";
	}
	//Q & A 수정하기
	@RequestMapping("/admin/qna/qnaUpdate.do")
	public String amdinqnaUpdate(AdminQnaVO vo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		adminQnaService.amdinQnaUpdate(vo, file, request);

		return "redirect:/admin/qna/qnaList.do";
	}
	
	//Q & A 삭제하기
	@RequestMapping("/admin/qna/qnaDelete.do")
	public String amdinqnaDelete(HttpServletRequest request) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		adminQnaService.amdinQnaDelete(qna_num);
		return "redirect:/admin/qna/qnaList.do";
	}
	
	
	
	
	/* Q & A E N D  */
	
}
