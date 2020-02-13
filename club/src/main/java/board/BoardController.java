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
	public String adminCategory(Model model,@RequestParam("spot_num") String spot_num, CategoryVO cVO) {
		//카테고리 리스트 가져오기
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("cVO", cVO);
		model.addAttribute("spot_num", spot_num);
		return "board/submain/adminCategory";
	}
	//게시판 메인 페이지
	@RequestMapping("/board/submain/boardmain.do") 
	public String boardMain(NoticeVO vo, Model model, BoardVO bVO, GalleryVO gvo, @RequestParam("spot_num") String spot_num) {
		List<NoticeVO> nlist = nService.mainNoticeList(vo);
		List<BoardVO> bList = bService.mainBoardList(bVO);
		List<GalleryVO> glist = gService.mainGalleryList(gvo);
		CategoryVO cate_minNum = cService.cateMin_num(Integer.parseInt(spot_num));
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		
		model.addAttribute("spot_vo", spotvo); //스팟 번호
		model.addAttribute("cate_minNum", cate_minNum); //카테고리이름
		model.addAttribute("spot_num", spot_num); 
		model.addAttribute("glist", glist); //갤러리 리스트
		model.addAttribute("bList", bList); //게시판 리스트
		model.addAttribute("nlist", nlist); //공지사항 리스트
		
		return "board/submain/boardmain";
	}
	
	//자유게시판 목록페이지
	@RequestMapping("/board/writing/boardList.do") 
	public String boardList(Model model, 
			HttpServletRequest req, 
			BoardVO vo, CategoryVO cVO, @RequestParam("spot_num") String spot_num) {
			
			List<BoardVO> list = bService.boardList(vo);
			List<CategoryVO>[] categoryList = cService.categoryList(cVO);
			int[] listcount = bService.boardCount(vo); //전체 갯수와 총페이지수
			CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
			SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
			
			model.addAttribute("list", list);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("listcount", listcount[0]);
			model.addAttribute("totalpage", listcount[1]);
			model.addAttribute("cate_name", cate_name);
			model.addAttribute("spot_vo", spotvo);
			model.addAttribute("spot_num", spot_num);
			model.addAttribute("vo",vo);
			
			String msg = "";
			String url = "";
			
			//더보기 클릭했을 때 카테고리가 없으면 alert창 띄우고 리턴
			if(vo.getCategory_id() == 0) {
				msg = "아직 카테고리가 생성되지 않았습니다.\\n 관리자에게 문의하세요.";
				url = "/board/submain/boardmain.do?spot_num="+spot_num;
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "include/alert";
			} else {
				return "board/writing/boardList";
			}
	}
	
	//자유게시판 작성페이지
	@RequestMapping("/board/writing/boardWrite.do") 
	public String boardWrite(Model model, BoardVO vo, CategoryVO cVO, @RequestParam("spot_num") String spot_num) {
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		//스팟번호
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("vo", vo);
		return "board/writing/boardWrite";
	}
	//자유게시판 작성
	@RequestMapping("/board/writing/boardInsert.do")
	public String boardInsert(Model model, BoardVO vo, @RequestParam("spot_num")String spot_num) {
		bService.boardInsert(vo);
		model.addAttribute("spot_num",spot_num);
		return "redirect:/board/writing/boardList.do?spot_num"+spot_num+"&category_id="+vo.getCategory_id();
	}
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
	//자유게시판 수정 페이지
	@RequestMapping("/board/writing/boardUpdateForm.do")
	public String boardUpdateView(Model model, CategoryVO cVO, @RequestParam("post_id")int post_id, @RequestParam("spot_num") String spot_num) {
		BoardVO vo = bService.boardView(post_id);
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		//스팟번호
		model.addAttribute("vo", vo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("spot_num", spot_num);
		return "board/writing/boardUpdateForm";
	}
	
	//자유게시판 수정
	@RequestMapping("/board/writing/boardUpdate.do")
	public String boardUpdate(BoardVO vo, @RequestParam("spot_num")String spot_num) {
		bService.boardUpdate(vo);
		return "redirect:/board/writing/boardWriteView.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id()+"&post_id="+vo.getPost_id();
	}
	//자유게시판 삭제
	@RequestMapping("/board/writing/boardDelete.do")
	public String boardDelete( @RequestParam("post_id")int post_id,BoardVO vo, @RequestParam("spot_num")String spot_num) {
		bService.boardDelete(post_id);
		return "redirect:/board/writing/boardList.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id();
	}
	
}
