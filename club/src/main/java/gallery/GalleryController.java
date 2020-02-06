package gallery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		
		//갤러리 목록 페이지
		@RequestMapping("/board/gallery/galleryList.do") 
		public String galleryList(Model model, GalleryVO vo, @RequestParam("board_id")int board_id, @RequestParam("spot_num") int num) {
				List<GalleryVO> list = galleryDao.galleryList(vo);
				model.addAttribute("list", list); 
				//스팟번호
				SpotVO spot_vo = spotService.spotView(num);
				model.addAttribute("spot_vo", spot_vo);
				model.addAttribute("spot_num", num+"");
				
			return "board/gallery/galleryList";
		}
		
		
		//갤러리 작성페이지
		@RequestMapping("/board/gallery/galleryWrite.do") 
		public String galleryWrite() {
			return "board/gallery/galleryWrite";
		}
		
		//갤러리 작성
		@RequestMapping("/board/gallery/galleryInsert.do")
		public String galleryInsert(GalleryVO vo, @RequestParam("image_tmp") MultipartFile file, @RequestParam("image_tmp2") MultipartFile file2, @RequestParam("image_tmp3") MultipartFile file3, HttpServletRequest request, @RequestParam("board_id") int board_id) {
			gService.galleryInsert(vo, file, file2, file3, request, board_id);
			return "redirect:/board/gallery/galleryList.do";
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
			public String galleryDelete(GalleryVO vo) {
			gService.galleryDelete(vo);
			return "redirect:/board/gallery/galleryList.do";
			}
			
		//갤러리 수정
		@RequestMapping("/board/gallery/galleryEdit.do") 
		public String galleryEdit(Model model, @RequestParam("post_id") int id) {
			GalleryVO vo = gService.galleryView(id);
			model.addAttribute("vo", vo);
			return "board/gallery/galleryEdit";
		}
		
		//갤러리 업데이트
				@RequestMapping("/board/gallery/galleryUpdate.do") 
				public String galleryUpdate(GalleryVO vo, @RequestParam("image_tmp") MultipartFile file, @RequestParam("image_tmp2") MultipartFile file2, @RequestParam("image_tmp3") MultipartFile file3, HttpServletRequest request) {
				gService.galleryUpdate(vo, file, file2, file3, request);
				return "redirect:/board/gallery/galleryList.do";
				}
		

				@RequestMapping("/board/gallery/galleryPre.do")
				public String galleryPre(Model model, @RequestParam("post_id") int id) {
					GalleryVO vo = gService.galleryPre(id);
					model.addAttribute("vo", vo);
					return "board/gallery/galleryAjax";
				}
				@RequestMapping("/board/gallery/galleryNext.do")
				public String galleryNext(Model model, @RequestParam("post_id") int id) {
					GalleryVO vo = gService.galleryNext(id);
					model.addAttribute("vo", vo);
					return "board/gallery/galleryAjax";
				}

}
