package adminSpot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import adminQna.AdminQnaVO;
import spot.SpotDAO;
import spot.SpotService;
import spot.SpotVO;
import spotCategory.SpotCategoryService;
import spotCategory.SpotCategoryVO;

@Controller
public class AdminSpotController {

	@Autowired
	private SpotService spotService;

	@Autowired
	private SpotCategoryService spotCategoryService;
	
	@Autowired
	private SpotDAO spotDao;
	
	// spot 관리
	@RequestMapping("/admin/spot/spotList.do")
	public String adminSpotList(Model model ,SpotCategoryVO vo,SpotVO spotvo) {
		int[] listCount = spotService.count(spotvo);
		List<SpotCategoryVO> list = spotCategoryService.spotCategoryList(vo);
		List<SpotVO> spotArticle = spotService.spotList(spotvo);
		model.addAttribute("listCount", listCount[0]);
		model.addAttribute("totalpage", listCount[1]);
		
		model.addAttribute("spot",spotArticle);
		model.addAttribute("spotvo",spotvo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);		
		return "admin/spot/spotList";
	}
	
	//HOT SPOT Ajax 
	@RequestMapping("/admin/spot/spotAjax.do")
	public String adminSpotView(Model model, @RequestParam("num") int num) {
		SpotVO spotvo = spotService.spotView(num);
		model.addAttribute("spotvo", spotvo);
		return "admin/spot/spotAjax";
		
	}	
	

	//HOT SPOT 수정 폼
	@RequestMapping("/admin/spot/UpdateForm.do")
	
	public String adminSpotUpdateForm(Model model, @RequestParam("num") int num) {
		SpotVO spotvo = spotService.spotView(num);
		model.addAttribute("vo",spotvo);
		return "spot/spotUpdateForm";
	}
	
	//HOT SPOT 수정하기
	@RequestMapping("/admin/spot/Update.do")
	public String adminSpotUpdate(SpotVO spotvo, @RequestParam("filename_tmp") MultipartFile file, HttpServletRequest request) {
		spotService.spotUpdate(spotvo, file, request);
		return "redirect:/spot/spotList.do";
	}
	
	//HOT SPOT 삭제하기
	@RequestMapping("/admin/spot/spotDelete.do")
	public String adminSpotDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		spotService.spotDelete(num);
		return "redirect:/admin/spot/spotList.do";
	}
	
	@RequestMapping("/admin/spot/nameCheck.do")
	public String nameCheck(Model model, @RequestParam("name") String name) {
		int cnt = spotService.nameCheck(name);
		model.addAttribute("value", cnt);
		return "spot/include/return";
	}
}
