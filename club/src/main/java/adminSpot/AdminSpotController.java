package adminSpot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spot.SpotDAO;
import spot.SpotService;
import spot.SpotVO;

@Controller
public class AdminSpotController {

	@Autowired
	private SpotService spotService;

	@Autowired
	private SpotDAO spotDao;
	
	// spot 관리
	@RequestMapping("/admin/spot/spotList.do")
	public String adminSpotList() {
		return "admin/spot/spotList";
	}
	
	//HOT SPOT 등록 폼
	@RequestMapping("/admin/spot/spotRegist.do")
	public String adminSpotWrite() {
		return "spot/spotRegistForm";
	}
	
	//HOT SPOT 등록
	@RequestMapping("/admin/spot/spotInsert.do")
	public String adminSpotInsert(Model model,SpotVO spotvo, @RequestParam("filename_tmp") MultipartFile file , HttpServletRequest request) {
		int r = spotService.spotInsert(spotvo, file,request);
		model.addAttribute("list", spotvo);
		//if(r < 0)	
		return "board/submain/submain";
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
	@RequestMapping("/admin/spot/Delete.do")
	public String adminSpotDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		spotService.spotDelete(num);
		return "redirect:/spot/spotList.do";
	}
	
	@RequestMapping("/admin/spot/nameCheck.do")
	public String nameCheck(Model model, @RequestParam("name") String name) {
		int cnt = spotService.nameCheck(name);
		model.addAttribute("value", cnt);
		return "spot/include/return";
	}
}
