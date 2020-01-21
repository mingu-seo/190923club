package gallery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class GalleryController {

		@Autowired
		GalleryDAO galleryDao;
		
		@Autowired
		GalleryService gService;
		
		//갤러리 목록 페이지
		@RequestMapping("/board/gallery/galleryList.do") 
		public String galleryList(Model model, HttpServletRequest req, GalleryVO vo) {
				List<GalleryVO> list = galleryDao.galleryList(vo);
				model.addAttribute("list", list); 
			return "board/gallery/galleryList";
		}
		
		
		//갤러리 작성페이지
		@RequestMapping("/board/gallery/galleryWrite.do") 
		public String galleryWrite() {
			return "board/gallery/galleryWrite";
		}
		
		//갤러리 작성
		@RequestMapping("/board/gallery/galleryInsert.do")
		public String galleryInsert(GalleryVO vo, @RequestParam("image_tmp") MultipartFile file, HttpServletRequest request) {
			gService.galleryInsert(vo, file, request);
			return "redirect:/board/gallery/galleryList.do";
		}
		
		//갤러리 ajax
		@RequestMapping("/board/gallery/galleryAjax.do")
		public String dogAjax(Model model, @RequestParam("id") int id) {
			GalleryVO vo = gService.galleryView(id);
			model.addAttribute("vo", vo);
			return "board/gallery/galleryAjax";
		}
}
