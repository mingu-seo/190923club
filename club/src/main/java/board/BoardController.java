package board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/board/submain/submain.do")
	public String subMain() {
		return "board/submain/submain";
	}
	
	@RequestMapping("/board/submain/boardmain.do") 
	public String boardMain() {
		return "board/submain/boardmain";
	}

	@RequestMapping("/board/submain/admincategory.do")
	public String adminCategory() {
		return "board/submain/adminCategory";
	}
	
	@RequestMapping("/board/writing/boardList.do") 
	public String boardList() {
		return "board/writing/boardList";
	}
	
	@RequestMapping("/board/writing/boardWrite.do") 
	public String boardWrite() {
		return "board/writing/boardWrite";
	}
	
	@RequestMapping("/board/writing/boardWriteView.do") 
	public String boardWriteView() {
		return "board/writing/boardWriteView";
	}
	
	@RequestMapping("/board/gallary/gallaryWrite.do") 
	public String gallaryWrite() {
		return "board/gallary/gallaryWrite";
	}

	@RequestMapping("/board/gallary/gallaryList.do") 
	public String gallaryList() {
		return "board/gallary/gallaryList";
	}
	
	@RequestMapping("/board/notice/noticeList.do") 
	public String noticeList() {
		return "board/notice/noticeList";
	}
	
	@RequestMapping("/board/notice/noticeWrite.do") 
	public String noticeWrite() {
		return "board/notice/noticeWrite";
	}
	
	@RequestMapping("/board/notice/noticeWriteView.do") 
	public String noticeWriteView() {
		return "board/notice/noticeWriteView";
	}
	
}
