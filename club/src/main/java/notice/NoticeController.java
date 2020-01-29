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
	public String noticeList(NoticeVO vo, Model model, @RequestParam("board_id")int board_id) {
		List<NoticeVO> list = nService.noticeList(vo, board_id);
		int[] listcount = nService.noticeCount(vo); //전체 갯수와 총페이지수
		
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
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
	public String noticeInsert(NoticeVO vo, HttpServletRequest req, 
			@RequestParam("file_tmp") MultipartFile file,
			@RequestParam("board_id")int board_id) {
		nService.noticeInsert(vo, file, req, board_id);
		return "redirect:/board/notice/noticeList.do?board_id="+board_id;
	}
	//공지사항 상세보기 페이지
	@RequestMapping("/board/notice/noticeWriteView.do") 
	public String noticeWriteView(@RequestParam("post_id")int post_id, Model model, @RequestParam("board_id")int board_id) {
		NoticeVO vo = nService.noticeView(post_id, board_id);
		List<ReplyVO> rList = rService.replyList(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("rList", rList);
		return "board/notice/noticeWriteView";
	}
	//공지사항 삭제하기
	@RequestMapping("/board/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam("post_id")int post_id, NoticeVO vo) {
		nService.noticeDelete(post_id);
		return "redirect:/board/notice/noticeList.do?board_id=3";
	}
	//공지사항 수정하기 페이지
	@RequestMapping("/board/notice/noticeUpdateForm.do")
	public String noticeUpdateForm(@RequestParam("post_id")int post_id, Model model, @RequestParam("board_id")int board_id) {
		NoticeVO vo = nService.noticeView(post_id, board_id);
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
