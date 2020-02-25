package gallery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import category.CategoryVO;
import joinSpot.JoinSpotService;
import member.MemberVO;
import spot.SpotService;
import spot.SpotVO;


@Controller
public class GalleryController {

		@Autowired
		GalleryDAO galleryDao;
		
		@Autowired
		GalleryService gService;
		
		@Autowired
		private SpotService spotService;
		
		@Autowired
		private category.CategoryService cService;
		
		@Autowired
		private JoinSpotService joinSpotService;
		
		//갤러리 목록 페이지
		@RequestMapping("/board/gallery/galleryList.do") 
		public String galleryList(Model model, GalleryVO vo, @RequestParam("spot_num") int num, CategoryVO cVO, HttpSession sess, HttpServletRequest request) {
				List<GalleryVO> list = galleryDao.galleryList(vo);
				List<CategoryVO>[] categoryList = cService.categoryList(cVO); //Left메뉴에서 쓸 기능
				CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
				MemberVO searchVO = new MemberVO();
				searchVO.setSpot_num(num);
				MemberVO lvo = joinSpotService.spotLeader(searchVO);   										// 리더 값뿌리기
				MemberVO uv = (MemberVO)request.getSession().getAttribute("sess");					// 회원 체크(추가된부분)
				int member_num = uv==null ? 0 : uv.getNum();														// 회원 체크(추가된부분)
				int joinSpotCnt = joinSpotService.checkJoinSpot(member_num, num);	// 회원 체크(추가된부분)
				
				model.addAttribute("categoryList", categoryList);
				model.addAttribute("cate_name", cate_name);
				model.addAttribute("list", list); 
				model.addAttribute("vo", vo); 
				model.addAttribute("lvo", lvo); 
				model.addAttribute("joinSpotCnt", joinSpotCnt); 
				//스팟번호
				SpotVO spot_vo = spotService.spotView(num);
				model.addAttribute("spot_vo", spot_vo);
				model.addAttribute("spot_num", num+"");
				
				//더보기 클릭했을 때 카테고리가 없으면 alert창 띄우고 리턴
				String msg = "";
				String url = "";
				if(vo.getCategory_id()== 0) {
					msg = "아직 카테고리가 생성되지 않았습니다.\\n 관리자에게 문의하세요.";
					url = "/board/submain/boardmain.do?spot_num="+num;
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					return "include/alert";
				} else {
					return "board/gallery/galleryList";
				}
				
		}
		
		
		//갤러리 작성페이지
		@RequestMapping("/board/gallery/galleryWrite.do") 
		public String galleryWrite(Model model,GalleryVO vo, @RequestParam("spot_num") int num, CategoryVO cVO, HttpSession sess) {
			List<CategoryVO>[] categoryList = cService.categoryList(cVO); //Left메뉴에서 쓸 기능
			CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
			MemberVO searchVO = new MemberVO();
			searchVO.setSpot_num(num);
			MemberVO lvo = joinSpotService.spotLeader(searchVO);   										// 리더 값뿌리기
			
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("vo", vo);
			model.addAttribute("cate_name", cate_name);
			model.addAttribute("spot_num", num+"");
			model.addAttribute("lvo", lvo);
			return "board/gallery/galleryWrite";
		}
		
		//갤러리 작성
		@RequestMapping("/board/gallery/galleryInsert.do")
		public String galleryInsert(GalleryVO vo, @RequestParam("image_tmp") MultipartFile file, @RequestParam("image_tmp2") MultipartFile file2, @RequestParam("image_tmp3") MultipartFile file3, HttpServletRequest request, @RequestParam("board_id") int board_id, @RequestParam("spot_num") int num) {
			gService.galleryInsert(vo, file, file2, file3, request, board_id);
			return "redirect:/board/gallery/galleryList.do?spot_num="+num+"&board_id="+board_id+"&category_id="+vo.getCategory_id();
		}
		
		//갤러리 ajax
		@RequestMapping("/board/gallery/galleryAjax.do")
		public String galleryAjax(Model model, @RequestParam("id") int id) {
			GalleryVO vo = gService.galleryView(id);
			model.addAttribute("vo", vo);
			return "board/gallery/galleryAjax"; 
		}
		
		//갤러리삭제
			@RequestMapping("/board/gallery/galleryDelete.do")
			public String galleryDelete(GalleryVO vo, @RequestParam("board_id")int board_id, @RequestParam("spot_num") int num) {
			gService.galleryDelete(vo, board_id);
			return "redirect:/board/gallery/galleryList.do?spot_num="+num+"&board_id="+board_id+"&category_id="+vo.getCategory_id();
			}
			
		//갤러리 수정
		@RequestMapping("/board/gallery/galleryEdit.do") 
		public String galleryEdit(Model model, @RequestParam("post_id") int id, @RequestParam("spot_num") int num, CategoryVO cVO) {
			List<CategoryVO>[] categoryList = cService.categoryList(cVO); //Left메뉴에서 쓸 기능
			CategoryVO cate_name = cService.cateName_select(cVO.getCategory_id());
			GalleryVO vo = gService.galleryView(id);
			
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("cate_name", cate_name);
			model.addAttribute("vo", vo);
			model.addAttribute("spot_num", num+"");

			return "board/gallery/galleryEdit";
		}
		
		//갤러리 업데이트
		@RequestMapping("/board/gallery/galleryUpdate.do") 
		public String galleryUpdate(Model model, GalleryVO vo, @RequestParam("image_tmp") MultipartFile file, @RequestParam("image_tmp2") MultipartFile file2, @RequestParam("image_tmp3") MultipartFile file3, HttpServletRequest request, @RequestParam("board_id")int board_id, @RequestParam("spot_num") int num) {
			String url = "redirect:/board/gallery/galleryList.do?spot_num="+num+"&board_id="+board_id+"&category_id="+vo.getCategory_id();
		gService.galleryUpdate(vo, file, file2, file3, request, board_id);
		//model.addAttribute("spot_num", num+"");   
		return url;
		}
				
		//갤러리 수정페이지에서 이미지 삭제(업데이트)
		@RequestMapping("/board/gallery/deleteImage.do") 
		public String deleteImage(Model model, GalleryVO vo, @RequestParam("post_id") int post_id, @RequestParam("cname") String cname) {
			gService.galleryUpgrade(post_id, cname);
			return "redirect:/board/gallery/galleryEdit.do?spot_num="+vo.getSpot_num()+"&board_id="+vo.getBoard_id()+"&post_id="+post_id+"&category_id="+vo.getCategory_id();
		}
		
		//갤러리 이전포토
		@RequestMapping("/board/gallery/galleryPre.do")
		public String galleryPre(Model model, @RequestParam("post_id") int id) {
			GalleryVO vo = gService.galleryPre(id); 
			model.addAttribute("vo", vo);
			return "board/gallery/galleryAjax";
		}
				
		//갤러리 다음포토
		@RequestMapping("/board/gallery/galleryNext.do")
		public String galleryNext(Model model, @RequestParam("post_id") int id) {
			GalleryVO vo = gService.galleryNext(id);
			model.addAttribute("vo", vo);
			return "board/gallery/galleryAjax";
		}

}
