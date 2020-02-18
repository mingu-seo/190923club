package adminBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardDAO;
import board.BoardService;
import board.BoardVO;
import category.CategoryVO;
import gallery.GalleryVO;
import notice.NoticeVO;
import reply.ReplyVO;
import spot.SpotService;
import spot.SpotVO;


@Controller
public class AdminBoardController {
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

	//자유게시판 목록페이지
	@RequestMapping("/admin/board/boardList.do") 
	public String boardList(Model model, 
			HttpServletRequest req, 
			BoardVO vo, CategoryVO cVO) {
			
			List<BoardVO> list = boardDao.boardList(vo);
			List<CategoryVO>[] categoryList = cService.categoryList(cVO);
			CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
			
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cate_name", cate_name);
			model.addAttribute("list", list);
			model.addAttribute("vo",vo);
			
			return "admin/board/boardList";
	}
	
/*
	//자유게시판 상세보기
	@RequestMapping("/board/writing/boardWriteView.do") 
	public String boardWriteView(@RequestParam("post_id")int post_id, CategoryVO cVO, Model model, @RequestParam("spot_num") String spot_num) {
		BoardVO vo = bService.boardView(post_id);
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		ReplyVO rv = new ReplyVO();
		rv.setBoard_id(vo.getBoard_id());
		rv.setPost_id(post_id);
		//댓글리스트
		List<ReplyVO> rList = rService.replyList(rv);
		
		//스팟번호
		model.addAttribute("vo", vo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("rList", rList);
	
		return "board/writing/boardWriteView";
	}

	//자유게시판 삭제
	@RequestMapping("/board/writing/boardDelete.do")
	public String boardDelete( @RequestParam("post_id")int post_id,BoardVO vo, @RequestParam("spot_num")String spot_num) {
		bService.boardDelete(post_id);
		return "redirect:/board/writing/boardList.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id();
	}
*/	
}
