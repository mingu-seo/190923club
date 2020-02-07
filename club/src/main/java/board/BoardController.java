package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.CategoryVO;
import gallery.GalleryVO;
import notice.NoticeVO;
import reply.ReplyVO;
import spot.SpotService;
import spot.SpotVO;



@Controller
public class BoardController {
	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private notice.NoticeService nService;
	
	@Autowired
	private gallery.GalleryService gService;
	
	@Autowired
	private reply.ReplyService rService;
	
	@Autowired
	private SpotService spotService;
	
	@Autowired
	private category.CategoryService cService;
	
	//서브메인 페이지
	@RequestMapping("/board/submain/submain.do")
	public String subMain(Model model, @RequestParam("spot_num") String spot_num) {
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		return "board/submain/submain";
	}
	//게시판 관리 페이지
	@RequestMapping("/board/submain/admincategory.do")
	public String adminCategory(Model model,@RequestParam("spot_num") String spot_num, CategoryVO vo) {
		//카테고리 리스트 가져오기
		List<CategoryVO> gcList = cService.gCategoryList(vo);
		List<CategoryVO> wcList = cService.wCategoryList(vo);
		List<CategoryVO> ncList = cService.nCategoryList(vo);
		
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("gcList", gcList);
		model.addAttribute("wcList", wcList);
		model.addAttribute("ncList", ncList);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("spot_num", spot_num);
		return "board/submain/adminCategory";
	}
	//게시판 메인 페이지
	@RequestMapping("/board/submain/boardmain.do") 
	public String boardMain(NoticeVO vo, Model model, BoardVO bVO, GalleryVO gvo, @RequestParam("spot_num") String spot_num) {
		List<NoticeVO> nlist = nService.mainNoticeList(vo);
		List<BoardVO> bList = bService.mainBoardList(bVO);
		
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		
		
		List<GalleryVO> glist = gService.mainGalleryList(gvo);
		model.addAttribute("gvo", gvo);
		model.addAttribute("glist", glist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("bList", bList);
		return "board/submain/boardmain";
	}
	
	//자유게시판 목록페이지
	@RequestMapping("/board/writing/boardList.do") 
	public String boardList(Model model, 
			HttpServletRequest req, 
			BoardVO vo, @RequestParam("spot_num") String spot_num) {
			
			List<BoardVO> list = boardDao.boardList(vo);
			
			SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
			model.addAttribute("spot_num", spot_num);
			model.addAttribute("spot_vo", spotvo);
			
			model.addAttribute("list", list);
			model.addAttribute("vo",vo);
		return "board/writing/boardList";
	}
	
	//자유게시판 작성페이지
	@RequestMapping("/board/writing/boardWrite.do") 
	public String boardWrite(Model model, @RequestParam("spot_num") String spot_num) {
		
		//스팟번호
		model.addAttribute("spot_num", spot_num);
		
		return "board/writing/boardWrite";
	}
	//자유게시판 작성
	@RequestMapping("/board/writing/boardInsert.do")
	public String boardInsert(Model model, BoardVO vo, @RequestParam("spot_num")String spot_num) {
		bService.boardInsert(vo);
		model.addAttribute("spot_num",spot_num);
		return "redirect:/board/writing/boardList.do?spot_num"+spot_num;
	}
	//자유게시판 상세보기
	@RequestMapping("/board/writing/boardWriteView.do") 
	public String boardWriteView(@RequestParam("post_id")int post_id, Model model, @RequestParam("spot_num") String spot_num) {
		BoardVO vo = bService.boardView(post_id);
		
		ReplyVO rv = new ReplyVO();
		rv.setBoard_id(vo.getBoard_id());
		rv.setPost_id(post_id);
		//댓글리스트
		List<ReplyVO> rList = rService.replyList(rv);
		
		//스팟번호
		model.addAttribute("spot_num", spot_num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("rList", rList);
	
		return "board/writing/boardWriteView";
	}
	//자유게시판 수정 페이지
	@RequestMapping("/board/writing/boardUpdateForm.do")
	public String boardUpdateView(Model model, @RequestParam("post_id")int post_id, @RequestParam("spot_num") String spot_num) {
		BoardVO vo = bService.boardView(post_id);
		model.addAttribute("vo", vo);
		
		//스팟번호
		model.addAttribute("spot_num", spot_num);
		
		return "board/writing/boardUpdateForm";
	}
	
	//자유게시판 수정
	@RequestMapping("/board/writing/boardUpdate.do")
	public String boardUpdate(BoardVO vo, @RequestParam("spot_num")String spot_num) {
		bService.boardUpdate(vo);
		return "redirect:/board/writing/boardWriteView.do?spot_num="+spot_num+"&board_id=2&post_id="+vo.getPost_id();
	}
	//자유게시판 삭제
	@RequestMapping("/board/writing/boardDelete.do")
	public String boardDelete( @RequestParam("post_id")int post_id, @RequestParam("spot_num")String spot_num) {
		bService.boardDelete(post_id);
		return "redirect:/board/writing/boardList.do?spot_num="+spot_num+"&board_id=2";
	}
	
}
