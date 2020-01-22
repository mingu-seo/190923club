package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import reply.ReplyService;
import reply.ReplyVO;

@Controller
public class NoticeController {

	@Autowired
	NoticeDAO noticeDao;
	
	@Autowired
	NoticeService nService;
	
	@Autowired
	ReplyService rService;
	
	//공지사항 목록 페이지
	@RequestMapping("/board/notice/noticeList.do") 
	public String noticeList(NoticeVO vo, Model model) {
		List<NoticeVO> list = nService.noticeList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		return "board/notice/noticeList";
	}
	//공지사항 작성페이지
	@RequestMapping("/board/notice/noticeWrite.do")
	public String noticeWrite() {
		return "board/notice/noticeWrite";
	}
	
	//공지사항 작성
	@RequestMapping("/board/notice/noticeInsert.do") 
	public String noticeInsert(NoticeVO vo, HttpServletRequest req, @RequestParam("file_tmp") MultipartFile file) {
		nService.noticeInsert(vo, file, req);
		return "redirect:/board/notice/noticeList.do";
	}
	//공지사항 상세보기 페이지
	@RequestMapping("/board/notice/noticeWriteView.do") 
	public String noticeWriteView(@RequestParam("post_id")int post_id, Model model) {
		NoticeVO vo = nService.noticeView(post_id);
		List<ReplyVO> rList = rService.replyList(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("rList", rList);
		return "board/notice/noticeWriteView";
	}
	//공지사항 삭제하기
	@RequestMapping("/board/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam("post_id")int post_id) {
		nService.noticeDelete(post_id);
		return "redirect:/board/notice/noticeList.do";
	}
	//공지사항 수정하기 페이지
	@RequestMapping("/board/notice/noticeUpdateForm.do")
	public String noticeUpdateForm(@RequestParam("post_id")int post_id, Model model) {
		NoticeVO vo = nService.noticeView(post_id);
		model.addAttribute("vo", vo);
		return "board/notice/noticeUpdateForm";
	}
	//공지사항 수정
	@RequestMapping("/board/notice/noticeUpdate.do")
	public String noticeUpdate(NoticeVO vo, HttpServletRequest req, @RequestParam("file_tmp") MultipartFile file) {
		nService.noticeUpdate(vo, file, req);
		return "redirect:/board/notice/noticeList.do";
	}
}
