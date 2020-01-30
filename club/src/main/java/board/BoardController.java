package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import notice.NoticeVO;
import reply.ReplyVO;



@Controller
public class BoardController {
	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private notice.NoticeService nService;
	
	@Autowired
	private reply.ReplyService rService;
	
	//서브메인 페이지
	@RequestMapping("/board/submain/submain.do")
	public String subMain() {
		return "board/submain/submain";
	}
	//게시판 관리 페이지
	@RequestMapping("/board/submain/admincategory.do")
	public String adminCategory() {
		return "board/submain/adminCategory";
	}
	//게시판 메인 페이지
	@RequestMapping("/board/submain/boardmain.do") 
	public String boardMain(NoticeVO vo, Model model) {
		List<NoticeVO> list = nService.mainNoticeList(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "board/submain/boardmain";
	}
	
	//자유게시판 목록페이지
	@RequestMapping("/board/writing/boardList.do") 
	public String boardList(Model model, 
			HttpServletRequest req, 
			BoardVO vo) {
			List<BoardVO> list = boardDao.boardList(vo);
			model.addAttribute("list", list); 
		return "board/writing/boardList";
	}
	//자유게시판 작성페이지
	@RequestMapping("/board/writing/boardWrite.do") 
	public String boardWrite() {
		return "board/writing/boardWrite";
	}
	//자유게시판 작성
	@RequestMapping("/board/writing/boardInsert.do")
	public String boardInsert(BoardVO vo) {
		bService.boardInsert(vo);
		return "redirect:/board/writing/boardList.do";
	}
	//자유게시판 상세보기
	@RequestMapping("/board/writing/boardWriteView.do") 
	public String boardWriteView(@RequestParam("post_id")int post_id, Model model) {
		BoardVO vo = bService.boardView(post_id);
		ReplyVO rv = new ReplyVO();
		rv.setBoard_id(vo.getBoard_id());
		rv.setPost_id(post_id);
		List<ReplyVO> rList = rService.replyList(rv);
		
		model.addAttribute("vo", vo);
		model.addAttribute("rList", rList);
	
		return "board/writing/boardWriteView";
	}
	//자유게시판 삭제
	@RequestMapping("/board/writing/boardDelete.do")
	public String boardDelete(@RequestParam("post_id")int post_id) {
		return "redirect:/board/writing/boardList.do";
	}
	
}
