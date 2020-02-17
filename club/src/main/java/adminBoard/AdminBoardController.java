package adminBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import category.CategoryVO;
import gallery.GalleryVO;
import joinSpot.JoinSpotService;
import member.MemberVO;
import notice.NoticeVO;
import reply.ReplyVO;
import spot.SpotService;
import spot.SpotVO;



@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService bService;
	
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
	
	@Autowired
	private JoinSpotService joinSpotService;

	
	//서브메인 페이지
	@RequestMapping("/admin/submain/submain.do")
	public String adminSubMain(Model model, @RequestParam("spot_num") String spot_num, HttpSession session) {
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		return "admin/submain/submain";
	}
	//게시판 관리 페이지
	@RequestMapping("/admin/submain/admincategory.do")
	public String adminBoardCategory(Model model,@RequestParam("spot_num") String spot_num, CategoryVO cVO) {
		//카테고리 리스트 가져오기
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("cVO", cVO);
		model.addAttribute("spot_num", spot_num);
		return "admin/submain/adminCategory";
	}
	//게시판 메인 페이지
	@RequestMapping("/admin/submain/boardmain.do") 
	public String adminBoardMain(NoticeVO vo, Model model, AdminBoardVO bVO, GalleryVO gvo, @RequestParam("spot_num") String spot_num) {
		List<NoticeVO> nlist = nService.mainNoticeList(vo);
		List<AdminBoardVO> bList = bService.mainBoardList(bVO);
		List<GalleryVO> glist = gService.mainGalleryList(gvo);
		CategoryVO cate_minNum = cService.cateMin_num(Integer.parseInt(spot_num));
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		
		model.addAttribute("spot_vo", spotvo); //스팟 번호
		model.addAttribute("cate_minNum", cate_minNum); //카테고리이름
		model.addAttribute("spot_num", spot_num); 
		model.addAttribute("glist", glist); //갤러리 리스트
		model.addAttribute("bList", bList); //게시판 리스트
		model.addAttribute("nlist", nlist); //공지사항 리스트
		
		return "admin/submain/boardmain";
	}
	
	//자유게시판 목록페이지
	@RequestMapping("/admin/submain/boardList.do") 
	public String adminBoardList(Model model, 
			HttpServletRequest req, 
			AdminBoardVO vo, CategoryVO cVO, @RequestParam("spot_num") String spot_num) {
			
			List<AdminBoardVO> list = bService.boardList(vo);
			List<CategoryVO>[] categoryList = cService.categoryList(cVO); //Left메뉴에서 쓸 기능
			CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
			int[] listcount = bService.boardCount(vo); //전체 갯수와 총페이지수
			SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
			
			model.addAttribute("list", list);
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cate_name", cate_name);
			model.addAttribute("listcount", listcount[0]);
			model.addAttribute("totalpage", listcount[1]);
			model.addAttribute("spot_vo", spotvo);
			model.addAttribute("spot_num", spot_num);
			model.addAttribute("vo",vo);
			
			String msg = "";
			String url = "";
			
			//더보기 클릭했을 때 카테고리가 없으면 alert창 띄우고 리턴
			if(vo.getCategory_id() == 0) {
				msg = "아직 카테고리가 생성되지 않았습니다.\\n 관리자에게 문의하세요.";
				url = "/admin/submain/boardmain.do?spot_num="+spot_num;
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "include/alert";
			} else {
				return "admin/submain/boardList";
			}
	}
	


	//자유게시판 상세보기
	@RequestMapping("/admin/submain/boardWriteView.do") 
	public String adminBoardWriteView(@RequestParam("post_id")int post_id, CategoryVO cVO, Model model, @RequestParam("spot_num") String spot_num) {
		AdminBoardVO vo = bService.boardView(post_id);
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
	
		return "admin/submain/boardWriteView";
	}

	// spot 회원 리스트
	@RequestMapping("/admin/submain/memberList.do")
	public String adminMemberList(MemberVO vo, Model model, @RequestParam("spot_num") String spot_num) {
		int[] listcount = joinSpotService.pageCount(vo);	// 전체 갯수
		List<MemberVO> list = joinSpotService.spotMemberList(vo);
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("memberList", list);
		model.addAttribute("vo", vo);
		return "admin/submain/memberList";
	}
	
	
}
