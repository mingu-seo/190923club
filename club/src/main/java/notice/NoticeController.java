package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import category.CategoryVO;
import file.FileVO;
import joinSpot.JoinSpotService;
import member.MemberVO;
import reply.ReplyService;
import reply.ReplyVO;

@Controller
public class NoticeController {

	
	@Autowired
	NoticeService nService;
	
	@Autowired
	ReplyService rService;
	
	@Autowired
	private file.FileService fService;
	
	@Autowired
	private category.CategoryService cService;
	
	@Autowired
	private JoinSpotService joinSpotService;
	
	
	
	
	//공지사항 목록 페이지
	@RequestMapping("/board/notice/noticeList.do") 
	public String noticeList(NoticeVO vo, Model model, CategoryVO cVO, @RequestParam("spot_num") String spot_num, HttpServletRequest request) {
		
		List<NoticeVO> list = nService.noticeList(vo);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		int[] listcount = nService.noticeCount(vo); //전체 갯수와 총페이지수
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		
		MemberVO searchVO = new MemberVO();
		searchVO.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(searchVO);   										// 리더 값뿌리기
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv==null ? 0 : uv.getNum();														// 회원 체크(추가된부분)
		int joinSpotCnt = joinSpotService.checkJoinSpot(member_num, (Integer.parseInt(spot_num)));	// 회원 체크(추가된부분)
		
		model.addAttribute("categoryList", categoryList);		
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("vo",vo);
		model.addAttribute("lvo",lvo);
		model.addAttribute("joinSpotCnt",joinSpotCnt);
		
		//더보기 클릭했을 때 카테고리가 없으면 alert창 띄우고 리턴
		String msg = "";
		String url = "";
		if(cVO.getCategory_id() == 0) {
			msg = "아직 카테고리가 생성되지 않았습니다.\\n 관리자에게 문의하세요.";
			url = "/board/submain/boardmain.do?spot_num="+spot_num;
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "include/alert";
		} else {
			return "board/notice/noticeList";
		}
	}
	//공지사항 작성페이지
	@RequestMapping("/board/notice/noticeWrite.do")
	public String noticeWrite(Model model, CategoryVO cVO, NoticeVO vo, @RequestParam("spot_num") String spot_num, HttpServletRequest request) {
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		MemberVO searchVO = new MemberVO();
		searchVO.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(searchVO);   										// 리더 값뿌리기
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv==null ? 0 : uv.getNum();														// 회원 체크(추가된부분)
		int joinSpotCnt = joinSpotService.checkJoinSpot(member_num, (Integer.parseInt(spot_num)));	// 회원 체크(추가된부분)
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("spot_num", spot_num);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("vo", vo);
		model.addAttribute("lvo", lvo);
		model.addAttribute("joinSpotCnt", joinSpotCnt);
		return "board/notice/noticeWrite";
	}
	
	//공지사항 작성
	@RequestMapping("/board/notice/noticeInsert.do") 
	public String noticeInsert(NoticeVO vo, HttpServletRequest req, 
			@RequestParam("file_tmp") MultipartFile file,
			@RequestParam("spot_num") String spot_num) {
		
		int post_id = nService.noticeInsert(vo);
		
		//글 등록하고 pk가져와서 파일등록할때 씀
		FileVO fv = new FileVO();
		fv.setBoard_id(vo.getBoard_id());
		fv.setPost_id(post_id);
		fService.fileInsert(fv, file, req);
		
		
		return "redirect:/board/notice/noticeList.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id();
	}
	//공지사항 상세보기 페이지
	@RequestMapping("/board/notice/noticeWriteView.do") 
	public String noticeWriteView(Model model, NoticeVO vo, CategoryVO cVO, @RequestParam("spot_num")String spot_num, HttpServletRequest request) {
		NoticeVO nvo = nService.noticeView(vo);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		model.addAttribute("categoryList", categoryList);
		
		MemberVO searchVO = new MemberVO();
		searchVO.setSpot_num(Integer.parseInt(spot_num));
		MemberVO lvo = joinSpotService.spotLeader(searchVO);   										// 리더 값뿌리기
		MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
		int member_num = uv==null ? 0 : uv.getNum();														// 회원 체크(추가된부분)
		int joinSpotCnt = joinSpotService.checkJoinSpot(member_num, (Integer.parseInt(spot_num)));	// 회원 체크(추가된부분)
		
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
		model.addAttribute("lvo", lvo);
		model.addAttribute("joinSpotCnt", joinSpotCnt);
		
		return "board/notice/noticeWriteView";
	}	
	
	//공지사항 삭제하기
	@RequestMapping("/board/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam("post_id")int post_id, NoticeVO vo, @RequestParam("spot_num")String spot_num) {
		nService.noticeDelete(post_id);
		return "redirect:/board/notice/noticeList.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id();
	}
	//공지사항 수정하기 페이지
	@RequestMapping("/board/notice/noticeUpdateForm.do")
	public String noticeUpdateForm(NoticeVO vo,CategoryVO cVO, Model model, @RequestParam("spot_num")String spot_num) {
		NoticeVO nvo = nService.noticeView(vo);
		List<CategoryVO>[] categoryList = cService.categoryList(cVO);
		CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
		
		model.addAttribute("nvo", nvo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("spot_num",spot_num);
		
		return "board/notice/noticeUpdateForm";
	}
	//공지사항 수정
	@RequestMapping("/board/notice/noticeUpdate.do")
	public String noticeUpdate(NoticeVO vo, 
			HttpServletRequest req, 
			@RequestParam("file_tmp") MultipartFile file, 
			@RequestParam("spot_num")String spot_num) {
		
		//글 등록하고 pk가져와서 파일등록할때 씀
		FileVO fv = new FileVO();
		fv.setBoard_id(vo.getBoard_id());
		fv.setPost_id(vo.getPost_id()); 
		fService.fileUpdate(fv, file, req);
		
		nService.noticeUpdate(vo, file, req);
		return "redirect:/board/notice/noticeWriteView.do?spot_num="+spot_num+"&category_id="+vo.getCategory_id()+"&post_id="+vo.getPost_id();
	}
	
	
}
