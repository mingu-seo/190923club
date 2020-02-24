package adminBoard;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardVO;
import calendar.CalendarDAO;
import calendar.CalendarService;
import calendar.CalendarVO;
import calendar.ScheduleVO;
import category.CategoryVO;
import file.FileVO;
import gallery.GalleryDAO;
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
	GalleryDAO galleryDao;
	
	@Autowired
	private CalendarDAO calendarDAO;	
	@Autowired
	private board.BoardService bService;
	
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
	
	@Autowired
	private file.FileService fService;

	@Autowired
	private CalendarService calService;
	
	//서브메인 페이지
	@RequestMapping("/admin/submain/submain.do")
	public String adminSubMain(Model model, @RequestParam("spot_num") String spot_num, HttpSession session, MemberVO vo) {
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		
		
		MemberVO lvo = joinSpotService.spotLeader(vo);	
		int listcount = joinSpotService.membercount(vo);
		model.addAttribute("listcount", listcount);
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("lvo", lvo);
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
	public String adminBoardMain(NoticeVO vo, Model model, BoardVO bVO, GalleryVO gvo, @RequestParam("spot_num") String spot_num ) {
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
		return "admin/submain/boardmain";
	}
	
	//자유게시판 목록페이지
	@RequestMapping("/admin/submain/boardList.do") 
	public String adminBoardList(Model model, 
			HttpServletRequest req, 
			BoardVO vo, CategoryVO cVO, @RequestParam("spot_num") String spot_num) {
			
			List<BoardVO> list = bService.boardList(vo);
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
	
	//갤러리 목록 페이지
	@RequestMapping("/admin/submain/galleryList.do") 
	public String adminGalleryList(Model model, GalleryVO vo, @RequestParam("spot_num") int num, CategoryVO cVO) {
			List<GalleryVO> list = galleryDao.galleryList(vo);
			List<CategoryVO>[] categoryList = cService.categoryList(cVO); //Left메뉴에서 쓸 기능
			CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
			
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cate_name", cate_name);
			model.addAttribute("list", list); 
			model.addAttribute("vo", vo); 
			//스팟번호
			SpotVO spot_vo = spotService.spotView(num);
			model.addAttribute("spot_vo", spot_vo);
			model.addAttribute("spot_num", num+"");
			
			//더보기 클릭했을 때 카테고리가 없으면 alert창 띄우고 리턴
			String msg = "";
			String url = "";
			if(vo.getCategory_id()== 0) {
				msg = "아직 카테고리가 생성되지 않았습니다.\\n 관리자에게 문의하세요.";
				url = "/admin/submain/boardmain.do?spot_num="+num;
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "include/alert";
			} else {
				return "/admin/submain/galleryList";
			}
			
	}	
	
	//갤러리 수정페이지에서 이미지 삭제(업데이트)
	@RequestMapping("/admin/submain/deleteImage.do") 
	public String admindeleteImage(Model model, GalleryVO vo, @RequestParam("post_id") int post_id, @RequestParam("cname") String cname) {
		gService.galleryUpgrade(post_id, cname);
		return "redirect:/admin/submain/galleryEdit.do?spot_num="+vo.getSpot_num()+"&board_id="+vo.getBoard_id()+"&post_id="+post_id+"&category_id="+vo.getCategory_id();
	}
	
	//갤러리 이전포토
	@RequestMapping("/admin/submain/galleryPre.do")
	public String adminGalleryPre(Model model, @RequestParam("post_id") int id) {
		GalleryVO vo = gService.galleryPre(id); 
		model.addAttribute("vo", vo);
		return "/admin/submain/galleryAjax";
	}
		
	//갤러리 다음포토
	@RequestMapping("/admin/submain/galleryNext.do")
	public String adminGalleryNext(Model model, @RequestParam("post_id") int id) {
		GalleryVO vo = gService.galleryNext(id);
		model.addAttribute("vo", vo);
		return "/admin/submain/galleryAjax";
	}
	//갤러리 ajax
	@RequestMapping("/admin/submain/galleryAjax.do")
	public String adminGalleryAjax(Model model, @RequestParam("id") int id) {
		GalleryVO vo = gService.galleryView(id);
		model.addAttribute("vo", vo);
		return "/admin/submain/galleryAjax"; 
	}
	
	//갤러리삭제
	@RequestMapping("/admin/submain/galleryDelete.do")
	public String adminGalleryDelete(GalleryVO vo, @RequestParam("board_id")int board_id, @RequestParam("spot_num") int num) {
		gService.galleryDelete(vo, board_id);
		return "redirect:/admin/submain/galleryList.do?spot_num="+num+"&board_id="+board_id+"&category_id="+vo.getCategory_id();
	}
		
	
	//공지사항 목록 페이지
	@RequestMapping("/admin/submain/noticeList.do") 
	public String adminNoticeList(NoticeVO vo, Model model, CategoryVO cVO, @RequestParam("spot_num") String spot_num) {
		
		List<NoticeVO> list = nService.noticeList(vo);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		int[] listcount = nService.noticeCount(vo); //전체 갯수와 총페이지수
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("vo",vo);
		
		//더보기 클릭했을 때 카테고리가 없으면 alert창 띄우고 리턴
		String msg = "";
		String url = "";
		if(cVO.getCategory_id() == 0) {
			msg = "아직 카테고리가 생성되지 않았습니다.\\n 관리자에게 문의하세요.";
			url = "/admin/submain/boardmain.do?spot_num="+spot_num;
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} else {
			return "/admin/submain/noticeList";
		}
	}
	//공지사항 상세보기 페이지
	@RequestMapping("/admin/submain/noticeWriteView.do") 
	public String adminNoticeWriteView(Model model, NoticeVO vo, CategoryVO cVO, @RequestParam("spot_num")String spot_num) {
		NoticeVO nvo = nService.noticeView(vo);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		model.addAttribute("categoryList", categoryList);
		
		//댓글
		ReplyVO rv = new ReplyVO();
		rv.setBoard_id(vo.getBoard_id());
		rv.setPost_id(vo.getPost_id());
		
		List<ReplyVO> rList = rService.replyList(rv);
		
		//파일 선택
		FileVO param_fvo = new FileVO();
		param_fvo.setPost_id(vo.getPost_id());
		param_fvo.setBoard_id(vo.getBoard_id());
		System.out.println(param_fvo);
		FileVO fv = fService.fileSelect(param_fvo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("nvo",nvo);
		model.addAttribute("fv",fv);
		model.addAttribute("rList", rList);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("spot_num", spot_num);
		
		return "admin/submain/noticeWriteView";
	}	
	
	//공지사항 삭제하기
	@RequestMapping("/admin/submain/noticeDelete.do")
	public String adminNoticeDelete(@RequestParam("post_id")int post_id, NoticeVO vo, @RequestParam("spot_num")String spot_num) {
		nService.noticeDelete(post_id);
		return "redirect:/admin/submain/noticeList.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id();
	}
	
	// 달력화면 
	@RequestMapping("/admin/submain/calendarmain.do")
	public String adminIndex(Model model, 
			@RequestParam(name="yearmonth", required=false) String yearmonth,
			@RequestParam("spot_num") String spot_num,
			HttpSession session, HttpServletRequest request, MemberVO vo) {

		MemberVO uv = new MemberVO();					// 회원 체크(추가된부분)
		uv.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(uv);										// 리더 값뿌리기
		model.addAttribute("lvo", lvo);
		
		int listcount = joinSpotService.membercount(vo);
		model.addAttribute("listcount", listcount);		
		
		SpotVO spotvo = spotService.spotView(Integer.parseInt(spot_num));
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		
		if(yearmonth==null || "".equals(yearmonth)) {
			yearmonth = y + "-" + ((m<10) ? "0"+m : m); 
		}
		List<CalendarVO> list = calendarDAO.selectCalendar(yearmonth);
		
		ScheduleVO svo = new ScheduleVO();
		svo.setSpot_num(Integer.parseInt(spot_num));
		
		
		for (int i=0; i<list.size(); i++) {
			svo.setDate(list.get(i).getToday());
			list.get(i).setSchedule(calService.scheduleList(svo));
		}
		
		// 다음달
		cal.set(Integer.parseInt(yearmonth.substring(0,4)), Integer.parseInt(yearmonth.substring(5,7))-1, 1);
		cal.add ( cal.MONTH, + 1 );
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		String nextMonth = y + "-" + ((m<10) ? "0"+m : m); 
		
		cal.set(Integer.parseInt(yearmonth.substring(0,4)), Integer.parseInt(yearmonth.substring(5,7))-1, 1);
		cal.add ( cal.MONTH, - 1 );
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		String prevMonth = y + "-" + ((m<10) ? "0"+m : m); 
		
		
		model.addAttribute("yearmonth", yearmonth); 
		model.addAttribute("nextMonth", nextMonth); 
		model.addAttribute("prevMonth", prevMonth); 
		model.addAttribute("spot_vo", spotvo);
		model.addAttribute("calendar_list", list);
		model.addAttribute("spot_num", spot_num);
		
		return "admin/submain/calendarMain";
	}
	
	@RequestMapping("/admin/submain/popupContents.do")
	public String adminPopupContents(Model model, ScheduleVO vo) {
		ScheduleVO popCon = calendarDAO.popContents(vo);
		model.addAttribute("popCon", popCon);
		return "admin/submain/popupContents";
	}
	
		
	
	
}
