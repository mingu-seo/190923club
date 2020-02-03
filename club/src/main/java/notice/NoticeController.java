package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import file.FileVO;
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
	
	@Autowired
	private file.FileService fService;
	
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
		
		//글 등록하고 pk가져와서 파일등록할때 씀
		int post_id = nService.noticeInsert(vo,board_id);
		
		FileVO fv = new FileVO();
		fv.setBoard_id(vo.getBoard_id());
		fv.setPost_id(post_id);
		fService.fileInsert(fv, file, req);
		
		
		return "redirect:/board/notice/noticeList.do?board_id="+board_id;
	}
	//공지사항 상세보기 페이지
	@RequestMapping("/board/notice/noticeWriteView.do") 
	public String noticeWriteView(@RequestParam("post_id")int post_id, Model model, @RequestParam("board_id")int board_id) {
		NoticeVO vo = nService.noticeView(post_id, board_id);
		ReplyVO rv = new ReplyVO();
		rv.setBoard_id(board_id);
		rv.setPost_id(post_id);
		
		List<ReplyVO> rList = rService.replyList(rv);
		
		//파일 선택
		FileVO param_fvo = new FileVO();
		param_fvo.setPost_id(vo.getPost_id());
		param_fvo.setBoard_id(vo.getBoard_id());
		System.out.println(param_fvo);
		FileVO fv = fService.fileSelect(param_fvo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("fv",fv);
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
		return "redirect:/board/notice/noticeList.do?board_id=3";
	}
	
	
}
