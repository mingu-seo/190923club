package spotCategory;

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
public class SpotCategoryController {
	@Autowired
	private SpotCategoryDAO spotCategoryDao;
	
	@Autowired
	private SpotCategoryService spotCategoryService;
	
	@Autowired
	private SpotService spotService;
	
	//카테고리 등록 폼
	@RequestMapping("/admin/category/categoryRegistForm.do")
	public String spotCategoryWirte() {
		return "admin/category/categoryWriteForm";
	}
	
	//카테고리 등록
	@RequestMapping("/admin/category/categoryRegist.do")
	public String spotCategoryInsert(SpotCategoryVO vo,@RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		spotCategoryService.spotCategoryInsert(vo,file,request);
		return "redirect:/admin/category/categoryList.do";
	}
	//카테고리 리스트 보기
	@RequestMapping("/admin/category/categoryList.do")
	public String spotCategoryList(Model model, SpotCategoryVO vo) {
		List<SpotCategoryVO> list = spotCategoryService.spotCategoryList(vo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return "admin/category/categoryList";
	}

	//카테고리 상세보기
	@RequestMapping("/admin/category/categoryAjax.do")
	public String spotCategoryView(Model model,@RequestParam(name="page",required=false) String page, @RequestParam("num") int num) {
		SpotCategoryVO vo = spotCategoryService.spotCategoryView(num);
		model.addAttribute("list", vo);
		model.addAttribute("nowPage", page);
		return "admin/category/categoryAjax";
		
	}
	
	//카테고리 수정 폼
	@RequestMapping("/admin/category/categoryUpdateForm.do")
	
	public String spotCategoryUpdateForm(Model model, @RequestParam("num") int num) {
		SpotCategoryVO vo = spotCategoryService.spotCategoryView(num);
		model.addAttribute("vo",vo);
		return "admin/category/categoryUpdateForm";
	}
	//카테고리 수정하기
	@RequestMapping("/admin/category/categoryUpdate.do")
	public String spotCategoryUpdate(SpotCategoryVO vo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		spotCategoryService.spotCategoryUpdate(vo, file, request);

		return "redirect:/admin/category/categoryList.do";
	}
	
	//카테고리 삭제하기
	@RequestMapping("/admin/category/categoryDelete.do")
	public String spotCategoryDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		spotCategoryService.spotCategoryDelete(num);
		return "redirect:/admin/category/categoryList.do";
	}
	

	//유저에게 보여주는 리스트 -----------------------------------
	@RequestMapping("/spot/categoryCheck.do")
	public String userSpotCategoryList(Model model, SpotCategoryVO vo) {
		List<SpotCategoryVO> list = spotCategoryService.spotCategoryList(vo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return "/spot/spotChoice";
	}
	//유저가 보는 spotCategory 선택 뷰
	@RequestMapping("/spot/spotList.do")
	public String userSpotList(Model model, SpotCategoryVO vo,SpotVO spotvo) {
		List<SpotCategoryVO> list = spotCategoryService.spotCategoryList(vo);
		List<SpotVO> spotArticle = spotService.spotList(spotvo);
		model.addAttribute("spot",spotArticle);
		model.addAttribute("spotvo",spotvo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return "/spot/spotList";
	}
	
	@RequestMapping("/spot/spotAjax.do")
	public String spotAjax(Model model, @RequestParam("category_num") int category_num) {
		List<SpotVO> spotArticle = spotCategoryService.spotAjax(category_num);
		model.addAttribute("spot",spotArticle);
		return "/spot/spotAjax";
	}

}
