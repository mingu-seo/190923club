package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private BoardService bService;
	
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
	public String boardMain() {
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
	//자유게시판 상세보기 페이지
	@RequestMapping("/board/writing/boardWriteView.do") 
	public String boardWriteView(@RequestParam("id_post")int id_post, Model model) {
		BoardVO vo = bService.boardView(id_post);
		model.addAttribute("vo", vo);
		
		return "board/writing/boardWriteView";
	}
	
	
	//갤러리 작성 페이지
	@RequestMapping("/board/gallery/galleryWrite.do") 
	public String galleryWrite() {
		return "board/gallery/galleryWrite";
	}
	
	
	//갤러리 목록 페이지
	@RequestMapping("/board/gallery/galleryList.do") 
	public String galleryList() {
		return "board/gallery/galleryList";
	}
	//공지사항 목록 페이지
	@RequestMapping("/board/notice/noticeList.do") 
	public String noticeList() {
		return "board/notice/noticeList";
	}
	//공지사항 작성페이지
	@RequestMapping("/board/notice/noticeWrite.do") 
	public String noticeWrite() {
		return "board/notice/noticeWrite";
	}
	//공지사항 상세보기 페이지
	@RequestMapping("/board/notice/noticeWriteView.do") 
	public String noticeWriteView() {
		return "board/notice/noticeWriteView";
	}
	
}
